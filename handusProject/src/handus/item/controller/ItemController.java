package handus.item.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import handus.heart.service.HeartService;
import handus.item.service.ItemService;
import handus.member.service.MemberService;
import handus.model.HeartItem;
import handus.model.Item;

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
	public String itemList(Model model) {
		// 필요 정보 : 해당 리스트에 뿌려질 아이템 리스트 
		List<Item> list = itemService.getAllItem();
		List<Map<String, Object>> itemList = new ArrayList<Map<String,Object>>();
		for(int i = 0; i <list.size(); i++) {
			Map<String, Object> itemInfo = new HashMap<String, Object>();
			itemInfo.put("image", "");
			itemInfo.put("title", list.get(i).getI_title());
			itemInfo.put("num", list.get(i).getI_pk());
			HeartItem heart = new HeartItem();
			heart.setHi_i_pk(1);
			heart.setHi_i_pk(list.get(i).getI_pk());
			itemInfo.put("isHeart", heartService.isHeartItem(heart));
			itemList.add(itemInfo);
		}
		model.addAttribute("itemList", itemList);
		return "item/itemList";
	}
	
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public String itemView(int num, Model model) {
		System.out.println("컨트롤러: "+itemService.getItemByNum(num));
		if(itemService.updateReadCount(num)) {
			model.addAttribute("item", itemService.getItemByNum(num));
		}
		return "item/itemView";
	}
	
}
