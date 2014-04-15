package com.Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;
import com.Model.JMD5Hash;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

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
    
    public JDBFunctions(){
        try
        {
            // This will load the PostgreSQL driver, each DB has its own driver
            Class.forName("org.postgresql.Driver");
            // Setup the connection with the DB
            connect = DriverManager.getConnection("jdbc:postgresql://localhost:5432/YouVote", "postgres", "MMrrooww88");
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("Exception: " + e);
        }
        catch(SQLException ex)
        {
            System.out.println("Exception: " + ex);
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
                       + "FROM users "
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
        
        
        JMD5Hash hash = new JMD5Hash();
        
        SQLstatement = "SELECT COUNT(*) as cnt, userID "
                + "FROM Users WHERE upper(username) = upper('" + username + "') "
                + "AND passwordhash = '" + hash.md5(passwordhash + salt)
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
        sql = "SELECT * FROM Users WHERE userID = " + pUserID.toString(); 
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
}
