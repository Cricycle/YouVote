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
				<h2>Login or Create Account</h2>
			</div>
			<div class="content">
                            
                               	<div id="tj_login" class="tj_login">
                                    <h1>Login</h1>
                                        <form action="Login" method="post">
                                        <input class="textbox" value="" name="userID" type="hidden">
                                        <table border="0" cellpadding="10">
                                            <tr class="trfield"><td class="tdfield"><h2>Username</h2></td><td><input class="textbox" type="text" name="username"></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Password</h2></td><td><input class="textbox" type="password" name="passwordhash"></td></tr>
                                        </table>
                                            <button class="btn btn-4 btn-4c icon-arrow-right">Login</button>
                                      </form>
				</div>
                            
				<div id="tj_createAccount" class="tj_createAccount">
                                    <h1>Create Account</h1>
                                        <form action="SavePerson" method="post">
                                        <input class="textbox" value="0" name="userID" type="hidden">
                                        <table border="0" cellpadding="10">
                                            <tr class="trfield"><td class="tdfield"><h2>Username</h2></td><td><input class="textbox" type="text" name="username"></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Email Address</h2></td><td><input class="textbox" type="text" name="email"></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Password</h2></td><td><input class="textbox" type="password" name="passwordhash"></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>First Name</h2></td><td><input class="textbox" type="text" name="firstname"></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Last Name</h2></td><td><input class="textbox" type="text" name="lastname"></td></tr>
                                        </table>
                                            <button class="btn btn-4 btn-4c icon-arrow-right">Create</button>
                                      </form>
				</div>
			</div>
		</div>
		
    </body>
</html>