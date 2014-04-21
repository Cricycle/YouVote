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
                                        String getVotes = "SELECT photoID FROM tbl_votes WHERE userID = ?;";
                                        PreparedStatement st = user.getNewPreparedStatement(getVotes);
                                        st.setInt(1, userID);
                                        ResultSet rs = user.select(st);
                                        HashSet<Integer> voteids = new HashSet<Integer>();
                                        while (rs.next()) {
                                            voteids.add(rs.getInt("photoID"));
                                        }
                                        String selectsql = "SELECT * FROM tbl_photos WHERE categoryID = 4;";
                                        st = user.getNewPreparedStatement(selectsql);
                                        rs = user.select(st);
                                        while (rs.next()) {
                                            int photoID = rs.getInt("photoID");
                                            String imagePath = rs.getString("imagePath");
                                            String description = rs.getString("description");
                                            String[] parts = imagePath.split("/");
                                            String imageName = parts[parts.length-1].substring(0, parts[parts.length-1].lastIndexOf('.'));
                                            /*
                                            	photoID 		SERIAL,
	imagePath 		VARCHAR(250) NOT NULL,	-- filepath of image on the server
	userID 			INT,					-- user who uploaded the photo
	categoryID 		INT,					-- what category the photo belongs to
	description 	VARCHAR(500),			-- optional description by user about photo
	imageSize 		INT NOT NULL,			-- how many bytes the photo takes up on disk
	uploadDate 		TIMESTAMP NOT NULL,		-- when the photo was uploaded
                                                    */
                                            //out.printf("photoID=%d, imagePath=%s, description=%s, imageName=%s\n", photoID, imagePath, description, imageName);
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
                                            out.println("\t\t<h3>" + imageName + "<span>/user/</h3>");
                                            out.println("\t\t<p>" + description + "</p>");
                                            out.println("\t</div>");
                                            out.println("\t<a href=\"#page\" class=\"lb-close\">Close</a>");
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