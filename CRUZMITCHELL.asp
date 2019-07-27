<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>CRUZ MITCHELL</title>
	<link rel="stylesheet" type="text/css" href="main.css">
	<link rel="shortcut icon" href="personmale.png">
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
		            <li class="current"><a href="people.asp">People</a></li>
		            <li><a href="album.asp">Album</a></li>
					<li><a href="videoalbum.asp">Videos</a></li>
					<li><a href="continf.asp">Contacts</a></li>
		            <li><a href="map.asp">Map</a></li>
		         </ul>
	        </div>
        </div>
    </div>
    <div class="comeback">
    	<a href="people.asp"><img src="comeback.png"></a>
    </div>
    <center>
	    <div id="person">
	    	<% if session("login") <> "" then %>
	    	<div class="image"><img src="person3.jpg" width="384" height="254">
	    		<div class="tables">
	    			<%set conn=Server.CreateObject("ADODB.Connection")
					conn.Open"Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("comments.mdb")%>
	    		<form action="savecomments.asp" method="POST">
	    		<textarea placeholder="Write your comment here..." name="massage"/></textarea><br>
	    		<input type="hidden" name="control" value="people1">
				<input type="submit" value="Send" class="sendcomment">
					<table cellpadding="8px" >
						<tr>
							<th>ID</th>
							<th>NAME</th>
							<th>COMMENT</th>
							<th>DATE</th>
							<th>DEL</th>
							<th>UPD</th>
						</tr>
					
			
			<%

				set data = Server.CreateObject("ADODB.recordset")
				
				sql="select * from tables where type='people'"
				data.Open sql, conn
				if session("login") = "admin" then
					do while not data.eof
						
						response.write "<tr><td>" & data("id") & "</td>"
						response.write "<td>" & data("nameofcommenter") & "</td>"
						response.write "<td>" & data("comment") & "</td>"
						response.write "<td>" & data("dataofcomment") & "</td>"
						response.write "<td><a href='delete.asp?del=" & data("id") & "'>Delete</a></td>"			
						response.write "<td><a href='update.asp?upd=" & data("id") & "'>Update</a></td></tr>"
						data.movenext

					loop
					response.write "</table>"
				else do while not data.eof
						
						response.write "<tr><td>" & data("id") & "</td>"
						response.write "<td>" & data("nameofcommenter") & "</td>"
						response.write "<td>" & data("comment") & "</td>"
						response.write "<td>" & data("dataofcomment") & "</td>"
						
						if session("login") = data("nameofcommenter") then
						
						response.write "<td><a href='delete.asp?del=" & data("id") & "'>Delete</a></td>"			
						response.write "<td><a href='update.asp?upd=" & data("id") & "'>Update</a></td></tr>"	
						
						else
							response.write "<td></td><td></td>"
						end if
						
						data.movenext

					loop
					response.write "</table>"
			    end if
		     else
				response.write "<p style='font-size:24px;text-align:center'>To write a comment you need to log in or if you don't have an account register a new account. </p>"
				Response.AddHeader "Refresh", "2;URL=login.asp" 
			end if
		%>
		</table>
				</form>
		</div>
		</div>
    </center>
    <div class="footer">
		<p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
	</div>
</body>
</html>