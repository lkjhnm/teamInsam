package handus.user.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import handus.user.service.UserService;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private UserService userService;
	
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/subscribe/{type}",method = RequestMethod.POST)
	@ResponseBody
	public boolean subscribeAuction(@PathVariable(value="type") int type, int ms_fk, int m_pk_user){
	
		boolean result = userService.userSubscribeSomething(type, ms_fk,m_pk_user);
		
		return result;
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/subscribeCheck/{type}",method = RequestMethod.POST)
	@ResponseBody
	public boolean subscribeCheck(@PathVariable(value="type") int type,int ms_fk, int m_pk_user) {
		
		boolean result = userService.userSubscribeCheck(type, ms_fk, m_pk_user);
		
		return result;
	}
	
	@PreAuthorize("isAuthenticated()")
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
}