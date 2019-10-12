package handus.member.service;

import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth10aService;
import com.github.scribejava.core.oauth.OAuth20Service;

@Service
public class NaverLoginService {
	// 인증 요청문을 구성함 
	private final String CLIENT_ID = "7233aAcgDTj12Mn4Ok_y";
	private final String CLIENT_PW = "_hkzzz0vIa";
	// 콜백 url
	private final String CALLBACK_URI = "http://localhost:8081/handusProject/member/naver_callback";
	// 어플리케이션이 생성한 상태 토큰 
	private final String SESSION_STATE = "oauth_state";
	// 프로필 조회 API url 
	private final String PROFILE_API_URL = "https://openapi.naver.com/v1/nid/me";
	
	// 네이버 아이디로 로그인 하는 url 생성 메소드 
	public String getNaverLoginURL(HttpSession session) {
		// 세션의 유효성을 검사하기 
		String state = UUID.randomUUID().toString();
		session.setAttribute(SESSION_STATE, state);
		
		// Scribe에서 제공하는 인증 url 이용하기 
		OAuth20Service oauthService 
			= new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_PW)
			.callback(CALLBACK_URI).state(state).build(NaverLoginApi.instance());
		
		return oauthService.getAuthorizationUrl();
	}
	
	// 네이버 아이디로 콜백처리 & access Token 얻는 메소드 
	public OAuth2AccessToken getAccessToken(HttpSession session, String state, String code) throws Exception {
		// 콜백으로 전달받은 난수가 생성한 난수와 일치하는지 확인 
		String sessionState = (String)session.getAttribute(SESSION_STATE);
		
		System.out.println(sessionState+", "+state);
		
		if(StringUtils.pathEquals(sessionState, state)) {
			// 난수가 일치할 경우 같다고 판단 후 토큰 만들어서 전달 
			OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_PW)
					.callback(CALLBACK_URI).state(state).build(NaverLoginApi.instance());
			OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
			return accessToken;
		}
		return null;
	}
	
	// Access Toke 을 이용하여 네이버 프로필 읽어오는 API 실행 
	public String getUserProfile(OAuth2AccessToken authToken) throws Exception {
		OAuth20Service oauthService = new ServiceBuilder().apiKey(CLIENT_ID).apiSecret(CLIENT_PW)
				.callback(CALLBACK_URI).build(NaverLoginApi.instance());
		// 새 요청 생성 
		OAuthRequest request = new OAuthRequest(Verb.GET, PROFILE_API_URL, oauthService);
		oauthService.signRequest(authToken, request);
		// 새 응답 생성 
		Response resp = request.send();
		return resp.getBody();
	}
}
