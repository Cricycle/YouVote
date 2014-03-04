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
                                <a href="aerial.jsp">Aerial</a>
                                <a href="action.jsp">Action</a>
                                <a href="bw.jsp">Black and White</a>
                                <a href="candid.jsp">Candid</a>
                                <a href="fashion.jsp">Fashion</a>
                                <a href="food.jsp">Food</a>
                                <a href="landscape.jsp">Landscape</a>
                                <a href="nature.jsp">Nature</a>
                                <a href="night.jsp">Night</a>
                                <a href="slife.jsp">Still Life</a>
                                <a href="travel.jsp">Travel</a>
                                <a href="underwater.jsp">Underwater</a>
				<span class="right_ab">
                                    <%
                                        JDBFunctions user = new JDBFunctions();
                                        String html = "";
                                        user.session = request.getSession(true);
                                        //out.println(user.getLoginID());
                                        if(user.getLoginID() == null || user.getLoginID() == 0)
                                        {
                                            html = "<a href=\"account.jsp\">Login / Create Account</a>";
                                            out.println(html);
                                        }
                                        else
                                        {
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