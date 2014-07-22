/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.error.success;

import leago.error.MyException;

/**
 *
 * @author v094702
 */
public class UserCreationSuccess extends MyException {

    public UserCreationSuccess(String message, String status) {
        super(message, status);
    }
    
}
