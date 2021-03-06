<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="my.dao.*,my.model.*,my.util.*,java.sql.*"%>
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
   <form action="payment.jsp" method="post">
    <div class="pay">
     <div class="title">주문서</div>
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
	 

    </div>
    <div class="paybox">
      <table width="500" height="583" border="0" cellpadding="3" cellspacing="2" id="pay2">
        <tr>
          <td height="61" colspan="2"><div class="tiltie2"><strong>2. 결제 정보</strong></div></td>
        </tr>
        <tr>
          <td width="149" height="59">회원아이디</td>
          <td width="333"><%=session.getAttribute("LOGINID") %></td>
        </tr>
        <tr>
          <td>카드사</td>
          <td><input type="text" name="cardCompany" id="p1" /></td>
        </tr>
        <tr>
          <td>카드번호</td>
          <td><input type="text" name="cardNumber" id="p1" placeholder="0000-0000-0000-0000"/></td>
        </tr>
        <tr>
          <td>카드비밀번호</td>
          <td><input type="text" name="cardPassword" id="p1" placeholder="****"/></td>
        </tr>
        <tr>
          <td>유효기간</td>
          <td><input type="text" name="valideDate" id="p1" placeholder="MM/YYYY"/></td>
        </tr>
        <tr>
          <td height="61">총 결제금액</td>
          <td>${param.totalPrice}</td>
        </tr>
        <tr>
          <td height="132" colspan="2">
          	<input type="submit" name="pay_btn" id="pay_btn" value="결제하기" />
          </td>
        </tr>
      </table>
    </div>
  </div>
  </form>
  <div class="tedul"></div>
  <div id="footer"></div>
</div>
</body>
</html>
