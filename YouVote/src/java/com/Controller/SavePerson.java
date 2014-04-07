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
            
            String sqlStatementInsert = "INSERT INTO users(username, email, salt, passwordhash, firstname, lastname)"
                    + " VALUES(" 
                    + "'" + request.getParameter("username") + "', "
                    + "'" + request.getParameter("email") + "', "
                    + "'" + saltStr + "', "
                    + "'" + hash.md5(request.getParameter("passwordhash") + saltStr) + "', "
                    + "'" + request.getParameter("firstname") + "', "
                    + "'" + request.getParameter("lastname") + "'"
                    + ")";
            
            String sqlStatementUpdate;
            sqlStatementUpdate = "UPDATE Users "
                + "set email = '" + request.getParameter("email") + "', "
                + "passwordhash = '" + hash.md5(request.getParameter("passwordhash")) + "', "
                + "firstname = '" + request.getParameter("firstname") + "', "
                + "lastname = '" + request.getParameter("lastname") + "'"
                + " where userID = " + userIDs;
       
            
            if(userIDs == 0)
            {
                try
                {
                    user.execute(sqlStatementInsert);
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
                    user.execute(sqlStatementUpdate);
                    response.sendRedirect("accountinfo.jsp");
                }
                catch(Exception e)
                {
                    System.out.println("Save Person: " + e);
                }
            } 
            
            user.session = request.getSession(true);
            user.saveUserID(userIDs);
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
