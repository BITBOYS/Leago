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
public class Schedule {
    
    private List<Round> rounds;

    /**
     * Konstruktor
     */
    public Schedule() {
        super();
        rounds = new ArrayList<Round>();
    }

    /**
     * Konstruktor
     *
     * @param rounds  Liste von den Spielen
     */
    public Schedule(List<Round> rounds) {
        this.rounds = rounds;
    }

    public List<Round> getRounds() {
        return rounds;
    }

    public void setRounds(List<Round> rounds) {
        this.rounds = rounds;
    }
    
}
