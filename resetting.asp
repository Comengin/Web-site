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

    		<%

			if request.servervariables("REQUEST_METHOD")="GET" then

			id=request.querystring("res")

			set conn=Server.CreateObject("ADODB.Connection")
			conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("data.mdb")
			set rs = Server.CreateObject("ADODB.recordset")
			user="select id from users where usename=" request.form("username")
			rs.open conn

			w="select * from tables where id=" & id
			rs.Open w, conn, 1, 3


			%>
			<h1>Resetting password</h1>
			<form method="POST" action="update.asp">
				<p>Username</p>
    			<input type="text" name="username" placeholder="Enter Username" value="<%=rs("username")%>">
				<p>Surname</p>
    			<input type="text" name="surname" placeholder="Enter Surname">
    			<p>Username</p>
    			<input type="text" name="username" placeholder="Enter Username">
				<input type="submit" value="Submit" style="cursor: pointer;">
				<input type="hidden" name="hid" value="<%=id%>"><br>
			</form>

			<%end if%>
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