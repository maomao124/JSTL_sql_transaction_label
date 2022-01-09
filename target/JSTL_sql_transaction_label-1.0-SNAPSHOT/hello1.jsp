<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_sql_transaction_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 19:14
  Description(描述)： 无
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%-- 插入数据 --%>
<sql:update dataSource="${student}" var="result">
    INSERT INTO information VALUES (10,'测试','男',22);
</sql:update>
<%-- 修改--%>
<sql:update dataSource="${student}" var="count">
    UPDATE information SET name='测试1' WHERE no = 10;
</sql:update>
<%-- 修改--%>
<sql:update dataSource="${student}" var="count">
    UPDATE information SET age=<%=mao.jstl_sql_transaction_label.rad.getIntRandom(1, 50)%> WHERE no = 10;
</sql:update>

<%-- 插入数据 异常--%>
<sql:update dataSource="${student}" var="result">
    INSERT INTO information VALUES (10,'测试2','男',23);
</sql:update>
<%-- 查询数据 --%>
<sql:query dataSource="${student}" var="result">
    SELECT * from information;
</sql:query>
<table border="1">
    <tr>
        <th>no</th>
        <th>name</th>
        <th>sex</th>
        <th>age</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td><c:out value="${row.no}"/></td>
            <td><c:out value="${row.name}"/></td>
            <td><c:out value="${row.sex}"/></td>
            <td><c:out value="${row.age}"/></td>
        </tr>
    </c:forEach>
</table>
</body>
</html>
