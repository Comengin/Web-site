<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Contact information</title>
	<link rel="stylesheet" type="text/css" href="main.css">
	<link rel="shortcut icon" href="contact.png">
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
		            <li><a href="login.asp">Log in</a></li>
				    <li><a href="signup.asp">Sign Up</a></li>
		            <li><a href="forum.asp">Forum</a></li>
		            <li><a href="people.asp">People</a></li>
		            <li><a href="album.asp">Album</a></li>
					<li><a href="videoalbum.asp">Videos</a></li>
					<li class="current"><a href="continf.asp">Contacts</a></li>
		            <li><a href="map.asp">Map</a></li>
		         </ul>
	        </div>
        </div>
    </div>

    <div class="contentinf">

    	<%if session("login") <> "" then %>
    	<% set conn=Server.CreateObject("ADODB.Connection")
		conn.Open"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("data.mdb")%>
		<table cellpadding="10px">
			<tr>
				<th>ID</th>
				<th>NAME</th>
				<th>SURNAME</th>
				<th>USERNAME</th>
				<th>Birthdate</th>
				<th>E-mail</th>
				<th>GENDER</th>
				<th>Mmarriage status</th>
				<th>JOB POSITION</th>
				<th>Address</th>	
				<th>City</th>
				<th>Education</th>
			</tr>
		
			<%
			set user = Server.CreateObject("ADODB.recordset")
			
			sqluser="select * from users"
			user.Open sqluser, conn
			
			do while not user.eof
				
				response.write "<tr><td>" & user("id") & "</td>"
				response.write "<td>" & user("name") & "</td>"
				response.write "<td>" & user("surname") & "</td>"
				response.write "<td>" & user("username") & "</td>"
				response.write "<td>" & user("birthdate") & "</td>"
				response.write "<td>" & user("email") & "</td>"
				response.write "<td>" & user("gender") & "</td>"
				response.write "<td>" & user("marriagestatus") & "</td>"
				response.write "<td>" & user("job") & "</td>"
				response.write "<td>" & user("address") & "</td>"
				response.write "<td>" & user("city") & "</td>"
				response.write "<td>" & user("education") & "</td></tr>"

				user.movenext

			loop
			response.write "</table>"

			else 
			response.write "<p style='font-size:24px;text-align:center'>To see information about users, you need to log in or, if you do not have an account, register a new account. </p>"
			Response.AddHeader "Refresh", "2;URL=login.asp" 
			end if %>
			</table>
	</div>
	
	<div class="footer">
		<p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
	</div>
</body>
</html>