package leago.models.email;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    // Sender's email ID needs to be mentioned
    String host = "smtp.web.de";
    String from = "info@leago.com";
    final String username = "info.leago@web.de";//change accordingly
    final String password = "dededede";//change accordingly
//    String proxyHost = "172.31.1.78";            //your host
//    String proxyPort = "80";                     //your post

    public void sendMail(String email, String tempPW) {
        // Recipient's email ID needs to be mentioned.
        String to = email;

        Properties props = new Properties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");
//        props.put("http.proxyPort", proxyPort);
//        props.put("http.proxyHost", proxyHost);

        // Get the Session object.
        Session session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });

        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));

            // Set Subject: header field
            message.setSubject("Testing Subject");

            // Send the actual HTML message, as big as you like
            message.setContent(
                    "<h1>Password Reset</h1><p>New Password: " + tempPW + " </p><p>Login and change your Password at <b>www.leago.com/login</b></p>",
                    "text/html");

            // Send message
            Transport.send(message);

            System.out.println("Sent message successfully.... " + tempPW);

        } catch (MessagingException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }
}
