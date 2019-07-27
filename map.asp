<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8">
        <title>Map</title>
        <link rel="stylesheet" type="text/css" href="main.css">
        <link rel="shortcut icon" href="map.png">
</head>
<% 
x = -4200
y = -750
zoomx=2500
zoomy=1100
%> 
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
                        <li><a href="continf.asp">Contacts</a></li>
                        <li class="current"><a href="map.asp">Map</a></li>
                    </ul>
                </div>
        </div>
    </div>
    <div class="map-box" style="margin-left: 2%">
            <div class="map">
                <iframe name="map" style="border:0;width:500px;height:500px;" src="map2.asp?x=<%=x%>&y=<%=y%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"></iframe>
            </div>
        </div>
    <div class="footer">
        <p>2019 &copy; All Rights Reserved | Designed by Bairam Kuliev</p>
    </div>
</body>
</html>