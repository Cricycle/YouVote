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
}
