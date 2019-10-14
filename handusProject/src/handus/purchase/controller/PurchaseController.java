package handus.purchase.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.auction.service.AuctionService;
import handus.dao.AuctionDao;
import handus.dao.ItemDao;
import handus.dao.StudioDao;
import handus.item.service.ItemService;
import handus.member.service.MemberService;
import handus.model.Auction;
import handus.model.Item;
import handus.model.Studio;
import handus.model.TotalOrder;
import handus.purchase.service.KakaoPayService;
import handus.purchase.service.PurchaseService;
import handus.studio.service.StudioService;

@Component
@RequestMapping("/purchase")
public class PurchaseController {
	@Autowired
	private KakaoPayService kakaoService;
	@Autowired
	private PurchaseService purchaseService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private ItemService itemService;
	@Autowired
	private AuctionService auctionService;
	@Autowired
	private StudioService studioService;

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderPage(HttpSession session, Model model, 
			@RequestParam(required = false) Map<String, Object> products) {
		
		System.out.println("주문 컨트롤러--");
		int memberNum = (int)session.getAttribute("m_pk");
		
		// 요청에서 파라미터로 받아옴 
		// Map<String, Object> products = pNum, pType, pCount, pPrice 
		System.out.println("요청파라미터: "+products);
		boolean isIt = true;
		
		int pNum = Integer.parseInt((String)products.get("pNum"));
		int pType = Integer.parseInt((String)products.get("pType"));
		int pCount = Integer.parseInt((String)products.get("pCount"));
		int pPrice = Integer.parseInt((String)products.get("pPrice"));
		
		// List로 받아오는 products는 그대로 저장 
		List<Map<String, Object>> pList = new ArrayList<Map<String,Object>>();
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("pNum", pNum);
		p.put("pType", pType);
		p.put("pCount", pCount);
		p.put("pPrice", pPrice);
		pList.add(p);
		session.setAttribute("pList", pList );
		
		
		List<Map<String, Object>> productList = new ArrayList<Map<String,Object>>();
		Map<String, Object> product = new HashMap<String, Object>();
		int totalPay = 0;
		
		
		if(isIt) {	// 임시 플래그 isIt 
			
			switch (pType) {
			// 아이템
			case 1:
				Item item = itemService.getItemByNum(pNum);
				Map<String,Object> img = itemService.getItemImage(pNum).get(0);
				product.put("p_name", item.getI_title());
				product.put("p_image", img.get("HI_PK"));
				product.put("p_count", pCount);
				product.put("p_price", (item.getI_price())*pCount);
				totalPay += (item.getI_price())*pCount;
				product.put("p_link", "/item/detail?num="+pNum);
				break;
			// 옥션
			case 2:
				Map<String,Object> auction = auctionService.getAuctionDetail(pNum);
				product.put("p_name", auction.get("A_TITLE"));
				product.put("p_image", auction.get("HI_PK"));
				product.put("p_count", pCount);
				product.put("p_price", ((int)auction.get("A_ENDPRICE"))*pCount);
				totalPay +=  ((int)auction.get("A_ENDPRICE"))*pCount;
				product.put("p_link", "/auction/detail?num="+pNum);
				break;
			// 스튜디오
			case 3:
				Studio studio = studioService.getStudioByNum(pNum);
				Map<String,Object> imgS = studioService.getStudioImage(pNum).get(0);
				
				product.put("p_name", studio.getS_title());
				product.put("p_image", imgS.get("HI_PK"));
				product.put("p_count", pCount);
				product.put("p_price", (studio.getS_price())*pCount);
				totalPay +=  (studio.getS_price())*pCount;
				product.put("p_link", "/studio/detail?num="+pNum);
				break;
			}
		}
		productList.add(product);
		System.out.println("삽입 데이터: "+product);
		
		
		// 총갯수, 총금액을 모델에 담아서 넘기기 (ajax로 따로 불러오기 지양) 
		model.addAttribute("productList", productList);
		model.addAttribute("member", memberService.getMemberByNum(memberNum));
		model.addAttribute("totalPay", totalPay);
		model.addAttribute("totalCount", productList.size());
		
		return "purchase/order";
	}
	
//	@RequestMapping(value = "/order1", method = RequestMethod.POST)
//	public String ordersPage(HttpSession session, Model model,
//			@RequestBody List<Map<String, Object>> products) {
//		// @requestBody로 배열 얻어오기
//		System.out.println(products.get(1).get("name2"));
//		model.addAttribute("member", memberService.getMemberByNum(144));
//		return "purchase/order";
//	}
	
