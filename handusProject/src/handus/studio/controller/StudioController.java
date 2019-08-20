package handus.studio.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/studio")
public class StudioController {
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String studioList() {
		System.out.println("studioList.jsp");
		return "studio/studioList";
	}
}
