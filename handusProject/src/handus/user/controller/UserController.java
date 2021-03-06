package handus.user.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.alarm.service.AlarmService;
import handus.member.service.MemberService;
import handus.user.service.UserService;

@Controller
@RequestMapping("user")
@PreAuthorize("hasRole('ROLE_MEMBER')")
public class UserController {

	@Autowired
	private UserService userService;
	@Autowired
	private AlarmService alarmService;
	
	@RequestMapping(value="/subscribe/{type}",method = RequestMethod.POST)
	@ResponseBody
	public boolean subscribeAuction(@PathVariable(value="type") int type, int ms_fk, int m_pk_user){
	
		boolean result = userService.userSubscribeSomething(type, ms_fk,m_pk_user);
		
		return result;
	}
	
	@RequestMapping(value="/subscribeCheck/{type}",method = RequestMethod.POST)
	@ResponseBody
	public boolean subscribeCheck(@PathVariable(value="type") int type,int ms_fk, int m_pk_user) {
		
		boolean result = userService.userSubscribeCheck(type, ms_fk, m_pk_user);

		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/subscribeCancel/{type}",method = RequestMethod.POST)
	public boolean subscribeCancel(@PathVariable(value="type")int type,int ms_fk, int m_pk_user) {
		boolean result = userService.userSubscribeCancel(type, ms_fk, m_pk_user);
		
		return result;
	}
	
	@ResponseBody
	@RequestMapping(value="/subscribeList/{type}", method=RequestMethod.POST)
	public List<Map<String,Object>> showSubscribeList(@PathVariable(value="type") int type, int m_pk_user){
		
		return userService.userSubscribeList(type, m_pk_user);
	}
	
	@ResponseBody
	@RequestMapping(value="subscribeListAll",method=RequestMethod.POST)
	public List<Map<String,Object>> showSubscribeListAll(int m_pk_user){
		return userService.userSubscribeListAll(m_pk_user);
	}
	
	@RequestMapping(value="/myPage", method=RequestMethod.GET)
	public String myPage(int m_pk,Model model) {
		
		model.addAllAttributes(userService.getUserInfo(m_pk));
		model.addAttribute("winningBid",userService.getWinningBid(m_pk));
		model.addAttribute("itemList", userService.getPayedItemList(m_pk));
		model.addAttribute("studioList", userService.getPayedStudioList(m_pk));
		return "user/myPage";
	}
	
	@RequestMapping(value="/subscribe",method=RequestMethod.GET)
	public String alarm() {
		return "user/subscribe";
	}
	
	@RequestMapping(value="/modify", method=RequestMethod.POST)
	@ResponseBody
	public boolean modifyUserInfo(@RequestParam Map<String,Object> userInfo){
		
		boolean result = userService.updateUserInfo(userInfo);
		
		return result;
	}
	
	@RequestMapping(value="/alarmPage", method=RequestMethod.GET)
	public String alarmPage() {
		return "user/alarm";
	}
	
	@RequestMapping(value="/alarmList", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> alarmList(Model model,HttpSession session, @RequestParam(defaultValue = "1") int readType) {
		int m_pk = (int)session.getAttribute("m_pk");
		
		return alarmService.getAlarmMessage(m_pk, readType);
	}
	
	@RequestMapping(value="alarmRead/{ua_pk}",method=RequestMethod.PUT)
	@ResponseBody
	public boolean alarmRead(@PathVariable("ua_pk") int ua_pk){
		
		return alarmService.readAlarm(ua_pk);
	}
}
