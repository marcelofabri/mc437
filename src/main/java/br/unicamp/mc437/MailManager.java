package br.unicamp.mc437;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailManager
{
	public MailManager()
	{
		final String username = "patrimonio.ic.unicamp@gmail.com";
		final String password = "xC32eQkXArzKCpDDpDKqvHreGuXeYT";
 
		Properties props = new Properties();
		props.put("mail.smtp.auth", "true");
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", "smtp.gmail.com");
		props.put("mail.smtp.port", "587");
 
		Session session = Session.getInstance(props,
		  new javax.mail.Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		  });
 
		try {
 
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress("patrimonio.ic.unicamp@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
				InternetAddress.parse("ra102986@students.ic.unicamp.br,marcelofabri.mf@gmail.com"));
			message.setReplyTo(InternetAddress.parse("marcelofabri.mf@gmail.com"));
			message.setSubject("Testing Subject");
			message.setText("Dear Mail Crawler,"
				+ "\n\n No spam to my email, please!");
 
			Transport.send(message);
 
			System.out.println("Done");
 
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
