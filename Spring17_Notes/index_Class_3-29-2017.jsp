<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> <!-- //page is being generated by 8-bit unicode java, diocritical accepting -->
<%@ taglib prefix "c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix "" uri="http://java.sun.com.jsp/jstl/sql" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>Hello world!</h1>
<!--  -->
<c:out value="this"></c:out>
<c:out value="">or this</c:out>
<c:out value="${5+2}">the value is a literal when within the bracket. ${}is an expression language</c:out> <!-- this will allow us to connect to variables quieried from sql tables -->
-->
</body>
</html>