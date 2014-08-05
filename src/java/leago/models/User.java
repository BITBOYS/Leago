package leago.models;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @author Maik
 */
public class User {
    
    private String name;
    private String email;
    private Date create_date;
    private String password;
    private Statistics statistics;
    private List<Team> teams;
    private List<Tournament> tournaments;
    
    public User() {
        super();
    }
    
    public User(String name) {
        super();
        setName(name);
    }
    
    public User(String name, String email, String password, Statistics statistics, Date create_date) {
        this.name = name;
        this.email = email;
        this.password = password;
        this.statistics = statistics;
        this.create_date = create_date;
    }

    public String getName() {
        return name;
    }

    public void setName(String username) {
        this.name = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Statistics getStatistics() {
        return statistics;
    }

    public void setStatistics(Statistics statistics) {
        this.statistics = statistics;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public List<Team> getTeams() {
        return teams;
    }

    public void setTeams(List<Team> teams) {
        this.teams = teams;
    }

    public List<Tournament> getTournaments() {
        return tournaments;
    }

    public void setTournaments(List<Tournament> tournaments) {
        this.tournaments = tournaments;
    }

    public String getCreate_date_web() {
        SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy");
        String formattedDate = formatter.format(create_date);
        
        return formattedDate;
    }
    
    @Override
    public String toString() {
        return "User{" + "username=" + name + ", email=" + email + ", create_date=" + create_date + ", password=" + password + ", statistics=" + statistics + '}';
    }
    
}
