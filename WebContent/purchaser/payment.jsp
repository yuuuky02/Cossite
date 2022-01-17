<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*,java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cos_main</title>
<link href="/Cos/cos/css/pay_layout.css" rel="stylesheet" type="text/css" />
</head>

<body>
<div id="wrap">
  <div id="page_header">
    <div class="phead">
      <div class="logo"><a href="main.html">cos</a></div>
    </div>
  </div>
  <div id="main">
    <div class="pay">
     <div class="title">주문서</div>
     <form action="payment.jsp" method="post">
      <table width="338" height="180" border="0" cellpadding="3" cellspacing="2" id="payinfo">
 		<tr>
   			<td height="53" colspan="2">
   				<div class="tiltie1"><strong>1. 주문 고객 정보</strong></div>
   			</td>
    	</tr>
  		<tr>
    		<td width="246" height="37">김유경</td>
    		<td width="74"><a href="#">수정</a></td>
  		</tr>
  		<tr>
    		<td height="37">010-3452-5290</td>
    		<td>&nbsp;</td>
  		</tr>
  		<tr>
    		<td height="43">이메일</td>
    		<td>&nbsp;</td>
  		</tr>
	  </table>
	 </form>

    </div>
    
    <%
    	request.setCharacterEncoding("utf-8");
   		String memberId = request.getParameter("memberId");
		String cardCompany = request.getParameter("cardCompany");
		String cardNumber = request.getParameter("cardNumber");
		String cardPassword = request.getParameter("cardPassword");
		String validDate = request.getParameter("validDate");
		SimpleDateFormat sdf = new SimpleDateFormat("MM/yyyy");
		java.util.Date vd = sdf.parse(validDate);
    	int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));
    	java.util.Date payDate = new java.util.Date();
    	Payment pmt = new Payment(memberId, cardCompany, cardNumber,cardPassword, vd, totalPrice, payDate);
    	Connection conn = ConnectionProvider.getConnection();
    	try{
    		PaymentDao dao = new PaymentDao();
    		dao.insert(conn,pmt);
    	} catch(SQLException e){}    	
    %>
    
    <div class="paybox">
      <table width="500" height="415" border="0" cellpadding="3" cellspacing="2" id="pay2">
        <tr>
          <td height="61"><div class="tiltie2"><strong>2. 결제 정보</strong></div></td>
        </tr>
        <tr>
          <td height="141">김유경님, 총 1000원 결제되었습니다.</td>
        </tr>
        <tr>
          <td height="71">감사합니다.</td>
        </tr>
        <tr>
          <td height="132"><input type="submit" name="pay_btn" id="pay_btn" value="메인화면으로" /></td>
        </tr>
      </table>
    </div>
  </div>
  <div class="tedul"></div>
  <div id="footer"></div>
</div>
</body>
</html>
