package leago.models;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.List;
import java.sql.Time;

/**
 * @author Malte
 */
public class Tournament {

    private String name;
    private String password;
    private String description;
    private User leader;
    private Date start_date;
    private Time start_time;
    private Date end_date;
    private Time end_time;
    private Date create_date;
    private int nr_matchdays;
    private String venue;
    private Date term_of_application;
    private List<Table> table;

    public Tournament() {
        super();
    }

    public Tournament(String name) {
        this.name = name;
    }

    public Tournament(String name, String password, String description, User leader, Date start_date, Time start_time, Date end_date, Time end_time, Date create_date, int nr_matchdays, String venue, Date term_of_application) {
        this.name = name;
        this.password = password;
        this.description = description;
        this.leader = leader;
        this.start_date = start_date;
        this.start_time = start_time;
        this.end_date = end_date;
        this.end_time = end_time;
        this.create_date = create_date;
        this.nr_matchdays = nr_matchdays;
        this.venue = venue;
        this.term_of_application = term_of_application;
    }

    public Tournament(String name, String password, String description, User leader, Date start_date, Time start_time, Date end_date, Time end_time, Date create_date, int nr_matchdays, String venue, Date term_of_application, List<Table> table) {
        this.name = name;
        this.password = password;
        this.description = description;
        this.leader = leader;
        this.start_date = start_date;
        this.start_time = start_time;
        this.end_date = end_date;
        this.end_time = end_time;
        this.create_date = create_date;
        this.nr_matchdays = nr_matchdays;
        this.venue = venue;
        this.term_of_application = term_of_application;
        this.table = table;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
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

    public int getNr_matchdays() {
        return nr_matchdays;
    }

    public void setNr_matchdays(int nr_matchdays) {
        this.nr_matchdays = nr_matchdays;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public Date getTerm_of_application() {
        return term_of_application;
    }

    public void setTerm_of_application(Date term_of_application) {
        this.term_of_application = term_of_application;
    }

    public List<Table> getTable() {
        return table;
    }

    public void setTable(List<Table> table) {
        this.table = table;
    }

    public String getStart_time() {
        String startTime = "--:--";
        if (start_time != null) {
            startTime = new SimpleDateFormat("HH:mm").format(start_time.getTime());
        }
        return startTime;
    }

    public String getEnd_time() {
        String endTime = "--:--";
        if (end_time != null) {
            endTime = new SimpleDateFormat("HH:mm").format(end_time.getTime());
        }
        return endTime;
    }

    public void setStart_time(Time start_time) {
        this.start_time = start_time;
    }

    public void setEnd_time(Time end_time) {
        this.end_time = end_time;
    }

    public String getCountdown() {
        java.util.Date today = new java.util.Date();
        long diff = term_of_application.getTime() - today.getTime();
        if (diff > 0) {

            long diffSeconds = diff / 1000 % 60;
            long diffMinutes = diff / (60 * 1000) % 60;
            long diffHours = diff / (60 * 60 * 1000) % 24;
            long diffDays = diff / (24 * 60 * 60 * 1000);

            return (" noch " + String.valueOf(diffDays)) + " Tage, " + (String.valueOf(diffHours)) + " Stunden, " + (String.valueOf(diffMinutes)) + " Minuten ";
        } else {
            return "Anmeldefrist abgelaufen";
        }

    }

    @Override
    public String toString() {
        return "Tournament{" + "name=" + name + ", password=" + password + ", description=" + description + ", leader=" + leader + ", start_date=" + start_date + ", start_time=" + start_time + ", end_date=" + end_date + ", end_time=" + end_time + ", create_date=" + create_date + ", nr_matchdays=" + nr_matchdays + ", venue=" + venue + ", term_of_application=" + term_of_application + ", table=" + table + '}';
    }

}
