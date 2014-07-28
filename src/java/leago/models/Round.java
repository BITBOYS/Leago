/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.models;

import java.util.List;

/**
 *
 * @author v094700
 */
public class Round {
    
    List<Match> matches;

    public Round(List<Match> matches) {
        this.matches = matches;
    }

    public Round() {
    }

    public List<Match> getMatches() {
        return matches;
    }

    public void setMatches(List<Match> matches) {
        this.matches = matches;
    }

    @Override
    public String toString() {
        return "Rounds{" + "matches=" + matches + '}';
    }
        
}