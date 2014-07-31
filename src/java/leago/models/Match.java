package leago.models;

import java.sql.Date;

/**
 * Object-Klasse für das Match eines Turnieres
 *
 * @author Malte
 * @date 07.03.2014
 */
public class Match {

    private Tournament tournament;
    private Team team1;
    private Team team2;
    private int points1;
    private int points2;
    private Date played;
    private int game_nr;
    private int round_nr;
    private int id;

    /**
     * Konstruktor
     */
    public Match() {
        super();
    }

    public Match(Team team1, Team team2) {
        this.team1 = team1;
        this.team2 = team2;
    }

    public Match(Team team1, Team team2, int points1, int points2, Date played) {
        this.team1 = team1;
        this.team2 = team2;
        this.points1 = points1;
        this.points2 = points2;
        this.played = played;
    }

    public Match(Team team1, Team team2, int points1, int points2) {
        this.team1 = team1;
        this.team2 = team2;
        this.points1 = points1;
        this.points2 = points2;
    }

    public Tournament getTournament() {
        return tournament;
    }

    public void setTournament(Tournament tournament) {
        this.tournament = tournament;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getRound_nr() {
        return round_nr;
    }

    public void setRound_nr(int round_nr) {
        this.round_nr = round_nr;
    }

    public int getGame_nr() {
        return game_nr;
    }

    public void setGame_nr(int game_nr) {
        this.game_nr = game_nr;
    }

    public Team getTeam1() {
        return team1;
    }

    public Team getTeam2() {
        return team2;
    }

    public int getPoints1() {
        return points1;
    }

    public int getPoints2() {
        return points2;
    }

    public void setTeam1(Team team1) {
        this.team1 = team1;
    }

    public void setTeam2(Team team2) {
        this.team2 = team2;
    }

    public void setPoints1(int points1) {
        this.points1 = points1;
    }

    public void setPoints2(int points2) {
        this.points2 = points2;
    }

    public Date getPlayed() {
        return played;
    }

    public void setPlayed(Date played) {
        this.played = played;
    }

    @Override
    public String toString() {
        return "Match{" + "team1=" + team1 + ", team2=" + team2 + ", points1=" + points1 + ", points2=" + points2 + ", date=" + played + '}';
    }

}
