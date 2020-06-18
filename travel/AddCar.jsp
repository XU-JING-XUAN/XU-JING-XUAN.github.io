<!-- Step 0: import library -->
<%@ page import = "java.sql.*, java.util.*,  java.text.*"%>
<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="config.jsp" %>

<%
try{
		if(session.getAttribute("username")==null)
		{
		   out.print("<script>alert('沒登入我怎麼知道你是誰？'); self.location=document.referrer; </script>");

		}
		else
		{
		    String username=session.getAttribute("username").toString();
			String number=request.getParameter("number");
			String date=request.getParameter("date");
			String traffic=request.getParameter("traffic");
			String quantity=request.getParameter("quantity");	

		   sql="select * from car where username='"+ username+"' AND number='"+ number+"' ";
           ResultSet rs=con.createStatement().executeQuery(sql);
		   
			//if(rs.next() == false){                   //rs得知car資料庫裡沒有任何資料
			    sql="INSERT car (username, number, date, traffic, quantity) ";
			    sql+="VALUES ('" + username+ "', ";
			    sql+="'"+ number+"', "; 
			    sql+="'"+ date+"', "; 
			    sql+="'"+ traffic+"', "; 
			    sql+="'"+ quantity+"')";  
				
				con.createStatement().execute(sql);	 //執行SQL				
				con.close();						 //關閉連線
		   
				out.print("<script>alert('成功加入購物車！'); self.location=document.referrer; </script>"); 
			//}
			//else										//rs得知car資料庫裡面有資料
			//{
			//	out.print("<script>alert('此商品已在購物車囉 ~'); self.location=document.referrer; </script>");
			//}
		}

}
catch ( SQLException e){
	out.print(e.toString());
		   
}
		 
		   
		
		  

		   
		
		  

%>
</body>
</html>
