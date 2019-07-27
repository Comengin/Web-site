<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Log out</title>
	<link rel="stylesheet" type="text/css" href="main.css">
</head>
<body>
	<div class="header">
        <div class="container">
		    <div id="branding">
		        <h1>Industry Overview</h1>
        	</div>
	        <div class="navigation">
	        	<ul>
		            <li class="current"><a href="index.asp">Home</a></li>
		            <li><a href="login.asp">Log in</a></li>
				    <li><a href="signup.asp">Sign Up</a></li>
		            <li><a href="forum.asp">Forum</a></li>
		            <li><a href="people.asp">People</a></li>
		            <li><a href="album.asp">Album</a></li>
					<li><a href="videoalbum.asp">Videos</a></li>
					<li><a href="continf.asp">Contacts</a></li>
		            <li><a href="map.asp">Map</a></li>
		         </ul>
	        </div>
        </div>
    </div>
    <center>	
	<%
		session.abandon
		Response.Write "<h3 align='center'>Account is closing <br> You are redirecting to home page</h3>"
		Response.AddHeader "Refresh", "2;URL=index.asp" 
	%>
    </center>
	<div class="footer">
		<p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
	</div>
</body>
</html>