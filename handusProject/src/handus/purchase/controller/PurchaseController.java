package handus.purchase.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import handus.purchase.service.PurchaseService;
import handus.studio.service.StudioService;

@Component
@RequestMapping("/purchase")
public class PurchaseController {
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
	private int totalPay;
	

	@RequestMapping(value = "/order", method = RequestMethod.GET)
	public String orderPage(HttpSession session, Model model, 
			@RequestParam(required = false) Map<String, Object> products) {
		// 현재 로그인 된 멤버의 번호 받아오기 > SNS로 로그인한 사람은 id가 없음 > pk로 받아와야함
		int memberNum = 144;
		// 파라미터로 주문할 상품의 타입과 pk 받아오기
		// Map<String, Object> products = pNum, pType, pCount 
		System.out.println(products);
		boolean isIt = false;
		
		List<Map<String, Object>> productList = new ArrayList<Map<String,Object>>();
		Map<String, Object> product = new HashMap<String, Object>();
		totalPay = 0;
		
		product.put("p_name", "제품이름1");
		product.put("p_image", "");
		product.put("p_count", 2);
		product.put("p_price", 22000);
		totalPay += 22000;
		product.put("p_link", "/item/detail?num="+1);
		
		if(isIt) {
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
		
		model.addAttribute("productList", productList);
		model.addAttribute("member", memberService.getMemberByNum(memberNum));
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
	
	@RequestMapping(value = "/sum", method = RequestMethod.POST)
	@ResponseBody
	public int sum() {
		System.out.println(totalPay);
		return totalPay;
	}

}
