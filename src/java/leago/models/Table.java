package leago.models;

/**
 *
 * @author v094700
 */
public class Table {
    
    private String team;
    private int tournament_team_matches;
    private int tournament_team_wins;
    private int tournament_team_defeats;
    private double tournament_team_winrate;
    private int tournament_team_goals;
    private int tournament_team_goals_conceded;
    private int tournament_team_goal_difference;
    
    public Table() {
        super();
    }

    public Table(String team, int tournament_team_wins, int tournament_team_defeats, int tournament_team_goals, int tournament_team_goals_conceded) {
        this.team = team;
        this.tournament_team_wins = tournament_team_wins;
        this.tournament_team_defeats = tournament_team_defeats;
        this.tournament_team_goals = tournament_team_goals;
        this.tournament_team_goals_conceded = tournament_team_goals_conceded;
        this.tournament_team_matches = tournament_team_wins + tournament_team_defeats;
        this.tournament_team_winrate = (double)tournament_team_wins / (double)tournament_team_matches;
    }
    
    public String getTeam() {
        return team;
    }

    public int getTournament_team_matches() {
        return (tournament_team_defeats + tournament_team_wins);
    }

    public int getTournament_team_wins() {
        return tournament_team_wins;
    }

    public int getTournament_team_defeats() {
        return tournament_team_defeats;
    }

    public double getTournament_team_winrate() {
        if(tournament_team_wins == 0 || tournament_team_matches == 0)
            return 0;
        else {
            double temp = ((double)tournament_team_wins / (double)tournament_team_matches) * 1000;
            temp = Math.round(temp);
            temp = temp / 10;
            return temp; 
        }
   }

    public int getTournament_team_goals() {
        return tournament_team_goals;
    }

    public int getTournament_team_goals_conceded() {
        return tournament_team_goals_conceded;
    }
    
    public void setTeam(String team) {
        this.team = team;
    }

    public void setTournament_team_matches(int tournament_team_matches) {
        this.tournament_team_matches = tournament_team_matches;
    }

    public void setTournament_team_wins(int tournament_team_wins) {
        this.tournament_team_wins = tournament_team_wins;
    }

    public void setTournament_team_defeats(int tournament_team_defeats) {
        this.tournament_team_defeats = tournament_team_defeats;
    }

    public void setTournament_team_goals(int tournament_team_goals) {
        this.tournament_team_goals = tournament_team_goals;
    }

    public void setTournament_team_goals_conceded(int tournament_team_goals_conceded) {
        this.tournament_team_goals_conceded = tournament_team_goals_conceded;
    }

    public int getTournament_team_goal_difference() {
        return (tournament_team_goals-tournament_team_goals_conceded);
    }

    @Override
    public String toString() {
        return "Table{" + "tournament_team_matches=" + tournament_team_matches + ", tournament_team_wins=" + tournament_team_wins + ", tournament_team_defeats=" + tournament_team_defeats + ", tournament_team_winrate=" + tournament_team_winrate + ", tournament_team_goals=" + tournament_team_goals + ", tournament_team_goals_conceded=" + tournament_team_goals_conceded + ", tournament_team_goal_difference=" + tournament_team_goal_difference + '}';
    }
        
}
