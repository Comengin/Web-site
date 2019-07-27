<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Resetting password</title>
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
    	<div class="loginbox">
    		<h1>Resetting password</h1>
    		<%set conn=Server.CreateObject("ADODB.Connection")
			conn.Open"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("data.mdb")
			


			%>
    		<form method="POST" action="">
    			<p>Name</p>
    			<input type="text" name="name" placeholder="Enter Name">
    			<p>Surname</p>
    			<input type="text" name="surname" placeholder="Enter Surname">
    			<p>Username</p>
    			<input type="text" name="username" placeholder="Enter Username">
    			<input type="hidden" name="uyekontrol" value="uyegirisi">
    			<input type="submit" name="resetpas" value="Submit">

    			<%
					set data = Server.CreateObject("ADODB.recordset")
					
					sql="select * from tables where type='people'"
					data.Open sql, conn
    		</form>
    	</div>
   	</div>
    <div class="footer">
		<p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
	</div>
</body>
</html>

   	<% if request.servervariables("REQUEST_METHOD")="POST" then 
			set conn=Server.CreateObject("ADODB.Connection")
			conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("data.mdb")
			
			set newd = Server.CreateObject("ADODB.recordset")
			sql="update tables set password='" & request.form("password") & "',password2='" & request.form("password2") & "' where username=" & request.form("username")
			newd.open sql, conn,1,3
			response.write "<p style='font-size:24px;text-align:center'>Waiting for updating. </p>"
			Response.AddHeader "Refresh", "0.5;URL=login.asp" 
			
		end if
		
	%>