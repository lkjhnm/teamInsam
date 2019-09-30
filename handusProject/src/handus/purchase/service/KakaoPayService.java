package handus.purchase.service;

import java.io.IOException;
import java.net.URI;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.apache.http.HttpResponse;
import org.apache.http.client.ClientProtocolException;
import org.apache.http.client.HttpClient;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.HttpClients;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Service
public class KakaoPayService {
	
	private final String ADMIN_KEY = "ee642654ab353ff9d5db78eb644b07a8";
	private final String CID = "TC0ONETIME";
	private String tid; 

	// 결제준비
	public String getKakaoPayAccess(Map<String, String> vars) {
		System.out.println("결제--준비--요청:"+vars);
		
		// 카카오페이에 결제요청(단건결제) 보내는 메소드
		String url = "https://kapi.kakao.com/v1/payment/ready";
		String approval = "http://localhost:8081/handusProject/purchase/success?partner_order_id=" + vars.get("order_num");
//		String approval = UriComponentsBuilder.fromUriString("http://localhost:8081/handusProject/purchase/success")
//				.queryParam("partner_user_id", vars.get("m_pk"))
//				.queryParam("partner_order_id", vars.get("order_num"))
//				.build().toString();
		System.out.println("approv: "+approval);
		String cancle = "http://localhost:8081/handusProject/purchase/fail?isCancle=true";
		String fail = "http://localhost:8081/handusProject/purchase/fail?isCancle=false";

		URI uri = UriComponentsBuilder.fromUriString(url)
				.queryParam("cid", CID)		// 가맹점 코드 (테스트코드) 
				.queryParam("partner_order_id", vars.get("order_num"))		// 가맹점 주문번호 (총주문 주문번호)
				.queryParam("partner_user_id", vars.get("m_pk"))		// 가맹점 회원 id : m_pk 
				.queryParam("item_name", vars.get("p_name"))			// 상품 이름 
				.queryParam("quantity", vars.get("p_count"))			// 상품 수량 
				.queryParam("total_amount", vars.get("p_totalPrice"))	// 상품 총액
				.queryParam("tax_free_amount", 0)					// 상품 부과세 (0)
				.queryParam("approval_url", approval)			// 결제 성공 url
				.queryParam("cancel_url", cancle)				// 결제 취소 url
				.queryParam("fail_url", fail)					// 결제 실패 url
				.build().toUri();
		
		// restTemplate 를 이용하여 요청 보내기 : postForObject
		// 이유는 모르겠지만 헤더에 어드민키를 넣어서 보내는 곳에서 계속 에러가 나서 RestTemplate 사용포기 
		
		// HttpClient -----
		HttpClient client = HttpClients.createDefault();
		HttpPost post = new HttpPost(uri);
		// header에 admin_key 담기
		post.setHeader("Authorization", "KakaoAK "+ ADMIN_KEY);
		
		JsonNode node = null; 
		try {
			HttpResponse resp = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			node = mapper.readTree(resp.getEntity().getContent());
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// tid 번호 저장 
		// node 는 json 객체이기 때문에 문자열로 변환 
		setTid(node.get("tid").asText());
		
		return node.get("next_redirect_pc_url").asText();
	}

	// 결제승인
	public Map<String, Object> getKakaoPayOn(Map<String, String> vars) {
		System.out.println("결제--승인--요청");
		System.out.println("파라미터: " + vars);
		
		String url = "https://kapi.kakao.com/v1/payment/approve";
		URI uri = UriComponentsBuilder.fromUriString(url).queryParam("cid", CID)
				.queryParam("tid", vars.get("tid"))
				.queryParam("partner_order_id", vars.get("partner_order_id"))
				.queryParam("partner_user_id", vars.get("partner_user_id"))
				.queryParam("pg_token", vars.get("pg_token"))
				.build().toUri();
		System.out.println("요청uri: "+uri);
		
		HttpClient client = HttpClients.createDefault();
		HttpPost post = new HttpPost(uri);
		post.addHeader("Authorization", "KakaoAK "+ADMIN_KEY);
		
		JsonNode node = null;
		try {
			HttpResponse resp = client.execute(post);
			ObjectMapper mapper = new ObjectMapper();
			node = mapper.readTree(resp.getEntity().getContent());
		} catch (ClientProtocolException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		// 필요 내용만 Map 으로 반환
		Map<String, Object> info = new HashMap<String, Object>();
		info.put("aid", node.get("aid").asText());	// 결제 요청 고유 번호 
		info.put("tid", node.get("tid").asText());	// 카페 결제 고유 번호 - 결제 취소 할 때 필요 
		info.put("partner_order_id", node.get("partner_order_id").asText());	// 가맹점 주문번호 = 총주문 주문번호 
		info.put("partner_user_id", node.get("partner_user_id").asText());	// 가맹점 회원 id
		info.put("payment_method_type", node.get("payment_method_type").asText());	// 결제수단 (card, money)
		info.put("totalPrice", node.get("amount").get("total").asInt());	// 결제 금액 - 총액 
		info.put("item_name", node.get("item_name").asText());
		info.put("quantity", node.get("quantity").asInt());
//		String dateForm = node.get("approved_at").asText();
		Date approveDate = null;
		try {
			approveDate = transeDate(node.get("approved_at").asText());
			System.out.println(approveDate);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		info.put("approved_at", approveDate);	// 결제 승인 시간 
		
		return info;
	}

	private void setTid(String tid) {
		this.tid = tid;
	}
	public String getTid() {
		return this.tid;
	}
	private Date transeDate(String dateFormat) throws Exception {
		System.out.println("변환전: "+dateFormat);
		SimpleDateFormat transFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss");
		String date1 = dateFormat.substring(0, 10);
		String date2 = dateFormat.substring(11);
		// T 를 빼고 붙여. 
		
		System.out.println("변환후: "+dateFormat);
		
		return transFormat.parse(dateFormat);
	}
}
