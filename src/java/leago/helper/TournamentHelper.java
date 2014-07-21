/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package leago.helper;

import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import leago.error.MyException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.TournamentNotExistingException;
import leago.error.exceptions.TournamentUpdateException;
import leago.error.success.TournamentUpdateSuccess;
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

    /**
     *
     * @param tournament_name
     * @return Tournament
     * @throws DatabaseConnectionException
     * @throws TournamentNotExistingException
     */
    public static Tournament getTournament(String tournament_name) throws DatabaseConnectionException, TournamentNotExistingException {
        Tournament tournament = null;
        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT name, leader, start_date, end_date, create_date, password, description, nr_of_matchdays, venue, term_of_application, start_time, end_time "
                    + "FROM tournament "
                    + "WHERE name = '" + tournament_name.trim() + "' "
                    + "ORDER BY name, start_date, end_date");

            if (!resultSet.isBeforeFirst()) {
                throw new TournamentNotExistingException("There is no tournament with this name: " + tournament_name, MyException.INFO);
            } else {
                resultSet.first();
                String tournamentname = resultSet.getString("name");
                int nr_matchdays = resultSet.getInt("nr_of_matchdays");
                String password = resultSet.getString("password");
                String description = resultSet.getString("description");
                String venue = resultSet.getString("venue");
                Date start_date = resultSet.getDate("start_date");
                java.sql.Time start_time = resultSet.getTime("start_time");
                Date end_date = resultSet.getDate("end_date");
                java.sql.Time end_time = resultSet.getTime("end_time");
                Date create_date = resultSet.getDate("create_date");
                Date term_of_application = resultSet.getDate("term_of_application");
                User leader = new User(resultSet.getString("leader"));

                tournament = new Tournament(tournamentname, password, description, leader, start_date, start_time, end_date, end_time, create_date, nr_matchdays, venue, term_of_application);
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
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     * @throws TournamentUpdateException
     */
    public static void editTournamentName(String tournament_name, String new_name) throws TournamentUpdateSuccess, DatabaseConnectionException, TournamentUpdateException {
        try {
            int result;
            if (tournament_name.equals(new_name)) {
                Connection con = DatabaseHelper.connect();
                Statement statement = con.createStatement();
                result = statement.executeUpdate("UPDATE tournament "
                        + "SET name = '" + new_name + "' "
                        + "WHERE name = '" + tournament_name + "'");

                if (result > 0) {
                    throw new TournamentUpdateSuccess("Name update successful", MyException.SUCCESS);
                } else {
                    throw new TournamentUpdateSuccess("An error occured while updating the name", MyException.ERROR);
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
     * @param old_password
     * @param new_password
     * @throws TournamentUpdateSuccess
     * @throws TournamentUpdateException
     * @throws DatabaseConnectionException
     */
    public static void editTournamentPassword(String tournament_name, String old_password, String new_password) throws TournamentUpdateSuccess, TournamentUpdateException, DatabaseConnectionException {
        try {

            int result;

            if (old_password.equals(new_password)) {
                Connection con = DatabaseHelper.connect();
                Statement statement = con.createStatement();
                result = statement.executeUpdate("UPDATE tournament "
                        + "SET password = '" + new_password + "' "
                        + "WHERE name = '" + tournament_name + "'");

                if (result > 0) {
                    throw new TournamentUpdateSuccess("Password update successful", MyException.SUCCESS);
                } else {
                    throw new TournamentUpdateSuccess("An error occured while updating the password", MyException.ERROR);
                }
            } else {
                throw new TournamentUpdateException("The passwords aren't matching", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @param new_leader
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     */
    public static void editTournamentLeader(String tournament_name, String new_leader) throws TournamentUpdateSuccess, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET leader = '" + new_leader + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result > 0) {
                throw new TournamentUpdateSuccess("Leader update successful", MyException.SUCCESS);
            } else {
                throw new TournamentUpdateSuccess("An error occured while updating the leader", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @param new_venue
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     */
    public static void editTournamentVenue(String tournament_name, String new_venue) throws TournamentUpdateSuccess, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET venue = '" + new_venue + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result > 0) {
                throw new TournamentUpdateSuccess("Venue update successful", MyException.SUCCESS);
            } else {
                throw new TournamentUpdateSuccess("An error occured while updating the venue", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @param description
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     */
    public static void editTournamentDescription(String tournament_name, String description) throws TournamentUpdateSuccess, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET description = '" + description + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result > 0) {
                throw new TournamentUpdateSuccess("Description update successful", MyException.SUCCESS);
            } else {
                throw new TournamentUpdateSuccess("An error occured while updating the description", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @param new_nr_matchdays
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     */
    public static void editTournamentMatchdays(String tournament_name, int new_nr_matchdays) throws TournamentUpdateSuccess, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET nr_of_matchdays = '" + new_nr_matchdays + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result > 0) {
                throw new TournamentUpdateSuccess("Matchdays update successful", MyException.SUCCESS);
            } else {
                throw new TournamentUpdateSuccess("An error occured while updating the matchdays", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @param new_term_of_application
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     */
    public static void editTournamentTerm(String tournament_name, Date new_term_of_application) throws TournamentUpdateSuccess, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET term_of_application = '" + new_term_of_application + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result > 0) {
                throw new TournamentUpdateSuccess("Term of application update successful", MyException.SUCCESS);
            } else {
                throw new TournamentUpdateSuccess("An error occured while updating the term of application", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @param new_start_date
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     */
    public static void editTournamentStartDate(String tournament_name, Date new_start_date) throws TournamentUpdateSuccess, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET start_date = '" + new_start_date + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result > 0) {
                throw new TournamentUpdateSuccess("Start date update successful", MyException.SUCCESS);
            } else {
                throw new TournamentUpdateSuccess("An error occured while updating the start date", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @param new_end_date
     * @throws DatabaseConnectionException
     * @throws TournamentUpdateSuccess
     */
    public static void editTournamentEndDate(String tournament_name, Date new_end_date) throws DatabaseConnectionException, TournamentUpdateSuccess {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("UPDATE tournament "
                    + "SET start_date = '" + new_end_date + "' "
                    + "WHERE name = '" + tournament_name + "'");

            if (result > 0) {
                throw new TournamentUpdateSuccess("End date update successful", MyException.SUCCESS);
            } else {
                throw new TournamentUpdateSuccess("An error occured while updating the end date", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     *
     * @param tournament_name
     * @throws TournamentUpdateSuccess
     * @throws DatabaseConnectionException
     */
    public static void deleteTournament(String tournament_name) throws TournamentUpdateSuccess, DatabaseConnectionException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("DELETE FROM tournament "
                    + "WHERE name = '" + tournament_name + "'");

            if (result > 0) {
                throw new TournamentUpdateSuccess("Delete tournament successful", MyException.SUCCESS);
            } else {
                throw new TournamentUpdateSuccess("An error occured while deleting the tournament", MyException.ERROR);
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
    public static ArrayList<Team> getTeamsByTournament(String tournament_name) throws DatabaseConnectionException, TournamentNotExistingException {
        ArrayList<Team> teams = new ArrayList<Team>();
        try {

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT name, tag, password, leader, team.wins, team.defeats, "
                    + "team.goals, team.goals_conceded, team.tournament_wins, team.tournament_participations, team.create_date"
                    + " FROM team, team_tournament"
                    + " WHERE tournament =  '" + tournament_name + "'"
                    + " AND team = name"
                    + " ORDER BY name, team.wins");
            resultSet.first();

            while (resultSet.next()) {
                teams.add(new Team(resultSet.getString("name"),
                        resultSet.getString("tag"),
                        resultSet.getString("password"),
                        new User(resultSet.getString("leader")),
                        new Statistics(resultSet.getInt("team.goals"), resultSet.getInt("team.goals_conceded"),
                                resultSet.getInt("team.wins"), resultSet.getInt("team.defeats"), resultSet.getInt("team.tournament_wins"),
                                resultSet.getInt("team.tournament_participations")),
                        resultSet.getDate("team.create_date")));
                resultSet.next();
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
    public static ArrayList<User> getMemberByTournament(String tournamentname) throws DatabaseConnectionException {
        ArrayList<User> member = new ArrayList<User>();
        try {

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT name, u.password, u.email, u.create_date, u.goals,  u.goals_conceded, u.wins, u.defeats, u.goals_conceded"
                    + " FROM  user as u, user_team as ut, team as te, team_tournament as teto, tournament as tou"
                    + " WHERE tou.name = teto.tournament"
                    + "   AND teto.team = te.name"
                    + "   AND te.name = ut.team"
                    + "   AND ut.user = u.username"
                    + "   AND tou.name = '" + tournamentname + "'"
                    + " ORDER BY u.username, u.wins");
            resultSet.first();

            while (resultSet.next()) {
                member.add(new User(resultSet.getString("name"),
                        resultSet.getString("email"),
                        resultSet.getString("password"),
                        new Statistics(resultSet.getInt("goals"),
                                resultSet.getInt("goals_conceded"),
                                resultSet.getInt("wins"),
                                resultSet.getInt("defeats"),
                                resultSet.getInt("tournament_wins"),
                                resultSet.getInt("tournament_participations")),
                        resultSet.getDate("create_date")));
                resultSet.next();
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
    public static ArrayList<Table> getTableFromTournament(String tournament_name) throws DatabaseConnectionException {
        ArrayList<Table> table = new ArrayList<Table>();

        try {

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT * "
                    + "  FROM team_tournament "
                    + " WHERE tournament = '" + tournament_name + "'"
                    + " ORDER BY (wins/(wins+defeats)) DESC");
            resultSet.first();

            while (resultSet.next()) {
                table.add(new Table(resultSet.getString("team"), resultSet.getInt("wins"), resultSet.getInt("defeats"),
                        resultSet.getInt("goals"), resultSet.getInt("goals_conceded")));
                resultSet.next();
            }
        } catch (SQLException ex) {
            Logger.getLogger(TournamentHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the table of " + tournament_name, MyException.ERROR);
        }

        return table;
    }
}
