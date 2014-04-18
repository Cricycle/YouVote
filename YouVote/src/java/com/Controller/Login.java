package com.Controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.Model.JDBFunctions;
import com.Model.JSHA512Hash;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chelsea
 */
public class Login extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
           JDBFunctions user = new JDBFunctions(); 
           
           /*
            Beginning the login process
           Setting needed attributes including parameters from post
           */

            String salt = "";

            String username = request.getParameter("username");
            String password = request.getParameter("password");

            //This query gets the salt of the tuple with this username
            
            String getSaltOfUserString = "SELECT salt "
                           + "FROM tbl_users "
                           + "WHERE upper(username) = upper(?) "
                           + "GROUP BY userID";


             
            //Create a prepared statement
            PreparedStatement saltOfUser = null;
            try {
                saltOfUser = user.getNewPreparedStatement(getSaltOfUserString);

                saltOfUser.setString(1,username);

            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                return;
            }

            //Run the prepared statement's query for the salt
            try(ResultSet rs = user.select(saltOfUser))
            {
                /*
                If there is anything from the query
                It is the salt! So get that to log them in :)
                */
                if(rs.next())
                {
                    salt = rs.getString("salt");
                    System.out.println("salt is" + salt);
                }
            }
            catch(SQLException e)
            {
                System.out.println("Query of salt error" + e);
            }

            //Instantiate a new hash function object
            JSHA512Hash hash = new JSHA512Hash();

            //This is the query to get the userID of the person with the user name and password hash
            String loginUserString = "SELECT userID "
                    + "FROM tbl_users WHERE upper(username) = upper(?) "
                    + "AND passwordhash = ? GROUP BY userID"; 

            //Create a prepared statement
            PreparedStatement loginUser = null;
            try {
                loginUser = user.getNewPreparedStatement(loginUserString);
                loginUser.setString(1,username);
                loginUser.setString(2, hash.sha512(password + salt, 50));
            } catch (SQLException ex) {
                Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                return;
            }

            //Run the prepared statement's query for the user ID
            try(ResultSet resultSet = user.select(loginUser))
            {
                /*
                if there is anything in the set, which means
                it is the correct userID
                */
                if(resultSet.next())
                {
                    /*
                    Set the session to true, set the loginID and redirect the user
                    to the homepage :)
                    */
                        user.session = request.getSession(true);
                        user.saveLoginID(resultSet.getInt("userID"));
                        request.getRequestDispatcher("index.jsp").forward(request, response);
                }
                    else
                   {
                       /*
                       The user has failed to login
                       Send them back to account.jsp
                       */
                       request.setAttribute("failedLogin", "true");
                       request.getRequestDispatcher("account.jsp").forward(request, response);
                   }

            }
            catch(SQLException e)
            {
                System.out.println("Exception in JDBFunctions: " + e);
            }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
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
