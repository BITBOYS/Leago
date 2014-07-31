/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.models;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author v094700
 */
public class Round {
    
    List<Match> matches;
    int round;

    public Round(List<Match> matches, int round) {
        this.matches = matches;
        this.round = round;
    }

    public Round() {
        matches = new ArrayList<>();
        this.round = 1;
    }

    public List<Match> getMatches() {
        return matches;
    }

    public void setMatches(List<Match> matches) {
        this.matches = matches;
    }

    public int getRound() {
        return round;
    }

    public void setRound(int round) {
        this.round = round;
    }
        
}