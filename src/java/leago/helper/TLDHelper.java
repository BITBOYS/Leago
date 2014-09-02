/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.helper;

import java.util.List;
import leago.models.Team;
import leago.models.Tournament;

/**
 *
 * @author v094702
 */
public class TLDHelper {
    
    public static boolean isUserInTeam(Team team, List<Team> teams){
        boolean result = false;
        
        if(teams != null) {
            for(Team idx_team : teams) {
                if(idx_team.getName().equals(team.getName())) {
                    result = true;
                }
            }
        }
        
        return result;
    }
    
    public static boolean isUserInTournament(Tournament tournament, List<Tournament> tournaments){
        boolean result = false;
        
        if(tournaments != null) {
            for(Tournament idx_tournament : tournaments) {
                if(idx_tournament.getName().equals(tournament.getName())) {
                    result = true;
                }
            }
        }
        
        return result;
    }
    
}