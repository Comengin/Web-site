<%


set conn = Server.CreateObject("ADODB.Connection")
conn.Open "Provider=Microsoft.Jet.OLEDB.4.0; Data Source=" & Server.MapPath("comments.mdb")
Set save=Server.CreateObject("Adodb.Recordset")

save.Open "tables", conn, 1, 3

save.addnew
save("nameofcommenter")=Session("login")
save("comment")=Request.Form("massage")
if (request.form("control")="album1" or request.form("control")="album2" or request.form("control")="album3" or request.form("control")="album4")then
save("type")="album"
else if (request.form("control")="people1" or request.form("control")="people2" or request.form("control")="people3" or request.form("control")="people4")then
save("type")="people"
else if (request.form("control")="video1" or request.form("control")="video2") then
save("type")="video"
else  
save("type")="forum"
end if
end if
end if
save("dataofcomment")=now()
save.Update

Response.Write "<h2 align='center'>Your comment has been saved.</h2>"
Response.Write("<h3 align='center'>Wait...</h3>")
 
Set save=Nothing
conn.Close
Set conn=Nothing
if request.form("control")="album1" then
Response.Redirect("car1.asp")
else if request.form("control")="album2" then
Response.Redirect("car2.asp")
else if request.form("control")="album3" then
Response.Redirect("car3.asp")
else if request.form("control")="album4" then
Response.Redirect("car4.asp")
else if request.form("control")="people1" then
Response.Redirect("CRUZMITCHELL.asp")
else if request.form("control")="people2" then
Response.Redirect("ALLENLOPEZ.asp")
else if request.form("control")="people3" then
Response.Redirect("KENNEDYRODRIGUEZ.asp")
else if request.form("control")="people4" then
Response.Redirect("RIVERAWILSON.asp")
else if request.form("control")="video1" then
Response.Redirect("video1.asp")
else if request.form("control")="video2" then
Response.Redirect("video2.asp")
else 
Response.Redirect("forum.asp")
end if
end if
end if
end if
end if
end if
end if
end if
end if
end if
%>