<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="main.css">
</head>
<% 
x = request.querystring("x") 
y = request.querystring("y")
zoomx = request.querystring("zoomx")
zoomy = request.querystring("zoomy")
%>
<body>
	<div id="map" style="background-size:<%=zoomx%>% <%=zoomy%>%;  background-position:<%=x%>px <%=y%>px">

		<div style="height:130px;width:130px;border:0" id="control">
		<a target="map" href="map2.asp?x=<%=x+50%>&y=<%=y+50%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"><button id="btn" type="submit"><span style="display:block; -webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);"><</span></button></a>
		<a target="map" href="map2.asp?x=<%=x%>&y=<%=y+50%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"><button id="btn" type="submit"><span style="display:block; -webkit-transform: rotate(90deg);-moz-transform: rotate(90deg);"><</span></button></a>
		<a target="map" href="map2.asp?x=<%=x-50%>&y=<%=y+50%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"><button id="btn" type="submit"><span style="display:block; -webkit-transform: rotate(-45deg);-moz-transform: rotate(-45deg);">></span></button></a>
		<a target="map" href="map2.asp?x=<%=x+50%>&y=<%=y%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"><button id="btn" type="submit"><</button></a>
		<a href="map2.asp?x=<%=-4200%>&y=<%=-600%>&zoomx=<%=2500%>&zoomy=<%=1100%>"><button id="btn" type="submit" ><b>*</b></button></a>
		<a target="map" href="map2.asp?x=<%=x-50%>&y=<%=y%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"><button id="btn" type="submit">></button></a>
		<a target="map" href="map2.asp?x=<%=x+50%>&y=<%=y-50%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"><button id="btn" type="submit"><span style="display:block; -webkit-transform: rotate(-45deg);-moz-transform: rotate(-45deg);"><</span></button></a>
		<a target="map" href="map2.asp?x=<%=x%>&y=<%=y-50%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"><button id="btn" type="submit"><span style="display:block; -webkit-transform: rotate(90deg);-moz-transform: rotate(90deg);">></button></a>
		<a target="map" href="map2.asp?x=<%=x-50%>&y=<%=y-50%>&zoomx=<%=zoomx%>&zoomy=<%=zoomy%>"><button id="btn" type="submit"><span style="display:block; -webkit-transform: rotate(45deg);-moz-transform: rotate(45deg);">></span></button></a>
		</div>
		<div style="height:90px;width:100px;border:0" id="control">
		<a target="map" href="map2.asp?x=<%=x-100%>&y=<%=y-100%>&zoomx=<%=zoomx+80%>&zoomy=<%=zoomy+80%>"><button id="btn" type="submit">+</button></a>
		<a target="map" href="map2.asp?x=<%=x+100%>&y=<%=y+100%>&zoomx=<%=zoomx-80%>&zoomy=<%=zoomy-80%>"><button id="btn" type="submit">-</button></a>
		</div>
	</div>
</body>
</html>
