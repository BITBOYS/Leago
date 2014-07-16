/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.error;

/**
 *
 * @author v094702
 */
public class AuthenticationException extends MyException {
    
    public AuthenticationException(String message, String status) {
        super(message, status);
    }
    
}
