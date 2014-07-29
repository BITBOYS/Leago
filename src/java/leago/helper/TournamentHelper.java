/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package leago.helper;

import java.sql.Connection;
import java.util.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TournamentCreationException;
import leago.error.exceptions.TournamentNotExistingException;
import leago.error.exceptions.TournamentUpdateException;
import leago.error.success.TournamentUpdateSuccess;
import leago.models.Match;
import leago.models.Round;
import leago.models.Schedule;
import leago.models.Statistics;
import leago.models.Table;
import leago.models.Team;
import leago.models.Tournament;
import leago.models.User;

/**
 *
 * @author v094702
 */
public class TournamentHelper {

    private static final DateFormat FORMATTER_DATE = new SimpleDateFormat("yyyy-MM-dd");

    /**
     *
     * @param tournament_name
     * @return Tournament
     * @throws DatabaseConnectionException
     * @throws TournamentNotExistingException
     */
    public Tournament getTournament(String tournament_name) throws DatabaseConnectionException, TournamentNotExistingException {
        Tournament tournament = new Tournament();
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * "
                    + "FROM tournament "
                    + "WHERE name = '" + tournament_name.trim() + "' "
                    + "ORDER BY name, start_date, end_date");

            if (!resultSet.isBeforeFirst()) {
                throw new TournamentNotExistingException("There is no tournament with this name: " + tournament_name, MyException.INFO);
            } else {
                resultSet.first();

                tournament.setName(resultSet.getString("name"));
                tournament.setLeader(new User(resultSet.getString("leader")));
                tournament.setStart_date(resultSet.getDate("start_date"));
                tournament.setEnd_date(resultSet.getDate("end_date"));
                tournament.setCreate_date(resultSet.getDate("create_date"));
                tournament.setDescription(resultSet.getString("description"));
                tournament.setRounds(resultSet.getInt("rounds"));
                tournament.setVenue(resultSet.getString("venue"));
                tournament.setDeadline(resultSet.getDate("deadline"));
                tournament.setTeams(getTeamsByTournament(tournament.getName()));
                tournament.setMember(getMemberByTournament(tournament.getName()));
                tournament.setTable(getTableByTournament(tournament.getName()));

            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the tournament information", MyException.ERROR);
        }

