package br.unicamp.mc437;

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class MailUtils {
	public static void enviarEmail(String nome, String email, String assunto, String mensagem) {
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

			MimeMessage message = new MimeMessage(session);

			message.setFrom(new InternetAddress("patrimonio.ic.unicamp@gmail.com"));
			message.setRecipients(Message.RecipientType.TO,
					InternetAddress.parse("lminchillo2@gmail.com,marcelofabri.mf@gmail.com"));
			message.setReplyTo(InternetAddress.parse(email));
			message.setSubject("[Sistema de Controle de Patrim\u00F4nio] " + assunto, "UTF-8");

			mensagem = "Sistema de Controle de Patrim\u00F4nio\n\nMensagem enviada por: " + nome + "\n\n\n\nMensagem original:\n\n" + mensagem;

			message.setHeader("Content-Type", "text/plain; charset=UTF-8");
			message.setText(mensagem, "UTF-8");

			Transport.send(message);
		} catch (MessagingException e) {
			throw new RuntimeException(e);
		}
	}
}
