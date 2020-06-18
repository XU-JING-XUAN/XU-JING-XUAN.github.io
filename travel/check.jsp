<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>
<%
	if(request.getParameter("username") !=null && request.getParameter("password") != null)
{
    //sql = "select * from newmembers where email='" +request.getParameter("email") + "'  AND newpwd='" + request.getParameter("newpwd") + "'"  ; 
    //ResultSet paperr=con.createStatement().executeQuery(sql);
	sql = "SELECT * FROM newmembers WHERE username=? AND password=?";
	PreparedStatement pstmt = null;
	pstmt=con.prepareStatement(sql);
    pstmt.setString(1,request.getParameter("username"));
    pstmt.setString(2,request.getParameter("password"));
	ResultSet paperrs = pstmt.executeQuery();
	if(request.getParameter("username").equals("chicken@gmail.com") && request.getParameter("password").equals("1234"))
	{
	  session.setAttribute("username",request.getParameter("username"));
      response.sendRedirect("list.jsp") ;
	}
    
    else if(paperrs.next())
	{            
        session.setAttribute("username",request.getParameter("username"));
        out.print("<script>alert('登入成功!'); self.location=document.referrer; </script>");
    }
    else
	{
		out.print("<script>alert('密碼錯誤!'); self.location=document.referrer; </script>"); 
	}
}
%>