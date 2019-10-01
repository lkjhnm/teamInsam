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
		
		int memberNum = 144;  // (int)session.getAttribute("m_pk");
		
		// ▼▼ 장바구니에서 요청파라미터로 받아옴 
		// Map<String, Object> products = pNum, pType, pCount, pPrice 
		System.out.println(products);
		boolean isIt = false;
		
		// List로 받아오는 products는 그대로 저장 
		List<Map<String, Object>> pList = new ArrayList<Map<String,Object>>();
		Map<String, Object> p = new HashMap<String, Object>();
		p.put("pNum", 1);
		p.put("pType", 1);
		p.put("pCount", 2);
		p.put("pPrice", 11000);
		pList.add(p);	// pList.add(products);
		session.setAttribute("pList", pList );
		
		
		List<Map<String, Object>> productList = new ArrayList<Map<String,Object>>();
		Map<String, Object> product = new HashMap<String, Object>();
		int totalPay = 0;
		
		// 임시 데이터 삽입 //
		product.put("p_name", "제품이름1");
		product.put("p_image", "");
		product.put("p_count", 2);
		product.put("p_price", 22000);
		totalPay += 22000; 
		product.put("p_link", "/item/detail?num="+1);
		// 임시 데이터 삽입 // 
		
		if(isIt) {	// 임시 플래그 isIt 
			int pNum = (Integer)products.get("pNum");
			int pType = (Integer)products.get("pType");
			int pCount = (Integer)products.get("pCount");
			
			// 필요 정보 : 이름, 사진, 수량, 금액, 링크 
			// 배열로 들어오면 배열 크기만큼 반복하면서 스위치문 돌기 
			switch (pType) {
			case 1:
				// 아이템
				Item item = itemService.getItemByNum(pNum);
				product.put("p_name", item.getI_title());
				product.put("p_image", "");
				product.put("p_count", pCount);
				product.put("p_price", (item.getI_price())*pCount);
				totalPay += (item.getI_price())*pCount;
				product.put("p_link", "/item/detail?num="+pNum);
				break;
			case 2:
				// 옥션
				Auction auction = auctionService.getAuctionDetail(pNum);
				product.put("p_name", auction.getA_title());
				product.put("p_image", "");
				product.put("p_count", pCount);
				product.put("p_price", (auction.getA_endPrice())*pCount);
				totalPay +=  (auction.getA_endPrice())*pCount;
				product.put("p_link", "/auction/detail?num="+pNum);
				break;
			case 3:
				// 스튜디오
				Studio studio = studioService.getStudioByNum(pNum);
				product.put("p_name", studio.getS_title());
				product.put("p_image", "");
				product.put("p_count", pCount);
				product.put("p_price", (studio.getS_price())*pCount);
				totalPay +=  (studio.getS_price())*pCount;
				product.put("p_link", "/studio/detail?num="+pNum);
				break;
			}
		}
		productList.add(product);
		System.out.println(product);
		
		
		// 총갯수, 총금액을 모델에 담아서 넘기기 (ajax로 따로 불러오기 지양) 
		model.addAttribute("productList", productList);
		model.addAttribute("member", memberService.getMemberByNum(memberNum));
		model.addAttribute("totalPay", totalPay);
		model.addAttribute("totalCount", productList.size());
		
		return "purchase/order";
	}
	@RequestMapping(value = "/order1", method = RequestMethod.POST)
	public String ordersPage(HttpSession session, Model model,
			@RequestBody List<Map<String, Object>> products) {
		// @requestBody로 배열 얻어오기
		System.out.println(products.get(1).get("name2"));
		model.addAttribute("member", memberService.getMemberByNum(144));
		return "purchase/order";
	}
	
	// 카카오페이 API ------------------------------------------
	@RequestMapping(value = "kakaopay", method = RequestMethod.POST)
	@ResponseBody
	public String kakaoPay(String m_pk, String p_name, String p_count, String p_totalPrice) {
		System.out.println("컨트롤러: 카카오페이");
		Map<String, String> vars = new HashMap<String, String>();
		vars.put("m_pk", m_pk);
		vars.put("p_name", p_name);
		vars.put("p_count", "2");
		vars.put("p_totalPrice", p_totalPrice);
		vars.put("order_num", purchaseService.getOrderNum());
		
		return kakaoService.getKakaoPayAccess(vars);
	}
	
	@RequestMapping(value = "success", method = RequestMethod.GET)
	@ResponseBody
	public String approval(Model model, String pg_token, String partner_order_id, 
			HttpSession session) {
		String mNum = "144"; //(String)session.getAttribute("m_pk");
		
		// 결제승인 api 요청 
		Map<String, String> vars = new HashMap<String, String>();
		vars.put("pg_token", pg_token);
		vars.put("tid", kakaoService.getTid());
		vars.put("partner_order_id", partner_order_id);
		vars.put("partner_user_id", mNum);

		Map<String, Object> totalInfo = kakaoService.getKakaoPayOn(vars);
		List<Map<String, Object>> pList = (List<Map<String, Object>>)session.getAttribute("pList");
		
		// 리스트 길이만큼 반복하면서 주문 테이블 삽입 
		// 경매, 공방 = 1번 		아이템 = 여러번 
		for(int i = 0; i < pList.size(); i ++) {
			purchaseService.writeOrders(totalInfo, pList.get(i), Integer.parseInt(mNum));
		}
		
		String orderNum = (String)totalInfo.get("partner_order_id");
		
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
		int m_pk = 144; 	// (int)session.getAttribute("m_pk");
		return purchaseService.getStudioPurchase(s_pk, m_pk);
	}
	
	@RequestMapping("isPurchaseI")
	@ResponseBody
	public boolean isPurchaseI(int i_pk, HttpSession session) {
		int m_pk = 144; 	// (int)session.getAttribute("m_pk");
		return purchaseService.getItemPurchase(i_pk, m_pk);
	}

}
