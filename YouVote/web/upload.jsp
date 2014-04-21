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
        <link href="css/uploadmain.css" rel="stylesheet" type="text/css" />
        <script src="js/uploadscript.js"></script>

		<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js"></script>
    </head>
    
    <body>
        <%
            // connected to header.jsp
            if (userID == null || userID == 0) {
                out.println("<meta http-equiv=\"Refresh\" content=\"0; url=account.jsp\" />");
            }
        %>
        <!--> upload code from http://www.script-tutorials.com/pure-html5-file-upload/ <!-->
        <div class="container">	
            <div class="header">
                    <h1>YouVote<span>for your favorite photo</span></h1>
                    <h2>Upload</h2>
            </div>
            <div class="contr"><h2>You can select the file (image) and click Upload button</h2></div>

            <div class="upload_form_cont">
                <form id="upload_form" enctype="multipart/form-data" method="post" action="SavePhoto">
                    <div>
                        <div><label for="image_file">Please select image file</label></div>
                        <div><input type="file" name="image_file" id="image_file" onchange="fileSelected();" /></div>
                        <div><label for="description">Image description</label></div>
                        <div><textarea name="description" id="description" rows="2" cols="50"></textarea></div>
                        <%
                            out.println("<input type=\"hidden\" name=\"userid\" value=\"" + user.getLoginID() + "\">");
                        %>
                    </div>
                    <div>
                        <input type="button" value="Upload" onclick="startUploading()" />
                    </div>
                    <div id="fileinfo">
                        <div id="filename"></div>
                        <div id="filesize"></div>
                        <div id="filetype"></div>
                        <div id="filedim"></div>
                    </div>
                    <div id="error">You should select valid image files only!</div>
                    <div id="error2">An error occurred while uploading the file.</div>
                    <div id="abort">The upload has been canceled by the user or the browser dropped the connection</div>
                    <div id="warnsize">Your file is very big. We can't accept it. Please select a smaller file.</div>

                    <div id="progress_info">
                        <div id="progress"></div>
                        <div id="progress_percent">&nbsp;</div>
                        <div class="clear_both"></div>
                        <div>
                            <div id="speed">&nbsp;</div>
                            <div id="remaining">&nbsp;</div>
                            <div id="b_transfered">&nbsp;</div>
                            <div class="clear_both"></div>
                        </div>
                        <div id="upload_response">
                            <% System.out.println(request.getAttributeNames()); %>
                        </div>
                    </div>
                </form>

                <img id="preview" />
            </div>
        </div>
    </body>
</html>