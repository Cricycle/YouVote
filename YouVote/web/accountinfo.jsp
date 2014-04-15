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
		<div class="container">
			<div class="header">
				<h1>YouVote<span>for your favorite photo</span></h1>
				<h2>Edit Account Information</h2>
			</div>
			<div class="content">     
				<div id="tj_edit" class="tj_edit">
                                    <h1>User Information</h1>
                                        <form action="SavePerson" method="post">
                                        <input class="textbox" value="<%out.print(userID.toString());%>" name="userID" type="hidden">
                                        <table border="0" cellpadding="10">
                                            <tr class="trfield"><td class="tdfield"><h2>Email Address</h2></td><td><input class="textbox" type="text" name="email" <%out.println("value=\""+user.email+"\"");%>></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Password</h2></td><td><input class="textbox" type="password" name="passwordhash" <%out.println("value=\"\"");%>></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>First Name</h2></td><td><input class="textbox" type="text" name="firstname" <%out.println("value=\""+user.firstname+"\"");%>></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Last Name</h2></td><td><input class="textbox" type="text" name="lastname" <%out.println("value=\""+user.lastname+"\"");%>></td></tr>
                                        </table>
                                            <button class="btn btn-4 btn-4c icon-arrow-right">Save</button>
                                      </form>
                                        <form action="DeletePerson" method=post">
                                            <button class="btn btn-4 btn-4c icon-arrow-right">Delete Account</button>
                                        </form>
                                              
				</div>
			</div>
		</div>
		
    </body>
</html>