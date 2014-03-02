<!DOCTYPE html>
<html lang="en">
    <head>
        <title>YouVote</title>
	<meta charset="UTF-8" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
	<link rel="stylesheet" type="text/css" href="css/gridNavigation.css" />
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
				<h2>Featured</h2>
			</div>
			<div class="content example7">
				<div id="tj_container" class="tj_container">
					<div class="tj_nav">
						<span id="tj_prev" class="tj_prev">Previous</span>
						<span id="tj_next" class="tj_next">Next</span>
					</div>
					<div class="tj_wrapper">
						<ul class="tj_gallery">
							<li><a href="#"><img src="images/1.jpg" alt="image01" /></a></li>
							<li><a href="#"><img src="images/2.jpg" alt="image02" /></a></li>
							<li><a href="#"><img src="images/3.jpg" alt="image03" /></a></li>
							<li><a href="#"><img src="images/4.jpg" alt="image04" /></a></li>
							<li><a href="#"><img src="images/5.jpg" alt="image05" /></a></li>
							<li><a href="#"><img src="images/6.jpg" alt="image06" /></a></li>
							<li><a href="#"><img src="images/7.jpg" alt="image07" /></a></li>
							<li><a href="#"><img src="images/8.jpg" alt="image08" /></a></li>
							<li><a href="#"><img src="images/9.jpg" alt="image09" /></a></li>
							<li><a href="#"><img src="images/10.jpg" alt="image10" /></a></li>
							<li><a href="#"><img src="images/11.jpg" alt="image11" /></a></li>
							<li><a href="#"><img src="images/12.jpg" alt="image12" /></a></li>
							<li><a href="#"><img src="images/13.jpg" alt="image13" /></a></li>
							<li><a href="#"><img src="images/14.jpg" alt="image14" /></a></li>
							<li><a href="#"><img src="images/15.jpg" alt="image15" /></a></li>
							<li><a href="#"><img src="images/16.jpg" alt="image16" /></a></li>
							<li><a href="#"><img src="images/17.jpg" alt="image17" /></a></li>
							<li><a href="#"><img src="images/18.jpg" alt="image18" /></a></li>
							<li><a href="#"><img src="images/19.jpg" alt="image19" /></a></li>
							<li><a href="#"><img src="images/20.jpg" alt="image20" /></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="more">
				<ul>
					<li>Featured Categories:</li>
                                        <li class="selected"><a href="index.jsp">Winners</a></li>
					<li><a href="aerial.jsp">Aerial</a></li>
					<li><a href="action.jsp">Action</a></li>
					<li><a href="bw.jsp">Black and White</a></li>
					<li><a href="candid.jsp">Candid</a></li>
					<li><a href="fashion.jsp">Fashion</a></li>
					<li><a href="food.jsp">Food</a></li>
					<li><a href="landscape.jsp">Landscape</a></li>
					<li><a href="nature.jsp">Nature</a></li>
					<li><a href="night.jsp">Night</a></li>
					<li><a href="slife.jsp">Still Life</a></li>
                                        <li><a href="travel.jsp">Travel</a></li>
                                        <li><a href="underwater.jsp">Underwater</a></li>
				</ul>
			</div>
			<div class="footer">
				<a href="index.jsp"><span>Home</span></a>
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
					<a href="Login">Login</a>
                                        <a href="createaccount.jsp">Create Account</a>
                                        <a href="about.jsp">About</a>
				</span>
			</div>
		</div>
		
    </body>
</html>