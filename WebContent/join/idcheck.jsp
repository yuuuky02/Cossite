<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>아이디 중복체크</title>
<link href="/Cos/cos/css/idcheck_layout.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
function MM_callJS(jsStr) { //v2.0
  return eval(jsStr)
}
</script>
</head>

<body>
<div class="idcheck">
  <div class="con1">
    <div class="conmess">확인메시지</div>
<div class="close"><a href="#"><img src="/Cos/cos/images/main/close.jpg" width="40" height="40" onclick="MM_callJS('window.close();')" /></a></div>
  </div>
  
  <%
  	String memberId = request.getParameter("memberId");
  	Connection conn = ConnectionProvider.getConnection();
  	MemberDao dao = new MemberDao();
  	Member member = dao.selectById(conn, memberId);
  %>
  <div class="con2">
  	<%
  		if (member == null){
  			out.print("사용가능한 아이디입니다.");
  	%>
  		<input type="button" class="iduse_btn" value="아이디 사용하기" onclick="result();"/>
  	<%
  		}else if (member != null){
  			out.print("중복된 아이디입니다.");
  		}
  	%>
  </div>
  <div class="con2">
   <form action="idcheck.jsp" method="post" name="wfr">
    <div class="con2id">ID : </div>
    <input type="text" name="memberId" id="memberId" value="<%=memberId%>"/>
    <div class="okbtn"><input type="image" name="okbtn" id="okbtn" src="/Cos/cos/images/main/okbtn.jpg" /></div>
   </form>
  </div>
</div>

<script type="text/javascript">
	function result(){
		opener.document.fr.memberId.value = document.wfr.memberId.value;
		
		opener.document.fr.memberId.readOnly=true;
		
		window.close();
	}
</script>

</body>
</html>
