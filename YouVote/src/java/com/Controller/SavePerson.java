/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.JDBFunctions;
import com.Model.JMD5Hash;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Chelsea
 */
@WebServlet(name = "SavePerson", urlPatterns = {"/SavePerson"})
public class SavePerson extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            JDBFunctions user = new JDBFunctions();
            JMD5Hash hash = new JMD5Hash();
            
            Integer userIDs = 0;
            String ID = request.getParameter("userID");
            //out.println("Test: " + ID);
            userIDs = Integer.parseInt(ID);
            
            // Salt Code
            String SALTCHARS = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890";
            StringBuffer salt = new StringBuffer();
            java.util.Random rnd = new java.util.Random();
            // build a random 9 chars salt     
            while (salt.length()  < 9)
            {
                int index = (int) (rnd.nextFloat() * SALTCHARS.length());
                salt.append(SALTCHARS.substring(index, index+1));
            }
            String saltStr = salt.toString();
            
            
            String sqlStatementInsert = "INSERT INTO users(username, email, salt, passwordhash, firstname, lastname) VALUES( ?, ?, ?, ?, ?, ?)";
                //System.out.println("Created sqlStatementInsert");         
            PreparedStatement insertUser = user.getNewPreparedStatement(sqlStatementInsert);
                //System.out.println("Created prepared statement sqlStatementInsert");
            insertUser.setString(1,request.getParameter("username"));
            insertUser.setString(2,request.getParameter("email"));
            insertUser.setString(3,saltStr);
            insertUser.setString(4,hash.md5(request.getParameter("passwordhash") + saltStr));
            insertUser.setString(5,request.getParameter("firstname"));
            insertUser.setString(6,request.getParameter("lastname"));
                //System.out.println("Set prepared statement sqlStatementInsert");
                //System.out.println(sqlStatementInsert +" first name " + request.getParameter("firstname") + " last name " + request.getParameter("lastname"));
                
            
            String sqlStatementUpdate = "UPDATE Users set email = ?, salt = ?, passwordhash = ?, firstname = ?, lastname = ? where userID = ?";
                //System.out.println("Created sqlStatementUpdate");
            
            PreparedStatement updateUser = user.getNewPreparedStatement(sqlStatementUpdate);
                //System.out.println("Created prepared sqlStatementUpdate");
            updateUser.setString(1,request.getParameter("email"));
            updateUser.setString(2,saltStr);
            updateUser.setString(3,hash.md5(request.getParameter("passwordhash") + saltStr));
            updateUser.setString(4,request.getParameter("firstname"));
            updateUser.setString(5,request.getParameter("lastname"));
            updateUser.setInt(6,userIDs);
                //System.out.println("Set prepared statement sqlStatementUpdate");
                //System.out.println(sqlStatementUpdate);
            
            if(userIDs == 0)
            {
                try
                {
                    user.execute(insertUser);
                    response.sendRedirect("index.jsp");
                }
                catch(Exception e)
                {
                    System.out.println("Save Person: " + e);
                }
            }
            else
            {
                try
                {
                    user.execute(updateUser);
                    response.sendRedirect("accountinfo.jsp");
                }
                catch(Exception e)
                {
                    System.out.println("Save Person: " + e);
                }
            } 
            
            user.session = request.getSession(true);
            user.saveUserID(userIDs);
        } catch (SQLException ex) {
            Logger.getLogger(SavePerson.class.getName()).log(Level.SEVERE, null, ex);
            System.out.println("Catch statement of SavePerson");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
            processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
