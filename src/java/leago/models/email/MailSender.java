package leago.models.email;

import java.security.NoSuchAlgorithmException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import leago.helper.BCrypt;
import org.apache.velocity.app.VelocityEngine;

public abstract class MailSender implements MailSenderService {

    private final VelocityEngine velocityEngine;
    private final String verificationSubject = "Please verify your email Address";
    private final String lostPasswordSubject = "Password reset";
    String host = "smtp.web.de";
    String from = "info@leago.com";
    String reply = "info.leago@web.de";
    final String username = "info.leago";
    final String password = "dededede";
    Properties props = new Properties();
    Session session;
    String to;

    public MailSender(VelocityEngine veloEngine) {
        this.velocityEngine = veloEngine;
    }

    @Override
    public void sendVerificationEmail(String email) {
        Map<String, String> resources = new HashMap<String, String>();
        emailHandler(email, verificationSubject, "leago/models/email/velocity/VerifyEmail.vm", resources);
    }

    @Override
    public void sendLostPasswordEmail(String email) {
        Map<String, String> resources = new HashMap<String, String>();
        emailHandler(email, verificationSubject, "leago/models/email/velocity/LostPasswordEmail.vm", resources);
    }

    private void emailHandler(final String email, final String emailSubject,
            final String velocityModel, final Map<String, String> resources) {

        initMail();
        
        try {
            // Create a default MimeMessage object.
            Message message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));
            
            // Set To: header field of the header.
            message.setRecipients(Message.RecipientType.TO,
                    InternetAddress.parse(to));

            // Set Subject: header field
            message.setSubject(emailSubject);
            
            Map model = new HashMap();
//          model.put("model", emailVerificationModel);
            
            //Get the HTML Mail
//            String text = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, velocityModel, model);

            // Send the actual HTML message, as big as you like
//            message.setContent(new String(text.getBytes(), "UTF-8"));

            // Send message
            Transport.send(message);

        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }
    }

    private void initMail() {

        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.port", "587");

        // Get the Session object.
        session = Session.getInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
    }

    private String hashString(String email2hash) throws NoSuchAlgorithmException {
        String hashed = "";

        String salt = "";
        salt = BCrypt.gensalt(20);
        hashed = BCrypt.createHash(email2hash, salt);

        System.out.println("HASH von : " + email2hash + " zu : " + hashed);

        return hashed;
    }
}
