package com.Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.PreparedStatement;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.io.File;
import java.util.*;
import java.io.*;

/**
 *
 * @author Chelsea
 */
public class JDBFunctions {
    
    private Connection connect = null;
    private Statement statement = null;
    public HttpSession session = null;
   
    private ResultSet resultSet = null;
    private ResultSet rs = null;
    public int LoggedInID;
    public int userID;
    public String username;
    public String email;
    public String passwordhash;
    public String firstname;
    public String lastname;
    
    private static final String dbPropertiesFile =
        "<?xml version=\"1.0\" encoding=\"UTF-8\" standalone=\"no\"?>\n" +
        "<!DOCTYPE properties SYSTEM \"http://java.sun.com/dtd/properties.dtd\">\n" +
        "<properties>\n" +
        "<comment>no comments</comment>\n" +
        "<entry key=\"user\">postgres</entry>\n" +
        "<entry key=\"password\">chelocean</entry>\n" +
        "<entry key=\"dbhost\">localhost</entry>\n" +
        "<entry key=\"dbport\">5432</entry>\n" +
        "<entry key=\"dbname\">YouVote</entry>\n" +
        "</properties>";
    private static final String dbConnString = "jdbc:postgresql://%s:%s/%s";
    
    public JDBFunctions(){
        Properties props = new Properties();
        try {
            ByteArrayInputStream in = new ByteArrayInputStream(dbPropertiesFile.getBytes("UTF-8"));
            props.loadFromXML(in);
        } catch (IOException e) {
            throw new RuntimeException(e.toString());
        }
        try {
            connect = getConnection(props);
        } catch (SQLException ex) {
            Logger.getLogger(JDBFunctions.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void execute(PreparedStatement prepSQL) throws SQLException
    {
         prepSQL.executeUpdate();
       
    }
    
    public PreparedStatement getNewPreparedStatement(String s) throws SQLException{
          return connect.prepareStatement(s);
    }
    
    public ResultSet select(String SQL) throws SQLException
    {
        ResultSet rs = null;
        statement = connect.createStatement();
        rs = statement.executeQuery(SQL);
        return rs;
    }
    
    public boolean login(String username, String passwordhash) throws Exception
    {
        String SQLstatement;
        String salt = "";
        boolean result = false;
        
        SQLstatement = "SELECT salt "
                       + "FROM tbl_users "
                       + "WHERE upper(username) = upper('" + username + "') "
                       + "GROUP BY userID";
        
        rs = select(SQLstatement);
        //System.out.println(SQLstatement);
        
        try
        {
            if(rs.next())
            {
                salt = rs.getString("salt");
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
        
        
        JSHA512Hash hash = new JSHA512Hash();
        
        SQLstatement = "SELECT COUNT(*) as cnt, userID "
                + "FROM tbl_users WHERE upper(username) = upper('" + username + "') "
                + "AND passwordhash = '" + hash.sha512(passwordhash + salt, 50)
                + "' GROUP BY userID"; 
        
        resultSet = select(SQLstatement);
        //System.out.println(SQLstatement);
        try
        {
            if(resultSet.next())
            {
                if(resultSet.getInt("cnt") > 0)
                {
                    result = true;
                    LoggedInID = resultSet.getInt("userID");
                }
                else
                {
                    result = false;
                }
            }
        }
        catch(SQLException e)
        {
            System.out.println("Exception in JDBFunctions: " + e);
        }
        
        return result;
    }
    
    public void saveLoginID(Integer pLoginID)
    {
        session.setAttribute("LoggedInID", pLoginID);
    }
    
    public Integer getLoginID()
    {
        return (Integer)session.getAttribute("LoggedInID");
    }
    
    public void saveUserID(Integer pUserID)
    {
        session.setAttribute("userID", pUserID);
    }
    
    public Integer getUserID()
    {
        return (Integer)session.getAttribute("userID");
    }
    
    public void getUserInfo(Integer pUserID)
    {
        String sql;
        sql = "SELECT * FROM tbl_users WHERE userID = " + pUserID.toString(); 
        try
        {
            resultSet = select(sql);
            if(resultSet.next())
            {
                userID = resultSet.getInt("userID");
                username = resultSet.getString("username");
                email = resultSet.getString("email");
                passwordhash = resultSet.getString("passwordhash");
                firstname = resultSet.getString("firstname");
                lastname = resultSet.getString("lastname");
            }
        }
        catch(SQLException e)
        {
            System.out.println(e);
        }
    }
    
    private Connection getConnection(Properties props) throws SQLException {
        try {
            // This will load the PostgreSQL driver, each DB has its own driver
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(JDBFunctions.class.getName()).log(Level.SEVERE, null, ex);
        }

        int failCount = 0;
        boolean successful = false;
        Connection conn = null;
        SQLException excep = null;
        String customDBConnString = String.format(dbConnString, props.getProperty("dbhost"), props.getProperty("dbport"), props.getProperty("dbname"));
        while (failCount < 5 && !successful) {
            try {
                conn = DriverManager.getConnection(customDBConnString, props);
                successful = true;
            } catch (SQLException e) {
                excep = e;
                ++failCount;
                try {
                    // sleep for short time to give time to recover from transient error
                    Thread.sleep(1000);
                } catch (InterruptedException e1) {
                    Logger.getLogger(JDBFunctions.class.getName()).log(Level.SEVERE, null, e1);
                }
            }
        }
        if (!successful) {
            throw excep;
        }
        return conn;
    }
}
