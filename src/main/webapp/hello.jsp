<%--
  Created by IntelliJ IDEA.
  Project name(项目名称)：JSTL_sql_transaction_label
  Author(作者）: mao
  Author QQ：1296193245
  GitHub：https://github.com/maomao124/
  Date(创建日期)： 2022/1/9
  Time(创建时间)： 15:08
  Description(描述)：
  JSTL <sql:transaction> 标签用于事务管理，可以将 <sql:query>、<sql:update> 标签封装在事务中，以确保事务的一致性。
JSP <sql:transaction> 标签的语法如下：
<sql:transaction dataSource="dataSource" isolation="isolation">
    <sql:query .../> 或 <sql:update.../>
</sql:transaction>
其中：
dataSource：用来指定数据源；
isolation：设置事务的隔离级别，有 4 个取值：READ_UNCOMMITTED、READ_COMMITED、REPEATABLE_READ 和 SERLALIZABLE。

在数据库中，我们将一条 SQL 语句称为一次基本的操作。将若干条 SQL 语句“打包”在一起，共同执行一个完整的任务，这就是事务。
事务（ Transaction）由一次或者多次基本操作构成，或者说，事务由一条或者多条 SQL 语句构成。
事务有一个最显著的特征，就是它包含的所有 SQL 语句作为一个整体向数据库提交，只有所有的 SQL 语句都执行完成，整个事务才算成功，
一旦某个 SQL 语句执行失败，整个事务就失败了。事务失败后需要回滚所有的 SQL 语句。
事务中的所有 SQL 语句是一个整体，共同进退，不可分割，要么全部执行成功，要么全部执行失败。
事务有很多实用的场景。例如对于电商网站，通常将用户订单存储在一张表中，将商品库存情况存储在另一张表中，当有用户下单时，需要执行两条 SQL 语句，
一条负责更新订单表，一条负责更新库存表，这两条 SQL 语句必须同时执行成功。如果只有一条语句执行成功，
另一条语句执行失败，将导致数据库出错，这种后果是无法接受的。
为了避免出现意外，可以将以上两条语句放到一个事务中，其中一条语句执行失败时，数据库将回滚到原来的状态。对于买家来说，
数据库回滚会导致下单失败，但这很容易处理，让买家再次下单即可。数据库的正确性永远是最重要的。
其实我们平时使用数据库时，就已经在使用事务了，只不过这种事务只包含一条 SQL 语句，并且由数据库引擎自动封装和提交。
这意味着，对于任何一条 SQL 语句，要么执行成功，要么执行失败，不能成功一部分，失败一部分。
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<sql:transaction>
    <%-- 插入数据 --%>
    <sql:update dataSource="${student}" var="result">
        INSERT INTO information VALUES (10,'测试','男',22);
    </sql:update>
    <%-- 修改--%>
    <sql:update dataSource="${student}" var="count">
        UPDATE information SET name='测试1' WHERE id = 10;
    </sql:update>
    <%-- 修改--%>
    <sql:update dataSource="${student}" var="count">
        UPDATE information SET age=<%=mao.jstl_sql_transaction_label.rad.getIntRandom(1, 50)%> WHERE id = 10;
    </sql:update>
    <%-- 插入数据 异常--%>
    <sql:update dataSource="${student}" var="result">
        INSERT INTO information VALUES (10,'测试2','男',23);
    </sql:update>
    <%-- 查询数据 --%>
    <sql:query dataSource="${student}" var="result">
        SELECT * from information;
    </sql:query>
</sql:transaction>
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
