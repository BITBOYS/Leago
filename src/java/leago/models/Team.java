package leago.models;

import java.sql.Date;
import java.util.List;

/**
 * @author Maik
 */
public class Team {
    
    private String name;
    private String tag;
    private Date create_date;
    private User leader;
    private String password;
    private Statistics statistics;
    private List<User> member;
    private List<Tournament> tournaments;
    
    public Team() {
        super();
    }
    
    public Team(String name) {
        this.name = name;
    }

    public Team(String name, String tag, User leader, Date create_date) {
        this.name = name;
        this.tag = tag;
        this.leader = leader;
        this.create_date = create_date;
    }
    
    public Team(String name, String tag, String password, User leader, Date create_date) {
        this.name = name;
        this.tag = tag;
        this.password = password;
        this.leader = leader;
        this.create_date = create_date;
    }

    public Team(String name, String tag, String password, User leader, Statistics statistics, Date create_date) {
        this.name = name;
        this.tag = tag;
        this.password = password;
        this.leader = leader;
        this.statistics = statistics;
        this.create_date = create_date;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getTag() {
        return tag;
    }

    public void setTag(String tag) {
        this.tag = tag;
    }

    public User getLeader() {
        return leader;
    }

    public void setLeader(User leader) {
        this.leader = leader;
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

    public List<User> getMember() {
        return member;
    }

    public void setMember(List<User> member) {
        this.member = member;
    }

    public List<Tournament> getTournaments() {
        return tournaments;
    }

    public void setTournaments(List<Tournament> tournaments) {
        this.tournaments = tournaments;
    }

    @Override
    public String toString() {
        return "Team{" + "name=" + name + ", tag=" + tag + ", create_date=" + create_date + ", leader=" + leader + ", password=" + password + ", statistics=" + statistics + ", member=" + member + ", tournaments=" + tournaments + '}';
    }
}
