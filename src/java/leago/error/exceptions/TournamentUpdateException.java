/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.error.exceptions;

import leago.error.MyException;

/**
 *
 * @author v094700
 */
public class TournamentUpdateException extends MyException{

    public TournamentUpdateException(String message, String status) {
        super(message, status);
    }
    
}
