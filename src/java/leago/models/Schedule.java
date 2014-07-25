/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.models;

import java.util.ArrayList;

/**
 *
 * @author v094700
 */
public class Schedule {
    
    private ArrayList<Round> rounds;

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
    public Schedule(ArrayList<Round> rounds) {
        this.rounds = rounds;
    }

    public ArrayList<Round> getRounds() {
        return rounds;
    }

    public void setRounds(ArrayList<Round> rounds) {
        this.rounds = rounds;
    }
    
}
