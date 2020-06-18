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
			request.setCharacterEncoding("UTF-8");
		    String username=session.getAttribute("username").toString();
			//使用者
			String name=request.getParameter("name");
			String birth=request.getParameter("birth");
			String phone=request.getParameter("phone");
			String userid=request.getParameter("userid");	
			String address=request.getParameter("address");
			String payment=request.getParameter("payment");
			//使用者END
			//產品
			sql="select * from car where username='"+ username+"'";
			ResultSet rs=con.createStatement().executeQuery(sql);
			int total=0;
			while(rs.next()){
				/*String no=rs.getString("no");*/
				String number=rs.getString("number");
				String date=rs.getString("date");
				String traffic=rs.getString("traffic");
				int quantity=rs.getInt("quantity");
				String sqlProduct="select * from product where number='"+number+"'";
				ResultSet rsProduct=con.createStatement().executeQuery(sqlProduct);
				rsProduct.next();
				String p_name= rsProduct.getString("name");
				String p_number=rsProduct.getString("number");
				int p_price= rsProduct.getInt("price");
				total += quantity*p_price;
				int p_stock= rsProduct.getInt("stock");
			
			//產品END
		   
			//if(rs.next() == false){                   //rs得知car資料庫裡沒有任何資料
			    sql="INSERT `order` (`username`, `name`, `birth`, `phone`, `userid`, `address`, `payment`, `pname`, `pdate`, `ptraffic`, `pquantity`, `pprice`) ";
			    sql+="VALUES ('" + username+ "', ";
			    sql+="'"+ name+"', "; 
			    sql+="'"+ birth+"', "; 
			    sql+="'"+ phone+"', "; 
			    sql+="'"+ userid+"', ";
			    sql+="'"+ address+"', ";
			    sql+="'"+ payment+"', ";
			    sql+="'"+ p_name+"', ";
			    sql+="'"+ date+"', ";
			    sql+="'"+ traffic+"', ";
			    sql+="'"+ quantity+"', ";
			    sql+="'"+ quantity*p_price+"')";  
				
				con.createStatement().execute(sql);	 //執行SQL	
				}			
				sql="DELETE FROM `car` WHERE `username`='"+ username+"'";
		  	    con.createStatement().execute(sql);	 //執行SQL
				con.close();						 //關閉連線
		   
				out.print("<script>alert('購買成功！祝旅途愉快~');</script>"); 
				response.setHeader("refresh","0;URL=index.jsp");
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
