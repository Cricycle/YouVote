<%-- 
    Document   : singlephoto
    Created on : Apr 21, 2014, 8:58:03 AM
    Author     : Alex
--%>

<%@page import="java.util.HashSet"%>
<%@page import="java.sql.PreparedStatement"%>
<!DOCTYPE html>
<html lang="en">
    <%@include file="header.jsp"%>
    <head>
        <title>YouVote</title>
	<meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link rel="stylesheet" type="text/css" href="css/style3.css" />
        <link rel="stylesheet" type="text/css" href="button/votebutton.css" />
	<link href='http://fonts.googleapis.com/css?family=PT+Sans+Narrow' rel='stylesheet' type='text/css' />
	<link href='http://fonts.googleapis.com/css?family=Oswald' rel='stylesheet' type='text/css' />
        <link rel="shortcut icon" href="images/tu.ico">
		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    </head>
    <body>
		<div class="container">
			<div class="header">
				<h1>YouVote<span>for your favorite photo</span></h1>
			</div>

			<div class="photos">
                            <h2>Photos</h2>
                            <div id="tj_container" class="tj_container">
                            <div class="tj_wrapperP">
                                            
                                <section>
                                <ul class="lb-album">
                                    <%
                                        String strphotoID = request.getParameter("photoID");
                                        int photoID = 0;
                                        try {
                                            photoID = Integer.parseInt(request.getParameter("photoID"));
                                        } catch (NumberFormatException e) {
                                            response.sendRedirect("index.jsp");
                                        }
                                        
                                        HashSet<Integer> voteids = new HashSet<Integer>();
                                        PreparedStatement st = null;
                                        ResultSet rs = null;
                                        if (userID != null) {
                                            String getVotes = "SELECT photoID FROM tbl_votes WHERE userID = ? AND photoID = ?;";
                                            st = user.getNewPreparedStatement(getVotes);
                                            st.setInt(1, userID);
                                            st.setInt(2, photoID);
                                            rs = user.select(st);
                                            while (rs.next()) {
                                                voteids.add(rs.getInt("photoID"));
                                            }
                                        }
                                        String selectsql = "SELECT * FROM tbl_photos WHERE photoID = ?;";
                                        st = user.getNewPreparedStatement(selectsql);
                                        st.setInt(1, photoID);
                                        rs = user.select(st);
                                        while (rs.next()) {
                                            String imagePath = rs.getString("imagePath");
                                            String description = rs.getString("description");
                                            String[] parts = imagePath.split("/");
                                            String imageName = parts[parts.length-1].substring(0, parts[parts.length-1].lastIndexOf('.'));
                                            String photoUserID = rs.getString("userID");
                                            
                                            String commentsql = "SELECT * FROM tbl_comments WHERE photoID = ?;";
                                            PreparedStatement st2 = user.getNewPreparedStatement(commentsql);
                                            st2.setInt(1, photoID);
                                            ResultSet rs2 = user.select(st2);
                                            
                                            out.println("<li>");
                                            out.println("\t<a href=\"#image-" + photoID + "\">");
                                            out.println("\t\t<img src=\"" + imagePath + "\" alt=\"image" + photoID + "\" height=150px width=150px>");
                                            out.println("\t\t<span>" + imageName + "</span>");
                                            out.println("\t</a>");
                                            out.println("\t<div class=\"lb-overlay\" id=\"image-" + photoID + "\">");
                                            out.println("\t\t<img src=\"" + imagePath + "\" alt=\"image" + photoID + "\"/>");
                                            out.println("\t\t<div style=\"float:right; position:relative\">");
                                            out.println("\t\t\t<form action=\"Vote\" method=\"post\">");
                                            // inputs for Voting
                                            out.println("\t\t\t<input type=\"hidden\" name=\"userid\" value=" + userID + ">");
                                            out.println("\t\t\t<input type=\"hidden\" name=\"photoid\" value=" + photoID + ">");
                                            if (voteids.contains(photoID)) {
                                                out.println("\t\t\t<img src=\"images/green_check.png\" width=50px height=50px>");
                                            }
                                            out.println("\t\t\t\t<button class=\"btn btn-4 btn-4c icon-arrow-right\">&nbsp; Vote &nbsp;</button>");
                                            out.println("\t\t\t</form>");
                                            out.println("\t\t\t<br><br><br>");
                                            out.println("\t\t\t<form action=\"SubmitComment\" method=\"post\">");
                                            // inputs for commenting
                                            out.println("\t\t\t<input type=\"hidden\" name=\"userid\" value=" + userID + ">");
                                            out.println("\t\t\t<input type=\"hidden\" name=\"photoid\" value=" + photoID + ">");
                                            out.println("\t\t\t\t<textarea name=\"commentboxtextarea\" id=\"commentbox" + photoID + "\" input class=\"commentbox\" type=\"text\" name=\"comment\" style=\"display: inline\"></textarea>");
                                            out.println("\t\t\t\t<br>");
                                            out.println("\t\t\t\t<button class=\"btn btn-4 btn-4c icon-arrow-right\">Add Comment</button>");
                                            out.println("\t\t\t</form>");
                                            out.println("\t\t\t<br><br>");
                                            out.println("\t\t\t<form action=\"Report\" method=\"post\">");
                                            // inputs for Reporting
                                            out.println("\t\t\t<input type=\"hidden\" name=\"userid\" value=" + userID + ">");
                                            out.println("\t\t\t<input type=\"hidden\" name=\"photoid\" value=" + photoID + ">");
                                            out.println("\t\t\t\t<button class=\"btn btn-4 btn-4c icon-arrow-right\">Report</button>");
                                            out.println("\t\t\t</form>");
                                            out.println("\t\t</div>");
                                            out.println("\t<div>");
                                            out.println("\t\t<h3>" + imageName + "<span><a href=\"profile.jsp?userid=" + photoUserID + "\">User</a></h3>");
                                            out.println("\t\t<p>" + description + "</p>");
                                            out.println("\t</div>");
                                            out.println("\t<a href=\"#page\" class=\"lb-close\">Close</a>");
                                            out.println("\t</div>");
                                            // existing comments
                                            out.println("\t<div name=\"commentsection\">");
                                            while (rs2.next()) {
                                                String text = rs2.getString("comment");
                                                int commentUser = rs2.getInt("userID");
                                                int commentID = rs2.getInt("commentID");
                                                out.println("\t\t<div name=\"comment" + commentID + "\">");
                                                out.println("\t\t\t<a href=\"profile.jsp?userID=" + commentUser + "\">" + commentUser + "</a>");
                                                out.println("\t\t\t<textarea readonly>" + text + "</textarea>");
                                                out.println("\t\t</div>");
                                            }
                                            out.println("\t</div>");
                                            out.println("</li>");
                                            out.println();
                                        }
                                        
                                    %>
                                </ul>
                        </section>
                                            
					</div>
				</div>
			</div>
		</div>
		
    </body>
</html>