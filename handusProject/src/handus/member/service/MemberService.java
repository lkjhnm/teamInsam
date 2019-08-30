package handus.member.service;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import org.apache.http.HttpResponse;
import org.apache.http.NameValuePair;
import org.apache.http.client.HttpClient;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClientBuilder;
import org.apache.http.message.BasicNameValuePair;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import handus.dao.MemberDao;
import handus.model.Auth;
import handus.model.Member;
import handus.model.MemberInterest;
import handus.model.MemberVerify;

@Service
@EnableAsync
public class MemberService {
	@Autowired
	private MemberDao memberDao;
	
	@Autowired
	private MailUtilService mailUtil;
	
	@Autowired
	private PasswordEncoder encoder;
	
	
	/*
	 * signUp 과정
	 * 권한 및 관심카테고리를 Member 모델에 묶어서  오라클 다중 insert 및 마이바티스 foreach문을 활용해서 한번에 데이터 insert
	 * 그후 UUID를 통해 이메일 인증 코드를 생성하고 메일을 보냄 (메일 보내기는 비동기로 동작)
	 */
	@Transactional
	public boolean signUpMember(Member member, List<Integer> interList) {
		insertInfo(member,interList);
		
		if(memberDao.insertMember(member)>0) {
			String uuid = UUID.randomUUID().toString();
			MemberVerify mv = new MemberVerify();
			mv.setMv_ecode(uuid);
			mv.setM_pk(member.getM_pk());
			if(memberDao.insertMemberVerify(mv) == 1 ) {
				mailUtil.mailSender(member.getM_email(),member.getM_pk(),uuid);
				return true;
			}
		}
		return false;
	}
	
	private void insertInfo(Member member, List<Integer> interList) {
		
		String rawPw = member.getM_password();
		String encodePw = encoder.encode(rawPw);
		
		List<MemberInterest> miList = new ArrayList<MemberInterest>();
		List<Auth> authList = makeAuth(2, member.getM_pk());
		if(interList != null) {
			for(int category : interList) {
				MemberInterest mi = new MemberInterest();
				mi.setC_pk(category);
				miList.add(mi);
			}
		}
		member.setAuthList(authList);
		member.setM_password(encodePw);
		member.setMiList(miList);
	}
	
	@Transactional
	public boolean evalidateUpdate(String mv_ecode,int m_pk,String role) {	//가입 유형 선택에 따라서 권한 부여
		MemberVerify mv = memberDao.selectMemberVerify(m_pk);
		
		if(mv.getMv_edate().getTime() - new Date().getTime() < 3600000) {
			boolean result = mv.getMv_ecode().equals(mv_ecode);
			if(result) {
				memberDao.updateMemberVerify(m_pk, true);
				Auth auth = new Auth();
				auth.setM_pk(m_pk);
				auth.setMa_authority(role);
				memberDao.updateMemberAuth(auth);
				return true;
			}
		}
		return false;
	}
	
	public void reSendMail(int m_pk) {
		Member mem = memberDao.selectByNum(m_pk);
		String uuid = UUID.randomUUID().toString();
		MemberVerify mv = new MemberVerify();
		mv.setM_pk(m_pk);
		mv.setMv_ecode(uuid);
		memberDao.updateMailUUID(mv);
		mailUtil.mailSender(mem.getM_email(), m_pk, uuid);
	}
	
	private List<Auth> makeAuth(int type,int m_pk){
		List<Auth> authList = new ArrayList<>();
		
		switch(type) {
		case 2:
			Auth auth = new Auth();
			auth.setM_pk(m_pk);
			auth.setMa_authority("ROLE_AUTHOR_NV");
			authList.add(auth);
		case 1:							
			auth = new Auth();
			auth.setM_pk(m_pk);
			auth.setMa_authority("ROLE_MEMBER_NV");
			authList.add(auth);
			break;
		}
		return authList;
	}

	public boolean modifyMember(Member member) {
		if(memberDao.updateMember(member)>0) {
			return true;
		}
		return false;
	}


	public boolean withdrawalMember(int num) {
		if(memberDao.deleteMember(num)>0) {
			return true;
		}
		return false;
	}


	public Member getMemberByNum(int num) {
		return memberDao.selectByNum(num);
	}


	public Member getMemberById(String id) {
		return memberDao.selectByID(id);
	}


	public List<Member> getMemberList() {
		return memberDao.selectAllMember();
	}


	public boolean checkDuplicatedId(String m_id) {
		
		Member mem = memberDao.selectByID(m_id);
		if(mem != null) {
			return false;
		}
		return true;
	}
	
	//카카오 로그인 api
	public JsonNode getAccessToken(String authorize_code){
		final String REQUEST_URL = "https://kauth.kakao.com/oauth/token";
		final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
		
		postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
		postParams.add(new BasicNameValuePair("client_id", "7085b4545de8b2f34a25a4248fcdbce0"));
		postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8081/handusProject/member/oauth"));
		postParams.add(new BasicNameValuePair("code", authorize_code));
		
		final HttpClient client = HttpClientBuilder.create().build();
		final HttpPost post = new HttpPost(REQUEST_URL);
		JsonNode node = null;
		
		try {
			post.setEntity(new UrlEncodedFormEntity(postParams));
			final HttpResponse response = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			node = mapper.readTree(response.getEntity().getContent());	
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return node;
	}
}
