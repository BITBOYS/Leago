/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.helper;

import java.util.List;
import leago.models.Team;

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
    
}