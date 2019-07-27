
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Deleting Data</title>
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
		set conn = Server.CreateObject("ADODB.Connection")
		conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("comments.mdb")

		Set ser = Server.CreateObject("ADODB.Recordset")
		sql="select * from tables where id=" & request.querystring("del")
		ser.Open sql, conn
		Set delete=Server.CreateObject("Adodb.Recordset")
		w_delete="delete * from tables where id=" & request.querystring("del")
		delete.Open w_delete, conn, 1, 3
				
		Response.Write("<h2 align='center'>Comment successfully deleted...</h2><br>")
		Response.AddHeader "Refresh", "2;URL=index.asp"
	%>
    </center>
	<div class="footer">
		<p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
	</div>
</body>
</html>