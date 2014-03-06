package com.Model;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Chelsea
 */
public class JDBFunctions {
    
    private Connection connect = null;
    private Statement statement = null;
    public HttpSession session = null;
   
    private ResultSet resultSet = null;
    public int LoggedInID;
    public int userID;
    public String email;
    public String password;
    public String firstname;
    public String lastname;
    
    public void execute(String SQL) throws SQLException
    {
        try
        {
            // This will load the PostgreSQL driver, each DB has its own driver
            Class.forName("org.postgresql.Driver");
            // Setup the connection with the DB
            connect = DriverManager.getConnection("jdbc:postgresql://localhost:5432/YouVote", "postgres", "chelocean");
            statement = connect.createStatement();
            statement.executeUpdate(SQL);
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("Exception: " + e);
        }
    }
    
    public ResultSet select(String SQL) throws SQLException
    {
        ResultSet rs = null;
        try
        {
            Class.forName("org.postgresql.Driver");
            connect = DriverManager.getConnection("jdbc:postgresql://localhost:5432/YouVote", "postgres", "chelocean");
            statement = connect.createStatement();
            rs = statement.executeQuery(SQL);
        }
        catch(ClassNotFoundException e)
        {
            System.out.println("Exception: " + e);
        }
        return rs;
    }
    
    public boolean login(String email, String password) throws Exception
    {
        String SQLstatement;
        boolean result = false;
        
        SQLstatement = "SELECT COUNT(*) as cnt, userID FROM Users WHERE upper(email) = upper('" + email + "') AND password = '" + password + "' GROUP BY userID"; 
        
        resultSet = select(SQLstatement);
        
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
            System.out.println(e);
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
                email = resultSet.getString("email");
                password = resultSet.getString("password");
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
