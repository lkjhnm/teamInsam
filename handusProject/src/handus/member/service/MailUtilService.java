package handus.member.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.scheduling.annotation.EnableAsync;
import org.springframework.stereotype.Service;

@Service
@EnableAsync
public class MailUtilService {
	
	final String PATH ="C:\\Users\\bitcamp03\\Desktop\\workspace-spring\\.metadata\\.plugins"
			+ "\\org.eclipse.wst.server.core\\tmp0\\wtpwebapps\\handusProject\\WEB-INF\\resources\\mail\\mail.html";
	
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	@Async
	public void mailSender(String email,int m_pk,String uuid) {
		
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper helper = new MimeMessageHelper(mimeMessage,true,"UTF-8");
				helper.setFrom("Handus");
				helper.setTo(email);
				helper.setSubject("Handus 회원가입을 위한 이메일 입니다.");
				helper.setText(readHtml(uuid,m_pk),true);
			}
		};
		mailSender.send(preparator);
	}
	
	private String readHtml(String ecode,int m_pk) {
		
		BufferedReader br = null;
		try {
			FileReader fr = new FileReader(new File(PATH));
			br = new BufferedReader(fr);
			String read;
			StringBuffer sb = new StringBuffer();
			while((read = br.readLine()) != null) {
				sb.append(read);
				if(read.contains("mailValidate?")) {
					sb.append("mv_ecode="+ecode + "&m_pk="+m_pk);
				}else if(read.contains("value=")) {
					sb.append(ecode);
				}
			}
			return sb.toString();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {if(br != null) br.close(); } catch (IOException e) {e.printStackTrace();}
		}
		return null;
	}
}
