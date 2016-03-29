/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package statics;

import beans.AccountRationBeanLocal;
import ent.Userratios;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

/**
 *
 * @author Rock n Roll
 */
public class Insulin
{

    AccountRationBeanLocal accountRationBean = lookupAccountRationBeanLocal();
   
    
    
    
    public Insulin() 
    {
        
    }

    public int InsulinUnitsCalculation(int userid,int carbs)
    {
       Userratios uri = new Userratios();
             uri  = accountRationBean.getUsersRatios(userid);
        
        
        return (int) carbs / (int) uri.getGeneral();
    }
    
    
    
    private AccountRationBeanLocal lookupAccountRationBeanLocal() {
        try {
            Context c = new InitialContext();
            return (AccountRationBeanLocal) c.lookup("java:global/mydiabetizer/mydiabetizer-ejb/AccountRationBean!beans.AccountRationBeanLocal");
        } catch (NamingException ne) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", ne);
            throw new RuntimeException(ne);
        }
    }
    
    
    
    
}
