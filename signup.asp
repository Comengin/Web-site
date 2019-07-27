<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<title>Sign Up Form</title>
	<link rel="stylesheet" type="text/css" href="main.css">
	<link rel="shortcut icon" href="signup.png">
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
		            <li class="current"><a href="signup.asp">Sign Up</a></li>
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
  	<div id="signupparent">
  	<% if session("login") <> "" then %>
   			<h3 style="font-size: 24px; text-align: center;">You've already registered!</h3>
			<div style="text-align: center;" class="user"><h2>Welcome</h2><br>
			<a href="logout.asp" style="text-align: center;text-decoration: none;"><p style="font-size: 25px;color: white;">Log out</p></a>
	  	 	</div>
		<%end if%>  
  		<% 
		if session("login") = "" then
			
			if request.servervariables("REQUEST_METHOD")="POST" then
				set conn = Server.CreateObject("ADODB.Connection")
				conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("data.mdb")
				
				usercontrol=request.form("username")
				set control=Server.CreateObject("ADODB.RecordSet")
				sql="select count(*) as total from users where username='" & usercontrol & "'"
				
				control.Open sql, conn
				
				if control("total")=1 then
					response.write ("<span style='color:black'> A user with " & usercontrol & " username already exists, use a different username. </span>")
				else
				
					set registration=Server.CreateObject("ADODB.RecordSet")
					sql2="select * from users"
					registration.open sql2, conn,1,3
					
					registration.addnew
					registration("name")=request.form("name")
					registration("surname")=request.form("surname")
					registration("username")=request.form("username")
					registration("birthdate")=request.form("birthdate")
					registration("email")=request.form("email")
					registration("gender")=request.form("gender")
					registration("marriagestatus")=request.form("marriagestatus")
					registration("job")=request.form("job")
					registration("address")=request.form("address")
					registration("city")=request.form("city")
					registration("education")=request.form("education")
					registration("password")=request.form("password")
					registration("password2")=request.form("password2")
					

					registration.update
					registration.close
					response.write "Registration is ok, please wait..."
					response.addheader "Refresh","2;signup.asp"
				end if
				
				conn.close
			end if
			
			%>

	    <div class="signupbox">
	    	<form method="post" action="signup.asp">
	    		<h1>Sign Up</h1>
					<input type="text" name="name" placeholder="Name" required> 
					<input type="text" name="surname" placeholder="Surname" required>
					<input type="text" name="username" placeholder="Username" required>
					<input type="date" name="birthdate" placeholder="Birthdate" required>
					<input type="text" name="email" placeholder="E-mail" required>
					<input type="radio" name="gender" value="male" required>Male 
					<input type="radio" name="gender" value="female" required>Female <br>
					<input type="radio" name="marriagestatus" value="married" required>Married
					<input type="radio" name="marriagestatus" value="single" required>Single
					<input type="text" name="job" placeholder="Job Position" required><br>
					<textarea rows="3" cols="28" name="address" placeholder="Address"></textarea><br>
					<select name="city">
									<option value="0">City</option>
									<option value="1">Istanbul</option>
									<option value="2">Ankara</option>
									<option value="3">London</option>
									<option value="4">Berlin</option>
									<option value="5">New York</option>
									<option value="6">Izmir</option>
									<option value="7">Moscow</option>
									<option value="8">Karabük</option>
									<option value="9">Other</option>
					</select><br>
					<p>Education</p>
					<input type="checkbox" name="education" value="High School">High School
					<input type="checkbox" name="education" value="Associate Degree">Associate Degree<br>
					<input type="checkbox" name="education" value="Bachelors Degree">Bachelors Degree
					<input type="checkbox" name="education" value="Master Degree">Master Degree<br>
					<input type="checkbox" name="education" value="PhD">PhD<br>
					<input type="password" name="password" placeholder="Password">
					<input type="password" name="password2" placeholder="Retype password">
					<input type="submit" name="signup-button" value="Sign Up">
	     	</form>
			<% end if%>
	    </div>
   	</div>
	<div class="footer">
		<p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
	</div>
</body>
</html>