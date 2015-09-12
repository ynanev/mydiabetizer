/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import beans.userBeanLocal;
import controllers.EncryptionControl;
import dp.EncrAlgs;
import java.io.IOException;
import java.io.PrintWriter;
import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Rock n Roll
 */
public class SingIn extends HttpServlet
{
    @EJB
    private userBeanLocal userBean;

   

   
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
      
    }      
        
        
        
        
    

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException 
    {
        
        String firstName=null;
        String lastName=null;
        String email=null;
        String password=null;
        String passwordRetyped=null;  
        String hexPassword;
        String errorEmpty=null;  
        
        try
        {
        firstName=request.getParameter("firstName");//
        if(firstName.equals(null))
        {
            firstNameError = "Please enter your name.";
        }
        if () {
            firstNameError = "You
        lastName=request.getParameter("lastName");
        email=request.getParameter("email");
        password=request.getParameter("password");
        passwordRetyped=request.getParameter("passwordRetyped");
        
         if(!password.equals(passwordRetyped))
         {
            request.setAttribute(firstNameError,firstNameError);  
           request.setAttribute(firstName, firstName);
           this.getServletContext().getRequestDispatcher("/register.jsp").forward(request, response);
         } //ERROR PAGE TO BE DISPLAYED
        
        }
        catch (Exception  e)
             {
             this.getServletContext().getRequestDispatcher("/login.jsp").forward(request, response);
             }
        
       EncryptionControl encr =new EncrAlgs(password);
       encr.run();
       hexPassword=encr.getHexPassword();
       
       userBean.storeUser(firstName,lastName,email,hexPassword);
        
      
    }

   
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