        return tournament;
    }

    /**
     * 
     * @param tournament_name
     * @param new_name
     * @param name_new2
     * @throws DatabaseConnectionException
     * @throws TournamentUpdateException 
     */
    public void editTournamentName(String tournament_name, String new_name, String name_new2) throws DatabaseConnectionException, TournamentUpdateException {
        try {
            int result;
            if (name_new2.equals(new_name)) {
                if(!isTournamentExisting(new_name)) {
                    Connection con = DatabaseHelper.connect();
                    Statement statement = con.createStatement();
                    result = statement.executeUpdate("UPDATE tournament "
                            + "SET name = '" + new_name + "' "
                            + "WHERE name = '" + tournament_name + "'");

                    if (result < 1) {
                        throw new TournamentUpdateException("An error occured while updating the name", MyException.ERROR);
                    }
                } else {
                    throw new TournamentUpdateException("A tournament with this name is already existing", MyException.ERROR);
                }
            } else {
                throw new TournamentUpdateException("The names aren't matching", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * 
     * @param tournament_name
     * @param new_leader
     * @throws TournamentUpdateException
     * @throws DatabaseConnectionException 
     */
    public void editTournamentLeader(String tournament_name, String new_leader) throws TournamentUpdateException, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET leader = '" + new_leader + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result < 1) {
                throw new TournamentUpdateException("An error occured while updating the leader", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * 
     * @param tournament_name
     * @param new_venue
     * @throws TournamentUpdateException
     * @throws DatabaseConnectionException 
     */
    public void editTournamentVenue(String tournament_name, String new_venue) throws TournamentUpdateException, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET venue = '" + new_venue + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result < 1) {
                throw new TournamentUpdateException("An error occured while updating the venue", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * 
     * @param tournament_name
     * @param description
     * @throws TournamentUpdateException
     * @throws DatabaseConnectionException 
     */
    public void editTournamentDescription(String tournament_name, String description) throws TournamentUpdateException, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET description = '" + description + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result < 1) {
                throw new TournamentUpdateException("An error occured while updating the description", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * 
     * @param tournament_name
     * @param rounds
     * @throws TournamentUpdateException
     * @throws DatabaseConnectionException 
     */
    public void editTournamentRounds(String tournament_name, int rounds) throws TournamentUpdateException, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET rounds = '" + rounds + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result < 1) {
                throw new TournamentUpdateException("An error occured while updating the rounds", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @param new_deadline
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     */
    public void editTournamentDeadline(Tournament tournament, Date new_deadline) throws TournamentUpdateException, DatabaseConnectionException {
        try {
            int result;

            if(new_deadline.before(tournament.getStart_date())) {            
                Connection con = DatabaseHelper.connect();
                Statement statement = con.createStatement();
                result = statement.executeUpdate("UPDATE tournament "
                        + "SET deadline = '" + new_deadline + "' "
                        + "WHERE name = '" + tournament.getName() + "'");

                if (result < 1) {
                    throw new TournamentUpdateException("An error occured while updating the deadline", MyException.ERROR);
                }
            } else {
                throw new TournamentUpdateException("The deadline has to be before the tournament starts", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void kickTeam(Team team, Tournament tournament) throws DatabaseConnectionException, TournamentUpdateException {
        
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            
            statement.execute("DELETE FROM team_tournament WHERE team = '" + team.getName() + "' AND tournament = '" + tournament.getName() + "'");

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TournamentUpdateException("Tournametn update failed unexpectedly with an SQL error " + ex.getSQLState(), MyException.ERROR);
        }
    }

    /**
     * 
     * @param tournament
     * @param new_start_date
     * @throws TournamentUpdateException
     * @throws DatabaseConnectionException 
     */
    public void editTournamentStartDate(Tournament tournament, Date new_start_date) throws TournamentUpdateException, DatabaseConnectionException {
        try {
            int result;
            
            if(new_start_date.before(tournament.getEnd_date())) {
                Connection con = DatabaseHelper.connect();
                Statement statement = con.createStatement();
                result = statement.executeUpdate("UPDATE tournament "
                        + "SET start_date = '" + new_start_date + "' "
                        + "WHERE name = '" + tournament.getName() + "'");

                if (result < 1) {
                    throw new TournamentUpdateException("An error occured while updating the start date", MyException.ERROR);
                }
            } else {
                throw new TournamentUpdateException("The start date has to be before the end date", MyException.ERROR);
            }
            

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * 
     * @param tournament
     * @param new_end_date
     * @throws DatabaseConnectionException
     * @throws TournamentUpdateException 
     */
    public void editTournamentEndDate(Tournament tournament, Date new_end_date) throws DatabaseConnectionException, TournamentUpdateException {
        try {
            int result;

            if(new_end_date.after(tournament.getStart_date())) {
                Connection con = DatabaseHelper.connect();
                Statement statement = con.createStatement();
                result = statement.executeUpdate("UPDATE tournament "
                        + "SET start_date = '" + new_end_date + "' "
                        + "WHERE name = '" + tournament.getName() + "'");

                if (result < 1) {
                    throw new TournamentUpdateException("An error occured while updating the end date", MyException.ERROR);
                }
            } else {
                throw new TournamentUpdateException("The end date has to be after the start date", MyException.ERROR);
            }
                

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * 
     * @param tournament_name
     * @throws TournamentUpdateException
     * @throws DatabaseConnectionException 
     */
    public void deleteTournament(String tournament_name) throws TournamentUpdateException, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("DELETE FROM tournament "
                    + "WHERE name = '" + tournament_name + "'");

            if (result < 1) {
                throw new TournamentUpdateException("An error occured while deleting the tournament", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @return
     * @throws DatabaseConnectionException
     * @throws TournamentNotExistingException
     */
    public ArrayList<Team> getTeamsByTournament(String tournament_name) throws DatabaseConnectionException, TournamentNotExistingException {
        ArrayList<Team> teams = new ArrayList<>();
        try {

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT name, tag, leader, team.wins, team.defeats, "
                    + "team.goals, team.goals_conceded, tournament_wins, tournament_participations, create_date"
                    + " FROM team, team_tournament"
                    + " WHERE tournament =  '" + tournament_name + "'"
                    + " AND team = name"
                    + " ORDER BY name, team.wins");

            while (resultSet.next()) {
                Team team = new Team();
                team.setName(resultSet.getString("name"));
                team.setTag(resultSet.getString("tag"));
                team.setCreate_date(resultSet.getDate("create_date"));
                
                Statistics stats = new Statistics();
                stats.setGoals(resultSet.getInt("team.goals"));
                stats.setGoals_conceded(resultSet.getInt("team.goals_conceded"));
                stats.setWins(resultSet.getInt("team.wins"));
                stats.setDefeats(resultSet.getInt("team.defeats"));
                stats.setTournament_wins(resultSet.getInt("tournament_wins"));
                stats.setTournament_participations(resultSet.getInt("tournament_participations"));
                
                team.setStatistics(stats);
                
                teams.add(team);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the teams of " + tournament_name, MyException.ERROR);
        }

        return teams;
    }

    /**
     *
     * @param tournamentname
     * @return
     * @throws DatabaseConnectionException
     */
    public ArrayList<User> getMemberByTournament(String tournamentname) throws DatabaseConnectionException {
        ArrayList<User> member = new ArrayList<User>();
        try {

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT distinct username"
                    + " FROM  user as u, user_team as ut, team as te, team_tournament as teto, tournament as tou"
                    + " WHERE tou.name = teto.tournament"
                    + "   AND teto.team = te.name"
                    + "   AND te.name = ut.team"
                    + "   AND ut.user = u.username"
                    + "   AND tou.name = '" + tournamentname + "'"
                    + " ORDER BY u.username, u.wins");

            while (resultSet.next()) {
                User user = new User();
                user.setName(resultSet.getString("username"));
                member.add(user);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the member of " + tournamentname, MyException.ERROR);
        }

        return member;
    }

    /**
     *
     * @param tournament_name
     * @return
     * @throws DatabaseConnectionException
     */
    public List<Table> getTableByTournament(String tournament_name) throws DatabaseConnectionException {
        List<Table> table = new ArrayList<>();

        try {

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT * "
                    + " FROM team_tournament "
                    + " WHERE tournament = '" + tournament_name + "'"
                    + " ORDER BY (wins/(wins+defeats)) DESC");

            while (resultSet.next()) {
                
                Table entry = new Table();
                entry.setTeam(resultSet.getString("team"));
                entry.setTournament_team_wins(resultSet.getInt("wins"));
                entry.setTournament_team_defeats(resultSet.getInt("defeats"));
                entry.setTournament_team_goals(resultSet.getInt("goals"));
                entry.setTournament_team_goals_conceded(resultSet.getInt("goals_conceded"));
                
                table.add(entry);
            }
        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the table of " + tournament_name, MyException.ERROR);
        }

        return table;
    }

    public List<User> getMemberByTeam(Team team) throws DatabaseConnectionException {
        List<User> teammember = new ArrayList<>();

        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT * "
                    + " FROM  user, user_team"
                    + " WHERE team = '" + team.getName() + "'"
                    + "   AND username = user");

            while (resultSet.next()) {
                User user = new User();
                user.setName(resultSet.getString("username"));
                teammember.add(user);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the member of " + team.getName(), MyException.ERROR);
        }

        return teammember;

    }

    public Schedule createTournamentSchedule(Tournament tournament) throws DatabaseConnectionException, TournamentNotExistingException {

//        DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
//        Date date = new Date();
        List<Team> teams = getTeamsByTournament(tournament.getName());
        List<Match> matches = new ArrayList<>();
        Schedule schedule = new Schedule();
        int nr_rounds = tournament.getRounds();
        List<Round> rounds = new ArrayList<>();

        for (int i = 0; i < teams.size(); i++) {
            List<User> user = getMemberByTeam(teams.get(i));
            List<String> userNames1 = new ArrayList<>();

            for (User user1 : user) {
                userNames1.add(user1.getName());
            }

            for (int j = i + 1; j < teams.size(); j++) {
                List<User> userj = getMemberByTeam(teams.get(j));
                List<String> userNames2 = new ArrayList<>();

                for (User userj1 : userj) {
                    userNames2.add(userj1.getName());
                }

                if (Collections.disjoint(userNames1, userNames2) == true) {
                    matches.add(new Match(teams.get(i), teams.get(j)));
                }
            }
        }

        for (int i = 0; i <= tournament.getRounds(); i++) {
            rounds.add(new Round(matches));
        }
        schedule.setRounds(rounds);

        for (Match match : matches) {
            System.out.println(match.getTeam1().getName() + " vs. " + match.getTeam2().getName());
        }

        return schedule;
    }

    public void createTournament(String name, User leader, String start_date, String end_date, String description, int rounds, String venue, String deadline) throws DatabaseConnectionException, TournamentCreationException, ParseException {

        try {
            java.util.Date dateStart = new java.util.Date();
            java.util.Date dateEnd = new java.util.Date();
            java.util.Date dateDeadline = new java.util.Date();

            if (start_date != null && !start_date.equals("")) {
                dateStart = FORMATTER_DATE.parse(start_date);
            }

            if (end_date != null && !end_date.equals("")) {
                dateEnd = FORMATTER_DATE.parse(end_date);
            }
            
            if (deadline != null && !deadline.equals("")) {
                dateDeadline = FORMATTER_DATE.parse(deadline);
            }
            
            venue = venue.equals("") ? null : "'" + venue + "'";;
            start_date = (start_date != null && start_date.equals("")) ? null : "'" + start_date + "'";
            end_date = (end_date != null && end_date.equals("")) ? null : "'" + end_date + "'";
            deadline = (deadline != null && deadline.equals("")) ? null : "'" + deadline + "'";
            description = (description != null && description.equals("")) ? null : "'" + description + "'";
            
            if (!isTournamentExisting(name)) {
                if (dateEnd.after(dateStart) || dateEnd.equals(dateStart)) {
                    if(dateDeadline.before(dateStart)) {
                        Connection con = DatabaseHelper.connect();
                        Statement statement = con.createStatement();

                        statement.execute("INSERT INTO tournament "
                                + " (name, leader, start_date, end_date, create_date, description, rounds, venue, deadline)"
                                + " VALUES ('" + name + "','" + leader.getName() + "'," + start_date + "," + end_date + ",CURRENT_TIMESTAMP," + description + "," + rounds + "," + venue + "," + deadline + ")");
                    } else {
                        throw new TournamentCreationException("Deadline has to end before the tournament starts", MyException.ERROR);
                    }
                } else {
                    throw new TournamentCreationException("The tournament can't start before it ends", MyException.ERROR);
                }
            } else {
                throw new TournamentCreationException("Name already taken", MyException.ERROR);
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new TournamentCreationException("Tournament creation failed unexpectedly with an SQL error " + ex.getSQLState(), MyException.ERROR);
        }
    }

    private boolean isTournamentExisting(String name) throws DatabaseConnectionException {
        boolean result = false;
        
        try {
            
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select COUNT(*) as count from tournament where name='" + name + "'");
            resultSet.next();
            
            if (resultSet.getInt("count") > 0) {
                result = true;
            }
            
        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return result;
    }
}
