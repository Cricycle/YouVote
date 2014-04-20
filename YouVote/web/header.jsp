<!DOCTYPE html>
<html lang="en">
    <%@page import="com.Model.JDBFunctions"%>
    <%@page import="javax.servlet.http.HttpSession"%>
    <%@page import="java.sql.ResultSet"%>
    <head>
        <title>YouVote</title>
	<meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/gridNavigation.css" />
	<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
        <link rel="shortcut icon" href="images/tu.ico">		
			<div class="footer">
				<a href="index.jsp"><span>Home</span></a>
                                <a href="upload.jsp"><span>Upload</span></a>
                                <a href="photos.jsp">Animals</a>
                                <a href="photos.jsp">Fashion</a>
                                <a href="photos.jsp">Food</a>
                                <a href="photos.jsp">Landscape</a>
                                <a href="photos.jsp">Still Life</a>
                                <a href="photos.jsp">Travel</a>
				<span class="right_ab">
                                    <%
                                        JDBFunctions user = new JDBFunctions();
                                        String html = "";
                                        String htmlUserInfo = "";
                                        user.session = request.getSession(true);
                                        
                                        Integer userID = 0;
                                        userID = (Integer)session.getAttribute("LoggedInID");
                                        //out.println(userID);
                                        
                                        //out.println(user.getLoginID());
                                        if(user.getLoginID() == null || user.getLoginID() == 0)
                                        {
                                            html = "<a href=\"account.jsp\">Login / Create Account</a>";
                                            out.println(html);
                                        }
                                        else
                                        {
                                            user.getUserInfo(userID);
                                            htmlUserInfo = "<a href=\"accountinfo.jsp\">Welcome " + user.firstname + "</a>";
                                            out.println(htmlUserInfo);
                                            out.println("<input type=\"hidden\" name=\"userid\" value=\"" + user.getLoginID() + "\">");
                                            
                                            html = "<form style=\"display: inline\" action=\"Logout\" method=\"post\">"
                                                    + "<a href=\"Logout\">Logout</a>"
                                                    + "</form>";
                                            out.println(html);
                                        }
                                    %>
                                        <a href="about.jsp">About</a>
				</span>
			</div>
		</div>
		
    </body>
</html>