	// 카카오페이 API ------------------------------------------
	@RequestMapping(value = "kakaopay", method = RequestMethod.POST)
	@ResponseBody
	public String kakaoPay(String m_pk, String p_name, String p_count, String p_totalPrice) {
		System.out.println("컨트롤러: 카카오페이");
		Map<String, String> vars = new HashMap<String, String>();
		vars.put("m_pk", m_pk);
		vars.put("p_name", p_name);
		vars.put("p_count", p_count);
		vars.put("p_totalPrice", p_totalPrice);
		vars.put("order_num", purchaseService.getOrderNum());
		
		return kakaoService.getKakaoPayAccess(vars);
	}
	
	@RequestMapping(value = "success", method = RequestMethod.GET)
	@ResponseBody
	public String approval(Model model, String pg_token, String partner_order_id, 
			HttpSession session) {
		int m_pk = (int)session.getAttribute("m_pk");
		
		// 결제승인 api 요청 
		Map<String, String> vars = new HashMap<String, String>();
		vars.put("pg_token", pg_token);
		vars.put("tid", kakaoService.getTid());
		vars.put("partner_order_id", partner_order_id);
		vars.put("partner_user_id", Integer.toString(m_pk));

		System.out.println("컨트롤러: "+vars);
		Map<String, Object> totalInfo = kakaoService.getKakaoPayOn(vars);
		List<Map<String, Object>> pList = (List<Map<String, Object>>)session.getAttribute("pList");
		
		// 리스트 길이만큼 반복하면서 주문 테이블 삽입 
		// 경매, 공방 = 1번 		아이템 = 여러번 
		for(int i = 0; i < pList.size(); i ++) {
			purchaseService.writeOrders(totalInfo, pList.get(i), m_pk);
		}
		
		String orderNum = (String)totalInfo.get("partner_order_id");
		
		System.out.println("결제성공--주문성공페이지로 이동");
		
		return "<script> window.close(); opener.location.href='orderSuccess?orderNum="+orderNum+"';</script>";
	}
	
	@RequestMapping("/orderSuccess")
	public String goSuccess(Model model, String orderNum) {
		Map<String, Object> orderDetail = purchaseService.getOrderDetail(orderNum);
		model.addAttribute("orderDetail", orderDetail);
		return "purchase/success";
	}
	
	@RequestMapping(value = "fail", method = RequestMethod.GET)
	public String fail(Model model, String isCancle) {
		if(isCancle.equals("true")) {
			// 결제 취소
			model.addAttribute("result", "fail");
			model.addAttribute("msg", "결제가 취소되었습니다.");
		}else {
			// 결제 실패  
			model.addAttribute("result", "fail");
			model.addAttribute("msg", "결제에 실패했습니다.");
		}
		return "purchase/fail";
	}
	
	
	// 리뷰 남기기 확인 ----------------------------------------------------------
	
	@RequestMapping("isPurchaseS")
	@ResponseBody
	public boolean isPurchaseS(int s_pk, HttpSession session) {
		int m_pk = (int)session.getAttribute("m_pk");
		return purchaseService.getStudioPurchase(s_pk, m_pk);
	}
	
	@RequestMapping("isPurchaseI")
	@ResponseBody
	public boolean isPurchaseI(int i_pk, HttpSession session) {
		int m_pk = (int)session.getAttribute("m_pk");
		return purchaseService.getItemPurchase(i_pk, m_pk);
	}

}
