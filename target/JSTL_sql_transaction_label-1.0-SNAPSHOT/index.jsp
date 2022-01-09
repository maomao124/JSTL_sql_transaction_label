<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
</head>
<body>

<%--
var：代表数据源的变量；
driver：注册的 JDBC 驱动；mysql8.0:com.mysql.jdbc.Driver
url://地址:端口号/数据库名
user：连接数据库时使用的用户名；
password：连接数据库时使用的密码；
dataSource：已经存在的数据源；
scope：设定参数 var 的有效范围，默认为 page
--%>
<sql:setDataSource var="student" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/student"
                   user="root" password="20010713" scope="session"/>

<h1><%= "Hello World!" %>
</h1>
<br/>
<a href="hello-servlet">Hello Servlet</a>
<br>
<a href="select.jsp">select.jsp</a><br/>
<a href="hello.jsp">Hello.jsp</a><br/>
<a href="hello1.jsp">Hello1.jsp</a><br/>
</body>
</html>