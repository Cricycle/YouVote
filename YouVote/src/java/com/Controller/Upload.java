/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package com.Controller;

import com.Model.JDBFunctions;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.*;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.Part;

/**
 *
 * @author Alex
 */
@MultipartConfig
public class Upload extends HttpServlet {

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
            
            String description = request.getParameter("description"); // Retrieves <input type="text" name="description">
            Part filePart = request.getPart("image_file"); // Retrieves <input type="file" name="file">
            int userid = Integer.parseInt(request.getParameter("userid"));
            String filename = (new java.util.Date()).getTime() + "_" + filePart.getSubmittedFileName();
            
            InputStream filecontent = filePart.getInputStream();
            OutputStream outout = new FileOutputStream("C:\\Users\\Alex\\Documents\\GitHub\\YouVote\\YouVote\\web\\images\\uploads\\" + filename);
            byte[] data = new byte[1<<16];
            int len = -1;
            int total = 0;
            while ((len = filecontent.read(data)) > 0) {
                outout.write(data, 0, len);
                total += len;
            }
            outout.close();
            out.println("<p>Success</p>");
            /*out.println("<p>" + request.getParameter("filedim") + "</p>");
            Collection<Part> pp = request.getParts();
            for(Part p: pp) {
                out.println("<p>" + p.getName() + "</p>");
                Collection<String> hn = p.getHeaderNames();
                for (String s: hn) {
                    out.println("<p>---" + s + "</p>");
                    out.println("<p>------" + p.getHeader(s) + "</p>");
                }
            }*/
            
            JDBFunctions dbconn = new JDBFunctions();
            String insertsql = "INSERT INTO tbl_photos(imagePath, userID, categoryID, description, imageSize, uploadDate) VALUES (?, ?, ?, ?, ?, ?);";
            PreparedStatement st;
            try {
                st = dbconn.getNewPreparedStatement(insertsql);
                st.setString(1, "images/uploads/" + filename);
                st.setInt(2, userid);
                st.setInt(3, 1);
                st.setString(4, description.substring(0, Math.min(description.length(), 500)));
                st.setInt(5, total);
                st.setTimestamp(6, new java.sql.Timestamp((new java.util.Date()).getTime()));
                dbconn.execute(st);
            } catch (SQLException ex) {
                Logger.getLogger(Upload.class.getName()).log(Level.SEVERE, null, ex);
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
