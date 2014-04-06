<!DOCTYPE html>
<html lang="en">
    <%@include file="header.jsp"%>
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
			</div>
			<div class="featured">
                                <h2>Featured</h2>
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
					<li><a href="photos.jsp">Aerial</a></li>
					<li><a href="photos.jsp">Action</a></li>
					<li><a href="photos.jsp">Black and White</a></li>
					<li><a href="photos.jsp">Candid</a></li>
					<li><a href="photos.jsp">Fashion</a></li>
					<li><a href="photos.jsp">Food</a></li>
					<li><a href="photos.jsp">Landscape</a></li>
					<li><a href="photos.jsp">Nature</a></li>
					<li><a href="photos.jsp">Night</a></li>
					<li><a href="photos.jsp">Still Life</a></li>
                                        <li><a href="photos.jsp">Travel</a></li>
                                        <li><a href="photos.jsp">Underwater</a></li>
				</ul>
			</div>
			<div class="recentuploads">
                                <h2>Recent Uploads</h2>
				<div id="tj_container" class="tj_container">
					<div class="tj_wrapper">
						<ul class="tj_gallery">
							<li><a href="#"><img src="images/9.jpg" alt="image09" /></a></li>
							<li><a href="#"><img src="images/10.jpg" alt="image10" /></a></li>
							<li><a href="#"><img src="images/11.jpg" alt="image11" /></a></li>
							<li><a href="#"><img src="images/12.jpg" alt="image12" /></a></li>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
    </body>
</html>