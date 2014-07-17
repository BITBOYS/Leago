package leago.models;

import java.util.ArrayList;

/**
 * Object-Klasse für die Spielrunde eines Turnieres
 *
 * @author Malte
 * @date 07.03.2014
 */
public class Round {

    private ArrayList<Match> matches;

    /**
     * Konstruktor
     */
    public Round() {
        super();
    }

    /**
     * Konstruktor
     *
     * @param matches Liste von den Spielen
     */
    public Round(ArrayList<Match> matches) {
        this.matches = matches;
    }

    public ArrayList<Match> getMatches() {
        return matches;
    }

    public void setMatches(ArrayList<Match> matches) {
        this.matches = matches;
    }

}
