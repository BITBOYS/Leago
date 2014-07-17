package leago.models;

/**
 * Object-Klasse für das Match eines Turnieres
 *
 * @author Malte
 * @date 07.03.2014
 */
public class Match {

    private Team team1;
    private Team team2;
    private int points1;
    private int points2;

    /**
     * Konstruktor
     */
    public Match() {
        super();
    }

    /**
     * Konstruktor
     *
     * @param team1 erstes Team
     * @param team2 zweites Team
     * @param points1 Tore des ersten Teams
     * @param points2 Tore des zweiten Teams
     */
    public Match(Team team1, Team team2, int points1, int points2) {
        this.team1 = team1;
        this.team2 = team2;
        this.points1 = points1;
        this.points2 = points2;
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

    @Override
    public String toString() {
        return "Match{" + "team1=" + team1 + ", team2=" + team2 + ", points1=" + points1 + ", points2=" + points2 + '}';
    }

}
