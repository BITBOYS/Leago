/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.service;

import leago.error.AuthenticationException;
import leago.error.MyException;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class LoginService {
    
    public boolean authenticate(String name, String password) throws AuthenticationException {
        boolean result = false;
        
        if(name != null && name.equals("maik")) {
            result = true;
        } else {
            throw new AuthenticationException("Username and/or password are wrong", MyException.ERROR);
        }
        
        return result;
    }
    
    public User getLoginUser(String name) {
        User user = new User();
        user.setName(name);
        user.setPassword("Passwort");
        
        return user;
    }
    
}
