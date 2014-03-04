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
		<script type="text/javascript" src="js/jquery.easing.1.3.js"></script>
		<script type="text/javascript" src="js/jquery.mousewheel.js"></script>
		<script type="text/javascript" src="js/jquery.gridnav.js"></script>
		<script type="text/javascript">
			$(function() {
				$('#tj_container').gridnav({
					type	: {
						mode		: 'showhide', 	// use def | fade | seqfade | updown | sequpdown | showhide | disperse | rows
						speed		: 500,			// for fade, seqfade, updown, sequpdown, showhide, disperse, rows
						easing		: '',			// for fade, seqfade, updown, sequpdown, showhide, disperse, rows	
						factor		: '',			// for seqfade, sequpdown, rows
						reverse		: ''			// for sequpdown
					}
				});
			});
		</script>
    </head>
    <body>
		<div class="container">
			<div class="header">
				<h1>YouVote<span>for your favorite photo</span></h1>
				<h2>Login or Create Account</h2>
			</div>
			<div class="content example7">
                            
                               	<div id="tj_login" class="tj_login">
                                    <h1>Login</h1>
                                        <form action="Login" method="post">
                                        <input class="textbox" value="" name="userID" type="hidden">
                                        <table border="0" cellpadding="10">
                                            <tr class="trfield"><td class="tdfield"><h2>Email Address</h2></td><td><input class="textbox" type="text" name="email"></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Password</h2></td><td><input class="textbox" type="password" name="password"></td></tr>
                                        </table>
                                            <button class="btn btn-4 btn-4c icon-arrow-right">Login</button>
                                      </form>
				</div>
                            
				<div id="tj_createAccount" class="tj_createAccount">
                                    <h1>Create Account</h1>
                                        <form action="SavePerson" method="post">
                                        <input class="textbox" value="" name="userID" type="hidden">
                                        <table border="0" cellpadding="10">
                                            <tr class="trfield"><td class="tdfield"><h2>Email Address</h2></td><td><input class="textbox" type="text" name="email"></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Password</h2></td><td><input class="textbox" type="password" name="password"></td></tr>
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