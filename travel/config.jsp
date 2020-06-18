<%
Class.forName("com.mysql.jdbc.Driver");
String url="jdbc:mysql://localhost?serverTimezone=UTC&characterEncoding=UTF8";
Connection con=DriverManager.getConnection(url,"root","1234");
String sql="use dbProject";
con.createStatement().execute(sql);
%>