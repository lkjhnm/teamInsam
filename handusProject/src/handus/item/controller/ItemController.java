package handus.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import handus.heart.service.HeartService;
import handus.item.service.ItemService;
import handus.member.service.MemberService;
import handus.model.HeartItem;
import handus.model.Item;
import handus.model.Studio;

@Component
@RequestMapping("/item")
public class ItemController {
	@Autowired
	private ItemService itemService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private HeartService heartService;
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String itemList(Model model, HttpSession session, 
			@RequestParam(defaultValue = "all") String type,
			@RequestParam(defaultValue = "1")int page ) {
		
		// 필요 정보 : 해당 리스트에 뿌려질 아이템 리스트 
		List<Item> itemList = itemService.getStudioList(page, type);
		Map<String, Object> pageInfo = itemService.getPageInfo(page, type);
		
		model.addAttribute("itemList", itemList);
		model.addAllAttributes(pageInfo);
		return "item/itemList";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String itemView(int num, Model model, HttpSession session) {
		
		if(itemService.updateReadCount(num)) {
			model.addAttribute("item", itemService.getItemByNum(num));
			int m_pk = 144; // (int)session.getAttribute("m_pk");
			model.addAttribute("m_pk", m_pk);
			model.addAttribute("itemImg",itemService.getItemImage(num));
		}
		return "item/itemView";
	}
}
