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
				<h2>Upload</h2>
			</div>
			<div class="content">
                            
                               	<div id="tj_upload" class="tj_upload">
                                    <h1>Upload Photos</h1>
                                        <form action="SavePhoto" method="post">
                                        <input class="textbox" value="" name="userID" type="hidden">
                                        <table border="0" cellpadding="10">
                                            <tr class="trfield"><td class="tdfield"><h2>Description</h2></td><td><input class="textbox" type="text" name="description"></td></tr>
                                            <tr class="trfield"><td class="tdfield"><h2>Image Path</h2></td><td><input class="textbox" type="text" name="imagepath"></td></tr>
                                        </table>
                                            <button class="btn btn-4 btn-4c icon-arrow-right">Submit</button>
                                      </form>
				</div>
			</div>
		</div>
		
    </body>
</html>