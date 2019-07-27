<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Updating Data</title>
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
	<div id="contenofforum">
		<div class="tables">
			
			<%

			if request.servervariables("REQUEST_METHOD")="GET" then

			id=request.querystring("upd")

			set conn=Server.CreateObject("ADODB.Connection")
			conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("comments.mdb")
			set rs = Server.CreateObject("ADODB.recordset")

			w="select * from tables where id=" & id
			rs.Open w, conn, 1, 3


			%>
			<form method="POST" action="update.asp">
				Name:<br>
				<input style="height: 35px;width: 200px;border: none; color: black;background-color: lightblue;border-radius: 10px;" type="text" name="nameofcommenter" value="<%=rs("nameofcommenter")%>"><br><br>
				<textarea placeholder="Add new comment..."/ name="comment"></textarea><br>
				<input type="submit" value="Update" class="sendcomment" style="cursor: pointer;">
				<input type="hidden" name="hid" value="<%=id%>"><br>
			</form>

			<%end if%>
		</div>
	</div>
	</center>
	

	<% if request.servervariables("REQUEST_METHOD")="POST" then 
			set conn=Server.CreateObject("ADODB.Connection")
			conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("comments.mdb")
			
			set newd = Server.CreateObject("ADODB.recordset")
			sql="update tables set nameofcommenter='" & request.form("nameofcommenter") & "',comment='" & request.form("comment") & "',dataofcomment='" & now() & "' where id=" & request.form("hid")
			newd.open sql, conn,1,3
			response.write "<p style='font-size:24px;text-align:center'>Waiting for updating. </p>"
			Response.AddHeader "Refresh", "0.5;URL=index.asp" 
			
		end if
		
	%> 

	<div class="footer">
		<p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
	</div>
</body>
</html>










