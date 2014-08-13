/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package leago.helper;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import leago.error.MyException;
import leago.error.exceptions.AuthenticationException;
import leago.error.exceptions.DatabaseConnectionException;
import leago.error.exceptions.UserCreationException;
import leago.error.exceptions.UserNotExistingException;
import leago.error.exceptions.UserUpdateException;
import leago.models.Statistics;
import leago.models.Team;
import leago.models.Tournament;
import leago.models.User;
import leago.models.email.SendEmail;

/**
 *
 * @author v094702
 */
public class UserHelper {

    public UserHelper() {

    }

    public void leaveTeam(User user, Team team) throws DatabaseConnectionException, UserUpdateException {

        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            statement.execute("DELETE FROM user_team WHERE user = '" + user.getName() + "' AND team = '" + team.getName() + "'");

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new UserUpdateException("User update failed unexpectedly with an SQL error " + ex.getSQLState(), MyException.ERROR);
        }

    }

    public void createUser(String name, String email, String password, String reenter_password) throws DatabaseConnectionException, UserCreationException {

        int result;

        try {
            if (password.equals(reenter_password)) {
                if (!isUserExisting(name)) {
                    if (!isEmailAlreadyTaken(email)) {

                        String salt = BCrypt.gensalt(10);
                        String hashpw = BCrypt.createHash(password, salt);

                        Connection con = DatabaseHelper.connect();
                        Statement statement = con.createStatement();

                        result = statement.executeUpdate("insert into user"
                                + " (username, password, email)"
                                + " VALUES ('" + name + "','" + hashpw + "','" + email + "')");

                        if (result < 1) {
                            throw new UserCreationException("An error occured while creating the user account", MyException.ERROR);
                        }

                        // Username is already taken
                    } else {
                        throw new UserCreationException("Email already taken", MyException.ERROR);
                    }
                    // Email address is already taken
                } else {
                    throw new UserCreationException("Username already taken", MyException.ERROR);
                }
                // passwords aren't equal
            } else {
                throw new UserCreationException("The passwords aren't matching", MyException.ERROR);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new UserCreationException("User creation failed unexpectedly with an SQL error " + ex.getSQLState(), MyException.ERROR);
        }
    }

    public boolean isUserExisting(String name) throws DatabaseConnectionException {
        boolean userExisting = false;

        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select COUNT(*) as count from user WHERE username = '" + name + "'");

            resultSet.first();

            if (resultSet.getInt("count") > 0) {
                userExisting = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
        }

        return userExisting;
    }

    private boolean isEmailAlreadyTaken(String email) throws DatabaseConnectionException {
        boolean alreadyTaken = false;

        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("SELECT * FROM user WHERE email = '" + email + "'");

            if (!resultSet.isBeforeFirst()) {
                alreadyTaken = true;
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
        }

        return alreadyTaken;
    }

    public boolean authenticate(String id, String password) throws AuthenticationException, DatabaseConnectionException {

        boolean result = false;

        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select * "
                    + " FROM user"
                    + " WHERE (email='" + id + "' OR username='" + id + "')");

            if (resultSet.next()) {
                if (BCrypt.checkPassword(password, resultSet.getString("password"))) {
                    result = true;
                } else {
                    throw new AuthenticationException("Username and/or password are wrong", MyException.ERROR);
                }
            } else {
                throw new AuthenticationException("Username and/or password are wrong", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new AuthenticationException("An error occured while forwarding your information", MyException.ERROR);
        }

        return result;
    }

    /**
     * @param id Id of the user
     * @return user - User object filled with the information from the database.
     * @throws DatabaseConnectionException
     * @throws leago.error.exceptions.UserNotExistingException
     */
    public User getUser(String id) throws DatabaseConnectionException, UserNotExistingException {

        User user = new User();

        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from user where username='" + id + "' OR email='" + id + "'");

            if (!resultSet.isBeforeFirst()) {
                throw new UserNotExistingException("There is no user with this name", MyException.INFO);
            } else {
                resultSet.first();

                Statistics statistics = new Statistics(resultSet.getInt("goals"),
                        resultSet.getInt("goals_conceded"),
                        resultSet.getInt("wins"),
                        resultSet.getInt("defeats"),
                        resultSet.getInt("tournament_wins"),
                        resultSet.getInt("tournament_participations"));

                user.setName(resultSet.getString("username"));
                user.setEmail(resultSet.getString("email"));
                user.setPassword(resultSet.getString("password"));
                user.setCreate_date(resultSet.getDate("create_date"));
                user.setStatistics(statistics);
                user.setTeams(getTeams(user.getName()));
                user.setTournaments(getTournaments(user.getName()));
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the user information", MyException.ERROR);
        }

        return user;

    }

    /**
     *
     * @param username Name of the user
     * @return List of the teams in which the user is currently active
     * @throws DatabaseConnectionException
     */
    public List<Team> getTeams(String username) throws DatabaseConnectionException {
        List<Team> teams = new ArrayList<Team>();

        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT name, tag, create_date, leader, team.wins, team.defeats, "
                    + "team.goals, team.goals_conceded, team.tournament_wins, team.tournament_participations"
                    + " FROM  team, user_team"
                    + " WHERE user = '" + username + "'"
                    + "   AND team = name");
            while (resultSet.next()) {
                Team team = new Team();
                team.setName(resultSet.getString("name"));
                team.setLeader(new User(resultSet.getString("leader")));
                teams.add(team);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the user information", MyException.ERROR);
        }

        return teams;
    }

    /**
     *
     * @param username Name of the user
     * @return List of alle tournaments in which the user is currently active
     * @throws DatabaseConnectionException
     */
    public List<Tournament> getTournaments(String username) throws DatabaseConnectionException {
        List<Tournament> tournaments = new ArrayList<>();

        try {
            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();

            ResultSet resultSet = statement.executeQuery("SELECT distinct tou.name, tou.leader"
                    + " FROM  tournament tou, team_tournament teto, team te, user_team ut, user u"
                    + " WHERE (tou.name = teto.tournament"
                    + "   AND teto.team = te.name"
                    + "   AND te.name = ut.team"
                    + "   AND ut.user = u.username"
                    + "   AND username = '" + username + "')"
                    + "   OR  tou.leader = '" + username + "'"
                    + " ORDER BY tou.name, tou.start_date");

            while (resultSet.next()) {
                Tournament tournament = new Tournament();
                tournament.setName(resultSet.getString("tou.name"));
                tournament.setLeader(new User(resultSet.getString("tou.leader")));
                tournaments.add(tournament);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
            throw new DatabaseConnectionException("An error occured while getting the user information", MyException.ERROR);
        }

        return tournaments;
    }

    public void updateName(String user, String name1, String name2) throws DatabaseConnectionException, UserUpdateException {
        try {
            int result;

            if (name1.equals(name2)) {
                if (!isUserExisting(name1)) {
                    Connection con = DatabaseHelper.connect();
                    Statement statement = con.createStatement();
                    result = statement.executeUpdate("update user set username='" + name1 + "' where username = '" + user + "'");

                    if (result < 1) {
                        throw new UserUpdateException("An error occured while updating the username", MyException.ERROR);
                    }
                } else {
                    throw new UserUpdateException("The name is already taken", MyException.ERROR);
                }
            } else {
                throw new UserUpdateException("The names aren't matching", MyException.ERROR);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updateEmail(String user, String email1, String email2) throws DatabaseConnectionException, UserUpdateException {
        try {
            int result;

            if (email1.equals(email2)) {
                if (isEmailAlreadyTaken(email1)) {
                    Connection con = DatabaseHelper.connect();
                    Statement statement = con.createStatement();
                    result = statement.executeUpdate("update user set email='" + email1 + "' where username = '" + user + "'");

                    if (result < 1) {
                        throw new UserUpdateException("An error occured while updating the email address", MyException.ERROR);
                    }
                } else {
                    throw new UserUpdateException("The email is already taken", MyException.ERROR);
                }
            } else {
                throw new UserUpdateException("The emails aren't matching", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void updatePassword(User user, String password1, String password2, String passwordOld) throws DatabaseConnectionException, UserUpdateException {
        try {
            int result;

            if (user.getPassword().equals(passwordOld)) {

                if (password1.equals(password2)) {
                    Connection con = DatabaseHelper.connect();
                    Statement statement = con.createStatement();
                    result = statement.executeUpdate("update user set password='" + password1 + "' where username = '" + user.getName() + "'");

                    if (result < 1) {
                        throw new UserUpdateException("An error occured while updating the password", MyException.ERROR);
                    }
                } else {
                    throw new UserUpdateException("The passwords aren't matching", MyException.ERROR);
                }

            } else {
                throw new UserUpdateException("The password is wrong", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void resetPassword(String email) throws DatabaseConnectionException, UserUpdateException {
        try {
            int result = 0;

            if (!isEmailAlreadyTaken(email)) {
                SendEmail mailer = new SendEmail();
                StringBuilder buffer = new StringBuilder();
                String characters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
                int charactersLength = characters.length();
                String tempPW = "";

                for (int i = 0; i < 10; i++) {
                    double index = Math.random() * charactersLength;
                    buffer.append(characters.charAt((int) index));
                }

                tempPW = buffer.toString();

                //send mailo with temporary password
                mailer.sendMail("malte110392@gmail.com", tempPW);

                System.err.println(tempPW);
                String salt = "";
                salt = BCrypt.gensalt(10);
                tempPW = BCrypt.createHash(tempPW, salt);
                Connection con = DatabaseHelper.connect();
                Statement statement = con.createStatement();
                result = statement.executeUpdate("update user set password='" + tempPW + "' where email = '" + email + "'");
            }

            if (result < 1) {
                throw new UserUpdateException("An error occured while resetting the password", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public void deleteUser(User user) throws DatabaseConnectionException, UserUpdateException {
        try {
            int result;

            Connection con = DatabaseHelper.connect();
            Statement statement = con.createStatement();
            result = statement.executeUpdate("DELETE FROM user WHERE username = '" + user.getName() + "'");

            if (result < 1) {
                throw new UserUpdateException("An error occured while deleting the account", MyException.ERROR);
            }

        } catch (SQLException ex) {
            Logger.getLogger(UserHelper.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
