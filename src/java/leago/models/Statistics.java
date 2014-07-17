package leago.models;

/**
 * @author Maik
 */
public class Statistics {
    
    private int goals;
    private int goals_conceded;
    private int goal_difference;
    private int matches;
    private int wins;
    private int defeats;
    private int tournament_wins;
    private int tournament_participations;

    public Statistics() {
        super();
    }

    public Statistics(int goals, int goals_conceded, int wins, int defeats, int tournament_wins, int tournament_participations) {
        this.goals = goals;
        this.goals_conceded = goals_conceded;
        this.goal_difference = goals - goals_conceded;
        this.matches = wins + defeats;
        this.wins = wins;
        this.defeats = defeats;
        this.tournament_wins = tournament_wins;
        this.tournament_participations = tournament_participations;
    }

    public int getGoals() {
        return goals;
    }

    public void setGoals(int goals) {
        this.goals = goals;
    }

    public int getGoals_conceded() {
        return goals_conceded;
    }

    public void setGoals_conceded(int goals_conceded) {
        this.goals_conceded = goals_conceded;
    }

    public int getGoal_difference() {
        return goal_difference;
    }

    public void setGoal_difference(int goal_difference) {
        this.goal_difference = goal_difference;
    }

    public int getMatches() {
        return matches;
    }

    public void setMatches(int matches) {
        this.matches = matches;
    }
        
    public int getWins() {
        return wins;
    }

    public void setWins(int wins) {
        this.wins = wins;
    }

    public int getDefeats() {
        return defeats;
    }

    public void setDefeats(int defeats) {
        this.defeats = defeats;
    }

    public int getTournament_wins() {
        return tournament_wins;
    }

    public void setTournament_wins(int tournament_wins) {
        this.tournament_wins = tournament_wins;
    }

    public int getTournament_participations() {
        return tournament_participations;
    }

    public void setTournament_participations(int tournament_participations) {
        this.tournament_participations = tournament_participations;
    }

    @Override
    public String toString() {
        return "Statistics{" + "goals=" + goals + ", goals_conceded=" + goals_conceded + ", wins=" + wins + ", defeats=" + defeats + ", tournament_wins=" + tournament_wins + ", tournament_participations=" + tournament_participations + '}';
    }
    
}
