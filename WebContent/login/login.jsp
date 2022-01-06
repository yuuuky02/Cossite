<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cos_main</title>
<link href="/Cos/cos/css/login_layout.css" rel="stylesheet" type="text/css" />
<link href="/Cos/cos/SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="/Cos/cos/SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>
<div id="wrap">
  <div id="page_header"></div>

<% request.setCharacterEncoding("utf-8");%>
<jsp:useBean id="member" class="my.model.Member"/>
<jsp:setProperty property="*" name="member"/>

<%
	String memberId= request.getParameter("memberId");
 	String password = request.getParameter("password");
 	Connection conn = ConnectionProvider.getConnection();
 	int result = 0;
 	//boolean login = true;
	try{
		MemberDao dao = new MemberDao();
		//login = dao.checkPassword(conn, memberId, password);
		result = dao.checkLogin(conn, memberId, password);
	}catch(SQLException e){}
	if (result ==1){
		session.setAttribute("LOGINID", memberId);
		if (memberId.equals("admin"))
			response.sendRedirect("admin.jsp");
		else
			response.sendRedirect("/Cos/cos/in/mainin.jsp");
	}else if(result == 0){
%>
<script>
	alert("패스워드가 틀립니다.");
	history.go(-1);
</script>
<%
	}else if(result == -1){
%>
<script>
	alert("존재하지 않는 아이디입니다.");
	history.go(-1);
</script>
<%
	}else if(result == -2){
%>
<script>
	alert("오류 발생");
	history.go(-1);
</script>
<%
	}
%>
  
  <div id="main"></div>
</div>
</body>
</html>
