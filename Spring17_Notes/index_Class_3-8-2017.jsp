<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> <!-- //page is being generated by 8-bit unicode java, diocritical accepting -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Testing Citation</title>
</head>
<body>
	<!-- Beginning of class 3/8/2017 -->
	<sql:setDataSource 
		var="ohiolink"
		driver="org.postgresql.Driver"
		url="jdbc:postgresql://neuromancer.icts.uiowa.edu/ohiolink"
		user="demo"
		password="Spring2017"
	/> <!-- making connections, Driver will work with any Maven Jar with postgres9+, preferred to pick just jdbc4 not jdbc4.something --> 
	<!-- database and database engine can be on different machines -->
	<!-- "jdbc:postgresql://neuromancer.icts.uiowa.edu (host, :localhost: give connection to local machine)/ohiolink (name of db)" -->
	<!--
	<sql:setDataSource var="ohiolink" dataSource="jdbc/OHIO" /> somewhere in architecture, there is an xml OHIO that allows you to keep passwords and usernames out of this document. the file is called a dataSource definition
	 -->
	
	<sql:query var="results" dataSource="ohiolink"> 
		select item_no,source,campus from circulation.circ1000 limit 100 WHERE item_no=?::int ORDER BY SOURCE DESC,campus
		<sql:param value="2013369"></sql:param>
		<sql:param value="${param.x }"</sql:param> <!-- can make the item_no part of the url or as input and plug it into the page like this -->
		<!-- can also <sql:param> 2013369</sql:param> -->
		<!-- params must be in order of the ?'s if there are multiple...like a fprintf statement -->
		<!-- item_no=?::int typecasts ? to an int -->
	</sql:query> <!-- can plug any sql query into here, declarative statement/request but doesn't display on page, anything here needs to be lightweight because it will lock up page while it works, limit specifies that only the 1st 100 are returned -->
	<!-- the sql query itself is not type checked by Eclipse, stages the answers returned by the sql command into the var results from the database dataSource ohiolink  -->
	<!--  can query multiple dbs simultaneously on 1 page -->
	<ul>
		<c:forEach items="${results.rows}" var="result"> 
			<li><c:out value="${result.item_no}"/> : <c:out value="${result.source}"/> , <c:out value="${result.campus}"/></li>
		</c:forEach>
	</ul>
	<!-- ANT is a command line tool that runs commands for you, a rule driven task engine -->
	
</body>
</html>