/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package leago.error;

/**
 *
 * @author v094702
 */
public class MyException extends Exception {
    
    public static final String ERROR = "error";
    public static final String INFO = "info";
    public static final String SUCCESS = "success";
    
    private String status;

    public MyException(String message, String status) {
        super(message);
        this.status = status;
    }
    
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
    
    
}
