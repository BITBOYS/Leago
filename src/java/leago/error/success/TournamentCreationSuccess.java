/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.error.success;

import leago.error.MyException;

/**
 *
 * @author v094700
 */
public class TournamentCreationSuccess extends MyException{

    public TournamentCreationSuccess(String message, String status) {
        super(message, status);
    }
    
}
