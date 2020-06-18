<%@page contentType="text/html;charset=utf-8" language="java" import="java.sql.*"%>
<%@include file="config.jsp" %>

<%
	String psw1 = request.getParameter("password");
	String psw2 = request.getParameter("password-repect");
	if(psw1.equals(psw2))
	{
		if(request.getParameter("username") != "" && request.getParameter("password") != "" && request.getParameter("name") != "" && request.getParameter("birth") != "" && request.getParameter("sex") != ""&& request.getParameter("phone") != ""&& request.getParameter("address") != ""&& request.getParameter("email") != "" )
		{	
			//檢查密碼是否正確
			sql = "SELECT * FROM newmembers WHERE username=? AND password=?";
			PreparedStatement pstmt = null;
			pstmt=con.prepareStatement(sql);
   		 	pstmt.setString(1,request.getParameter("username"));
    		pstmt.setString(2,request.getParameter("password"));
			ResultSet paperrs = pstmt.executeQuery();
			if(paperrs.next())
			{
			//檢查結束
			request.setCharacterEncoding("UTF-8");
			pstmt = null;
			sql = "select `memberID` from `newmembers` where username = '" + (String)session.getAttribute("username") + "'";  //再拿來找編號
			pstmt=con.prepareStatement(sql);
			paperrs = pstmt.executeQuery(sql);
			paperrs.next();
			int nowNumber = paperrs.getInt(1);
			String number = String.valueOf(nowNumber); 		
			
			String address = request.getParameter("address");
			byte[] bytes = address.getBytes("ISO-8859-1");
			address = new String(bytes, "UTF-8");
			
			String sex = request.getParameter("sex");
			bytes = sex.getBytes("ISO-8859-1");
			sex = new String(bytes, "UTF-8");
			
			String name = request.getParameter("name");
			bytes = name.getBytes("ISO-8859-1");
			name = new String(bytes, "UTF-8");
			
			sql = "Update `newmembers` Set username = ?, password = ?, name = ?, birth = ?, sex = ?, phone = ?, address = ?, email = ? Where `memberID` = ?"; //用?取代字串相加
			pstmt=con.prepareStatement(sql);//創造預備敘述			
			pstmt.setString(1, request.getParameter("username")); //再一一放入各參數
			pstmt.setString(2, request.getParameter("password"));			
			pstmt.setString(3, name);
			pstmt.setString(4, request.getParameter("birth"));
			pstmt.setString(5, sex);
			pstmt.setString(6, request.getParameter("phone"));
			pstmt.setString(7, address );
			pstmt.setString(8, request.getParameter("email"));
			pstmt.setString(9, number);
			pstmt.executeUpdate();//輸入完執行
						
			session.setAttribute("username",request.getParameter("username"));
		    out.println("<script>alert('修改成功'); self.location=document.referrer; </script>");
			//response.setHeader("refresh","0;URL=index.jsp") ;
			}
			else
			{
				out.println("<script>alert('密碼輸入錯誤！'); self.location=document.referrer; </script>");
			}
		}
		else
			response.sendRedirect("member.jsp") ;
	}
	else
		response.sendRedirect("member.jsp") ;
%>