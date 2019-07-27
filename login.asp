<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Log In Form</title>
	<link rel="stylesheet" type="text/css" href="main.css">
	<link rel="shortcut icon" href="login.png">
</head>
<body>
	<div class="header">
        <div class="container">
		    <div id="branding">
		        <h1>Industry Overview</h1>
        	</div>
	        <div class="navigation">
	        	<ul>
		            <li><a href="index.asp">Home</a></li>
		            <li class="current"><a href="login.asp">Log in</a></li>
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
   	<div id="loginparent">
   		<% if session("login") <> "" then %>
   			<h3 style="font-size: 24px; text-align: center;">You've already logged in </h3>
			<div style="text-align: center;" class="user"><h2>Welcome</h2><br>
			<a href="logout.asp" style="text-align: center;text-decoration: none;"><p style="font-size: 25px;color: white;">Log out</p></a>
	  	 	</div>
		<%end if%>
		

		<% if session("login") = "" then %>
		
    	<div class="loginbox">
    		
    		<h1>Login Here</h1>
    		<form method="POST" action="login.asp">
    			<p>Username</p>
    			<input type="text" name="Username" placeholder="Enter Username">
    			<p>Password</p>
    			<input type="password" name="Password" placeholder="Enter Password">
    			<input type="hidden" name="uyekontrol" value="uyegirisi">
    			<input type="submit" name="Login" value="Log In">
    			<a href="password.asp">Lost your password?</a><br>
    			<a href="signup.asp">Don't have an account?</a>
    		</form>
    		<div>
			<p>(admin)Username : admin, pas : admin</p>
			<p>(normal)Username : bayram, pas : 456</p>
			<p>(normal)Username : mehmet, pas : 123</p>
			</div>
    	</div>

    	<% end if%>
   	</div>
	<div class="footer">
		<p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
	</div>
 
  </body>
</html>
<%
	if request.servervariables("REQUEST_METHOD")="POST" then
		
		if request.form("uyekontrol")="uyegirisi" then
		
			user=request.form("Username")
			password=request.form("Password")
			set conn=Server.CreateObject("ADODB.Connection")
			conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("data.mdb")
			
			sql="select count(*) as num from users where username='" & user & "' and password='" & password & "'"
			Set control = Server.CreateObject("ADODB.Recordset")
			control.Open sql, conn
			
			if control("num")=1 then
				session("login")=user
				response.redirect "login.asp"
			end if
		end if	
	end if			
%>