package leago.models;

import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @author Malte
 */
public class Tournament {

    private String name;
    private String description;
    private User leader;
    private Date start_date;
    private Date end_date;
    private Date create_date;
    private int rounds;
    private String venue;
    private Date deadline;
    private List<Table> table;
    private List<Team> teams;
    private List<User> member;
    private Schedule schedule;

    public Tournament() {
        super();
    }

    public Tournament(String name) {
        this.name = name;
    }

    public Tournament(String name, String description, User leader, Date start_date, Date end_date, Date create_date, int nr_matchdays, String venue, Date deadline) {
        this.name = name;
        this.description = description;
        this.leader = leader;
        this.start_date = start_date;
        this.end_date = end_date;
        this.create_date = create_date;
        this.rounds = nr_matchdays;
        this.venue = venue;
        this.deadline = deadline;
    }

    public Tournament(String name, String description, User leader, Date start_date, Date end_date, Date create_date, int nr_matchdays, String venue, Date deadline, List<Table> table, List<Team> teams, List<User> member, Schedule shedule) {
        this.name = name;
        this.description = description;
        this.leader = leader;
        this.start_date = start_date;
        this.end_date = end_date;
        this.create_date = create_date;
        this.rounds = nr_matchdays;
        this.venue = venue;
        this.deadline = deadline;
        this.table = table;
        this.teams = teams;
        this.member = member;
        this.schedule = shedule;
    }


    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public User getLeader() {
        return leader;
    }

    public void setLeader(User leader) {
        this.leader = leader;
    }

    public Date getStart_date() {
        return start_date;
    }

    public void setStart_date(Date start_date) {
        this.start_date = start_date;
    }

    public Date getEnd_date() {
        return end_date;
    }

    public void setEnd_date(Date end_date) {
        this.end_date = end_date;
    }

    public Date getCreate_date() {
        return create_date;
    }

    public void setCreate_date(Date create_date) {
        this.create_date = create_date;
    }

    public int getRounds() {
        return rounds;
    }

    public void setRounds(int rounds) {
        this.rounds = rounds;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public Date getDeadline() {
        return deadline;
    }

    public void setDeadline(Date deadline) {
        this.deadline = deadline;
    }

    public List<Table> getTable() {
        return table;
    }

    public void setTable(List<Table> table) {
        this.table = table;
    }

    public List<Team> getTeams() {
        return teams;
    }

    public void setTeams(List<Team> teams) {
        this.teams = teams;
    }

    public List<User> getMember() {
        return member;
    }

    public void setMember(List<User> member) {
        this.member = member;
    }

    public Schedule getSchedule() {
        return schedule;
    }

    public void setSchedule(Schedule schedule) {
        this.schedule = schedule;
    }
    
    public String getCountdown() {
        String result = "";
        
        if(deadline != null) {
            java.util.Date today = new java.util.Date();
            long diff = deadline.getTime() - today.getTime();
            
            if (diff > 0) {
                long diffMinutes = diff / (60 * 1000) % 60;
                long diffHours = diff / (60 * 60 * 1000) % 24;
                long diffDays = diff / (24 * 60 * 60 * 1000);

                result = " noch " + String.valueOf(diffDays) + " Tage, " + String.valueOf(diffHours) + " Stunden, " + String.valueOf(diffMinutes) + " Minuten ";
            }
        }
        
        return result;
    }

    public String getCreate_date_web() {
        String result;
        
        if(create_date == null) {
            result = "";
        } else {
            SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
            result = formatter.format(create_date);
        }
        
        return result;
    }

    public String getStart_date_web() {
        String result;
        
        if(start_date == null) {
            result = "";
        } else {
            SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
            result = formatter.format(start_date);
        }
        
        return result;
    }

    public String getEnd_date_web() {
        String result;
        
        if(end_date == null) {
            result = "";
        } else {
            SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
            result = formatter.format(end_date);
        }
        
        return result;
    }

    public String getDeadline_web() {
        String result;
        
        if(deadline == null) {
            result = "";
        } else {
            SimpleDateFormat formatter = new SimpleDateFormat("dd.MM.yyyy HH:mm");
            result = formatter.format(deadline);
        }
        
        return result;
    }

    @Override
    public String toString() {
        return "Tournament{" + "name=" + name + ", description=" + description + ", leader=" + leader + ", start_date=" + start_date + ", create_date=" + create_date + ", nr_matchdays=" + rounds + ", venue=" + venue + ", deadline=" + deadline + ", table=" + table + ", teams=" + teams + ", member=" + member + ", shedule=" + schedule + '}';
    }
}
