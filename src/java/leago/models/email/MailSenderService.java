
package leago.models.email;


/**
 *
 * @author v094700
 */
public interface MailSenderService {
    
    public void sendVerificationEmail(String email);

    public void sendLostPasswordEmail(String email);
}
