package handus.manager.controller;

import org.slf4j.Logger;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import handus.auction.service.AuctionService;
import handus.dao.MemberDao;
import handus.member.service.MemberService;
import handus.model.Auction;
import handus.model.Criteria;
import handus.model.Member;
import handus.model.PageMaker;
import handus.model.Studio;
import handus.studio.service.StudioService;

@Controller
@RequestMapping("manager")
public class ManagerController {
	
	@Autowired
	private AuctionService auctionService;
	
	@Autowired
	private StudioService studioService;
	
	@Autowired
	private SimpMessagingTemplate simpMessagingTemplate;
	
	@Autowired
	private MemberService memberService;
	
	private Logger logger = LoggerFactory.getLogger(ManagerController.class);
	
	
	@RequestMapping(value = "/managerHome")
	public String ManagerForm() {
		System.out.println("manager 요청성공");
		return "manager/managerHome";
	}
	
	@RequestMapping(value = "/Adetail", method = RequestMethod.GET)
	public String ManagerADetailForm(int a_pk,Model model) {
		model.addAttribute("auction",auctionService.getAuctionDetail(a_pk));
//		model.addAttribute("auctionImg", auctionService.getAuctionImg(a_pk));
		return "manager/managerADetail";
	}
	
	@RequestMapping(value = "/Mdetail", method = RequestMethod.GET)
	public String ManagerMDetailForm(int m_pk, Model model) {
		model.addAttribute("member", memberService.getMemberDetail(m_pk));
		return "manager/managerMDetail";
	}
	
	@RequestMapping(value = "Amodify", method = RequestMethod.GET)
	public String ManagerAModifyForm(Model model, int a_pk) {
		Auction auction = auctionService.getAuctionDetail(a_pk);
		model.addAttribute("Amodify", auction);
		model.addAttribute("auction", auctionService.getAuctionDetail(a_pk));
		return "manager/managerAModify";
	}
	
	@RequestMapping(value = "Amodify", method = RequestMethod.POST)
	public String ManagerAModify(Model model, Auction auction) {

		System.out.println("Amodify auction : " + auction);
		
		String url = "Amodify?a_pk="+auction.getA_pk();
		String msg = "수정실패";
		if(auctionService.modifyAuction(auction)) {
			msg = "수정 하였습니다.";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
	
		return "redirect:manager/managerADetail";
		
	}
	
	@RequestMapping(value = "Mmodify", method = RequestMethod.GET)
	public String ManagerMModifyForm(Model model, int m_pk) {
		Member member = memberService.getMemberDetail(m_pk);
		model.addAttribute("Mmodify", member);
		model.addAttribute("member", memberService.getMemberDetail(m_pk));
		return "manager/managerMModify";
	}
	
	@RequestMapping(value = "Mmodify", method = RequestMethod.POST)
	public String ManagerMModify(Model model, Member member, int m_pk) {
		
		System.out.println(memberService.getMemberDetail(m_pk));
		String url = "Mmodify?m_pk="+member.getM_pk();
		String msg = "수정실패";
		if(memberService.modifyMember(member)) {
			msg = "수정 하였습니다.";
		}
		model.addAttribute("url", url);
		model.addAttribute("msg", msg);
		
		return "redirect:manager/managerMModify";
	}
	
	@RequestMapping(value = "/managerStudio", method = RequestMethod.GET)
	public String StudioForm(Model model) {
		System.out.println(studioService.getAllStudio());
		List<Studio> list = studioService.getAllStudio();
		List<Map<String, Object>> studioList = new ArrayList<Map<String,Object>>();
		model.addAttribute("studioList", studioList);
		return "manager/managerStudioList";
	}
	
	@RequestMapping(value = "/managerAuction", method = RequestMethod.GET)
	public String AutionForm(Model model, @RequestParam(defaultValue = "1") int page, 
										  @RequestParam(defaultValue = "all") String type) {
		
//		System.out.println(auctionService);
		System.out.println(auctionService.getAuctionList(page,type));
		model.addAttribute("auctionList",auctionService.getAuctionList(page,type));
		model.addAllAttributes(auctionService.getPageInfo(page,type));
		return "manager/managerAuctionList";
	}
	

	
	@RequestMapping(value = "/managerMember", method = RequestMethod.GET)
	public String MemberForm(Model model, Criteria cri, @RequestParam(defaultValue = "1") int page) throws Exception{
//		logger.info("MemberForm");
//		List<Member> members = memberService.memberForm(cri);
//		PageMaker pageMaker = new PageMaker(cri);
		//전체 게시물 수를 구함
//		int totalCount = memberService.getTotalCount(cri);
		//페이지메이커로 전달
//		pageMaker.setTotalCount(totalCount);
		//모델에 추가
//		model.addAttribute("pageMaker", pageMaker);
		
		List<Member> memberList = memberService.getMemberList();
		model.addAttribute("memberList", memberService.getMemberList());
		return "manager/managerMemberList";
	}
	

	
	@RequestMapping(value = "/Mdelete", method = RequestMethod.POST)
	public boolean MemberDelete(int m_pk) {
		System.out.println("삭제요청");
		System.out.println(memberService.removeMember(m_pk));

//		return memberService.removeMember(m_pk);
		if(memberService.removeMember(m_pk)) {
			return true;
		}
		return false;
	}
	
	
	
	
	
	
	
	
}
