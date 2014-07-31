package leago.models;

/**
 *
 * @author v094700
 */
public class Table {
    
    private String team;
    private int amount_matches;
    private int wins;
    private int defeats;
    private double winrate;
    private int goals;
    private int goals_conceded;
    private int goal_difference;
    
    public Table() {
        super();
    }

    public Table(String team, int tournament_team_wins, int tournament_team_defeats, int tournament_team_goals, int tournament_team_goals_conceded) {
        this.team = team;
        this.wins = tournament_team_wins;
        this.defeats = tournament_team_defeats;
        this.goals = tournament_team_goals;
        this.goals_conceded = tournament_team_goals_conceded;
        this.amount_matches = tournament_team_wins + tournament_team_defeats;
        this.winrate = (double)tournament_team_wins / (double)amount_matches;
    }

    public String getTeam() {
        return team;
    }

    public void setTeam(String team) {
        this.team = team;
    }

    public int getAmount_matches() {
        return wins+defeats;
    }

    public void setAmount_matches(int amount_matches) {
        this.amount_matches = amount_matches;
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

    public double getWinrate() {
        double result;
        
        if((wins == 0 && defeats == 0) || wins == 0) {
            result = 0;
        } else {
            double temp = ((double)wins / (double)(wins+defeats) * 1000);
            temp = Math.round(temp);
            temp = temp / 10;
            result = temp; 
        }
        
        return result;
    }

    public void setWinrate(double winrate) {
        this.winrate = winrate;
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
        return goals - goals_conceded;
    }

    public void setGoal_difference(int goal_difference) {
        this.goal_difference = goal_difference;
    }

    @Override
    public String toString() {
        return "Table{" + "team=" + team + ", amount_matches=" + amount_matches + ", wins=" + wins + ", defeats=" + defeats + ", winrate=" + winrate + ", goals=" + goals + ", goals_conceded=" + goals_conceded + ", goal_difference=" + goal_difference + '}';
    }

        
}
