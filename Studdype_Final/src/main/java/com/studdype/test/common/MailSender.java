package com.studdype.test.common;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.studdype.test.model.dao.member.MemberDao;
import com.studdype.test.model.dto.member.MemberDto;

public class MailSender {
	@Autowired
	JavaMailSenderImpl mail;

	public MailSender() {
		super();
		mail = new JavaMailSenderImpl();
		mail.setHost("smtp.gmail.com");
		mail.setPort(587);
		mail.setUsername("2dudwnd");
		mail.setPassword("hree1215!@");
		mail.setDefaultEncoding("UTF-8");
		Properties prop = new Properties();
		prop.setProperty("mail.smtp.auth", "true");
		prop.setProperty("mail.smtp.starttls.enable", "true");
		mail.setJavaMailProperties(prop);
		
	}
	
	public void sendExtraPwMail(MemberDto member) {
		SimpleMailMessage message = new SimpleMailMessage();
		
		String html = "<table style='width:700px; margin-left:20px;'>"
					+"<tr><img src='https://i.esdrop.com/d/xEjnS7UFZv.JPG' style='width:700px; height:300px;'</tr>"
					+"<tr>"
					//+"<td><span style='font-size: 30px; font-weight: bold;'>StuDdype</span><span style='font-size: 12px; color:#80878d'> SINCE 2021</span></td>"
					+"</tr><tr><td><span>안녕하세요. <strong>스터띱</strong> 입니다.<br>저희 사이트를 방문해 주셔서 감사드립니다.<br><br><strong>"+member.getMem_id()+"("+member.getMem_name()+")</strong> 고객님의 가입정보는 다음과 같습니다.</span></td>" 
					+"</tr>"
					+"<tr><td><table style='margin-top:20px;'><col width='100px'><col width='200px'><col width='100px'><col width='200px'><tr style='border:1px solid gray; '>"
					+"<td style='background-color: #f5f6f5; color:#80878d'>아이디</td><td>bin3005</td><td style='background-color: #f5f6f5; color:#80878d'>임시비밀번호</td><td>"+member.getMem_pw()+"</td>"
					+"</tr></table></td></tr><tr><td><span><br>회원가입 시 등록한 정보를 수정하려면, [마이페이지]에서 변경하실 수 있습니다.<br>언제든지 <strong>"+member.getMem_id()+"("+member.getMem_name()+")</strong> 고객님의 사이트 방문을 기다리겠습니다. </span></td>"
					+"</tr></table>";
			
		MimeMessage msg = mail.createMimeMessage();
		MimeMessageHelper helper;
		
		
		try {
			helper = new MimeMessageHelper(msg,true);
			helper.setFrom(new InternetAddress("2dudwnd@gmail.com","StuDdype","UTF-8"));
			helper.setTo(member.getMem_email());
			helper.setSubject("[스터띱] "+member.getMem_id()+"님 임시 비밀번호 입니다.");
			helper.setText(html, true);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		mail.send(msg);
	}
	
	public String getRandNum() {
		int rand = (int)(Math.random()*899999)+100000;
		String randNum = rand+"";
		
		return randNum;
	}

	public void sendVerifiMail(MemberDto member, String randNum) {
		SimpleMailMessage message = new SimpleMailMessage();
		
		String html = "<table style='width:700px; margin-left:20px;'>"
					+"<tr><img src='https://i.esdrop.com/d/xEjnS7UFZv.JPG' style='width:700px; height:300px;'</tr>"
					+"<tr>"
					//+"<td><span style='font-size: 30px; font-weight: bold;'>StuDdype</span><span style='font-size: 12px; color:#80878d'> SINCE 2021</span></td>"
					+"</tr><tr><td><span>안녕하세요. <strong>스터띱</strong> 입니다.<br>저희 사이트를 방문해 주셔서 감사드립니다.<br><br><strong>"+member.getMem_id()+"("+member.getMem_name()+")</strong> 고객님의 비밀번호 찾기 인증번호는 다음과 같습니다.</span></td>" 
					+"</tr>"
					+"<tr><td><table style='margin-top:20px;'><col width='100px'><col width='200px'><tr style='border:1px solid gray; '>"
					+"<td style='background-color: #f5f6f5; color:#80878d'>인증번호</td><td>"+randNum+"</td>"
					+"</tr></table></td></tr><tr><td><span><br>인증번호 칸에 인증번호를 입력해주세요.</td>"
					+"</tr></table>";
			
		MimeMessage msg = mail.createMimeMessage();
		MimeMessageHelper helper;
		
		
		try {
			helper = new MimeMessageHelper(msg,true);
			helper.setFrom(new InternetAddress("2dudwnd@gamil.com","StuDdype","UTF-8"));
			helper.setTo(member.getMem_email());
			helper.setSubject("[스터띱] "+member.getMem_id()+"님 인증번호 입니다.");
			helper.setText(html, true);
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
		
		mail.send(msg);
	}	
	
}
