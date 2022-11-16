<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page import="java.util.*, java.lang.*" %>
<%@ page import="java.text.*, java.net.InetAddress" %>
<c:set var="path1" value="${request.getContextPath() }" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>마포 문화관광</title>
    <jsp:include page="/head.jsp" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
    
    
    <style>
    a:link { color: rgb(0, 0, 0); text-decoration:none !important}	
    a:visited { color: #000; text-decoration:none !important}	

    a:active { color: rgb(0, 0, 0); text-decoration:none !important}
    
    
    </style>
</head>
<body>
  	<jsp:include page="${path1 }/header.jsp" />
  	
            
	<jsp:include page="${path1 }/footer.jsp" />
</body>
</html>