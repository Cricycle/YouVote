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
                                        <li>
                                                <a href="#image-1">
                                                        <img src="images/thumbs/1.jpg" alt="image01">
                                                        <span>Title</span>
                                                </a>
                                                <div class="lb-overlay" id="image-1">
                                                        <img src="images/full/1.jpg" alt="image01" />
                                                        <div>
                                                                <h3>Title <span>/user/</h3>
                                                                <p>Long description</p>
                                                                <i class="pos_fixed">
                                                                    <form action="Vote" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">&nbsp; Vote &nbsp;</button>
                                                                    </form>
                                                                    <br><br><br>
                                                                    <form action="SubmitComment" method="post">
                                                                        <textarea name="commentboxtextarea" id="commentbox" input class="commentbox" type="text" name="comment" style="display: inline"></textarea>
                                                                        <br>
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Add Comment</button>
                                                                    </form>
                                                                    <br><br>
                                                                    <form action="Report" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Report</button>
                                                                    </form>
                                                                </i>
                                                        </div>
                                                        <a href="#page" class="lb-close">Close</a>
                                                </div>
                                        </li>
                                        <li>
                                                <a href="#image-2">
                                                        <img src="images/thumbs/2.jpg" alt="image02">
                                                        <span>Title</span>
                                                </a>
                                                <div class="lb-overlay" id="image-2">
                                                        <img src="images/full/2.jpg" alt="image02" />
                                                        <div>							
                                                                <h3>Title <span>/user/</h3>
                                                                <p>Long description</p>
                                                                <i class="pos_fixed">
                                                                    <form action="Vote" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">&nbsp; Vote &nbsp;</button>
                                                                    </form>
                                                                    <br><br><br>
                                                                    <form action="SubmitComment" method="post">
                                                                        <textarea name="commentboxtextarea" id="commentbox" input class="commentbox" type="text" name="comment" style="display: inline"></textarea>
                                                                        <br>
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Add Comment</button>
                                                                    </form>
                                                                    <br><br>
                                                                    <form action="Report" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Report</button>
                                                                    </form>
                                                                </i>
                                                        </div>
                                                        <a href="#page" class="lb-close">Close</a>
                                                </div>
                                        </li>
                                        <li>
                                                <a href="#image-3">
                                                        <img src="images/thumbs/3.jpg" alt="image03">
                                                        <span>Title</span>
                                                </a>
                                                <div class="lb-overlay" id="image-3">
                                                        <img src="images/full/3.jpg" alt="image03" />
                                                        <div>							
                                                                <h3>Title <span>/user/</h3>
                                                                <p>Long description</p>
                                                                <i class="pos_fixed">
                                                                    <form action="Vote" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">&nbsp; Vote &nbsp;</button>
                                                                    </form>
                                                                    <br><br><br>
                                                                    <form action="SubmitComment" method="post">
                                                                        <textarea name="commentboxtextarea" id="commentbox" input class="commentbox" type="text" name="comment" style="display: inline"></textarea>
                                                                        <br>
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Add Comment</button>
                                                                    </form>
                                                                    <br><br>
                                                                    <form action="Report" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Report</button>
                                                                    </form>
                                                                </i>
                                                        </div>
                                                        <a href="#page" class="lb-close">Close</a>
                                                </div>
                                        </li>
                                        <li>
                                                <a href="#image-4">
                                                        <img src="images/thumbs/4.jpg" alt="image04">
                                                        <span>Title</span>
                                                </a>
                                                <div class="lb-overlay" id="image-4">
                                                        <img src="images/full/4.jpg" alt="image04" />
                                                        <div>							
                                                                <h3>Title <span>/user/</h3>
                                                                <p>Long description</p>
                                                                <i class="pos_fixed">
                                                                    <form action="Vote" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">&nbsp; Vote &nbsp;</button>
                                                                    </form>
                                                                    <br><br><br>
                                                                    <form action="SubmitComment" method="post">
                                                                        <textarea name="commentboxtextarea" id="commentbox" input class="commentbox" type="text" name="comment" style="display: inline"></textarea>
                                                                        <br>
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Add Comment</button>
                                                                    </form>
                                                                    <br><br>
                                                                    <form action="Report" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Report</button>
                                                                    </form>
                                                                </i>
                                                        </div>
                                                        <a href="#page" class="lb-close">Close</a>
                                                </div>
                                        </li>
                                        <li>
                                                <a href="#image-5">
                                                        <img src="images/thumbs/5.jpg" alt="image05">
                                                        <span>Title</span>
                                                </a>
                                                <div class="lb-overlay" id="image-5">
                                                        <img src="images/full/5.jpg" alt="image05" />
                                                        <div>							
                                                                <h3>Title <span>/user/</h3>
                                                                <p>Long description</p>
                                                                <i class="pos_fixed">
                                                                    <form action="Vote" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">&nbsp; Vote &nbsp;</button>
                                                                    </form>
                                                                    <br><br><br>
                                                                    <form action="SubmitComment" method="post">
                                                                        <textarea name="commentboxtextarea" id="commentbox" input class="commentbox" type="text" name="comment" style="display: inline"></textarea>
                                                                        <br>
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Add Comment</button>
                                                                    </form>
                                                                    <br><br>
                                                                    <form action="Report" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Report</button>
                                                                    </form>
                                                                </i>
                                                        </div>
                                                        <a href="#page" class="lb-close">Close</a>
                                                </div>
                                        </li>
                                        <li>
                                                <a href="#image-6">
                                                        <img src="images/thumbs/6.jpg" alt="image06">
                                                        <span>Title</span>
                                                </a>
                                                <div class="lb-overlay" id="image-6">
                                                        <img src="images/full/6.jpg" alt="image06" />
                                                        <div>							
                                                                <h3>Title <span>/user/</h3>
                                                                <p>Long description</p>
                                                                <i class="pos_fixed">
                                                                    <form action="Vote" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">&nbsp; Vote &nbsp;</button>
                                                                    </form>
                                                                    <br><br><br>
                                                                    <form action="SubmitComment" method="post">
                                                                        <textarea name="commentboxtextarea" id="commentbox" input class="commentbox" type="text" name="comment" style="display: inline"></textarea>
                                                                        <br>
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Add Comment</button>
                                                                    </form>
                                                                    <br><br>
                                                                    <form action="Report" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Report</button>
                                                                    </form>
                                                                </i>
                                                        </div>
                                                        <a href="#page" class="lb-close">Close</a>
                                                </div>
                                        </li>
                                        <li>
                                                <a href="#image-7">
                                                        <img src="images/thumbs/7.jpg" alt="image07">
                                                        <span>Title</span>
                                                </a>
                                                <div class="lb-overlay" id="image-7">
                                                        <img src="images/full/7.jpg" alt="image07" />
                                                        <div>							
                                                                <h3>Title <span>/user/</h3>
                                                                <p>Long description</p>
                                                                <i class="pos_fixed">
                                                                    <form action="Vote" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">&nbsp; Vote &nbsp;</button>
                                                                    </form>
                                                                    <br><br><br>
                                                                    <form action="SubmitComment" method="post">
                                                                        <textarea name="commentboxtextarea" id="commentbox" input class="commentbox" type="text" name="comment" style="display: inline"></textarea>
                                                                        <br>
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Add Comment</button>
                                                                    </form>
                                                                    <br><br>
                                                                    <form action="Report" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Report</button>
                                                                    </form>
                                                                </i>
                                                        </div>
                                                        <a href="#page" class="lb-close">Close</a>
                                                </div>
                                        </li>
                                        <li>
                                                <a href="#image-8">
                                                        <img src="images/thumbs/8.jpg" alt="image08">
                                                        <span>Title</span>
                                                </a>
                                                <div class="lb-overlay" id="image-8">
                                                        <img src="images/full/8.jpg" alt="image08" />
                                                        <div>							
                                                                <h3>Title <span>/user/</h3>
                                                                <p>Long description</p>
                                                                <i class="pos_fixed">
                                                                    <form action="Vote" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">&nbsp; Vote &nbsp;</button>
                                                                    </form>
                                                                    <br><br><br>
                                                                    <form action="SubmitComment" method="post">
                                                                        <textarea name="commentboxtextarea" id="commentbox" input class="commentbox" type="text" name="comment" style="display: inline"></textarea>
                                                                        <br>
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Add Comment</button>
                                                                    </form>
                                                                    <br><br>
                                                                    <form action="Report" method="post">
                                                                        <button class="btn btn-4 btn-4c icon-arrow-right">Report</button>
                                                                    </form>
                                                                </i>
                                                        </div>
                                                        <a href="#page" class="lb-close">Close</a>
                                                </div>
                                        </li>
                                </ul>
                        </section>
                                            
					</div>
				</div>
			</div>
		</div>
		
    </body>
</html>