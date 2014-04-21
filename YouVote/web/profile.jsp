<%-- 
    Document   : profile
    Created on : Apr 21, 2014, 6:18:31 AM
    Author     : Alex
--%>

<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="header.jsp"%>
    <head>
        <title>YouVote</title>
	<meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/gridNavigation.css" />
        <link rel="stylesheet" type="text/css" href="button/button.css" />
	<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
        <link rel="shortcut icon" href="images/tu.ico">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    </head>
    <body>
        <%
            Integer pageUserId = null;
            if (request.getParameter("userid") != null) {
                try {
                    pageUserId = Integer.parseInt("" + request.getParameter("userid"));
                } catch (NumberFormatException e) {
                    
                }
            }
            if (pageUserId == null) {
                response.sendRedirect("index.jsp");
            }
            
            if (userID.equals(pageUserId)) {
                response.sendRedirect("accountinfo.jsp");
            }
            
            String getUser = "SELECT email, firstname, lastname, username FROM tbl_users WHERE userID = ?;";
            PreparedStatement st = user.getNewPreparedStatement(getUser);
            st.setInt(1, pageUserId);
            ResultSet rs = user.select(st);
            String pageEmail = null;
            String pageFirstName = null;
            String pageLastName = null;
            String pageUsername = null;
            if (rs.next()) {
                pageEmail = rs.getString("email");
                pageFirstName = rs.getString("firstname");
                pageLastName = rs.getString("lastname");
                pageUsername = rs.getString("username");
            } else {
                response.sendRedirect("index.jsp");
            }
            
            boolean isFavorite = false;
            String getFavorite = "SELECT * FROM tbl_favorite_users WHERE useridowner=? AND useridfavorite=?;";
            st = user.getNewPreparedStatement(getFavorite);
            st.setInt(1, userID);
            st.setInt(2, pageUserId);
            rs = user.select(st);
            if (rs.next()) {
                isFavorite = true;
            }
        %>
		<div class="container">
			<div class="header">
				<h1>YouVote<span>for your favorite photo</span></h1>
				<h2>Edit Account Information</h2>
			</div>
			<div class="content">     
				<div id="tj_edit" class="tj_edit">
                                    <h1>User Information</h1>
                                        <form action="FavoritePerson" method="post">
                                            <input class="textbox" value="<%out.print(pageUserId);%>" name="pageUserID" type="hidden">
                                            <input class="textbox" value="<%out.print(userID);%>" name="userID" type="hidden">
                                        <table border="0" cellpadding="10">
                                            <tr class="trfield"><td class="tdfield"><h2>Email Address</h2></td><td><input class="textbox" type="text" name="email" <%out.println("value=\""+pageEmail+"\"");%> readonly></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>First Name</h2></td><td><input class="textbox" type="text" name="firstname" <%out.println("value=\""+pageFirstName+"\"");%> readonly></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Last Name</h2></td><td><input class="textbox" type="text" name="lastname" <%out.println("value=\""+pageLastName+"\"");%> readonly></td></tr>
                                        </table>
                                        <button class="btn btn-4 btn-4c icon-arrow-right">
                                            <%
                                                if (isFavorite) {
                                                    out.print("Remove from Favorites");
                                                } else {
                                                    out.print("Add to Favorites");
                                                }
                                            %>
                                        </button>
                                      </form>
                                              
				</div>
			</div>
		</div>
		
    </body>
</html>