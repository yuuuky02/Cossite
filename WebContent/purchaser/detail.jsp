<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cos_main</title>
<link href="/Cos/cos/css/detail_layout.css" rel="stylesheet" type="text/css" />
<link href="/Cos/cos/SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="/Cos/cos/SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>
<div id="wrap">
  <div id="page_header">
    <div class="phead">
      <div class="logo"><a href="main.html">cos</a></div>
      <ul id="MenuBar1" class="MenuBarHorizontal">
        <li><a class="MenuBarItemSubmenu" href="sale.html">Sale</a>
          <ul>
            <li><a href="sale.html">Women's sale</a></li>
            <li><a href="sale.html">Men's sale</a></li>
</ul>
        </li>
        <li><a href="new_arrivals.html" class="MenuBarItemSubmenu">New Arrivals</a>
          <ul>
            <li><a href="new_arraivals.html">Women: New Arrivals</a></li>
            <li><a href="new_arrivals.html">Men: New Arrivals</a></li>
          </ul>
        </li>
        <li><a class="MenuBarItemSubmenu" href="women.html">Women</a>
          <ul>
            <li><a href="/Cos/cos/in/womenin1.jsp?pcategory=여성아우터웨어">아우터웨어</a></li>
            <li><a href="/Cos/cos/in/womenin2.jsp?pcategory=여성니트웨어">니트웨어</a></li>
            <li><a href="/Cos/cos/in/womenin3.jsp?pcategory=여성셔츠">셔츠</a></li>
            <li><a href="/Cos/cos/in/womenin4.jsp?pcategory=여성드레스">드레스</a></li>
          </ul>
        </li>
        <li><a href="men.html" class="MenuBarItemSubmenu">Men</a>
          <ul>
            <li><a href="/Cos/cos/in/menin1.jsp?pcategory=남성아우터웨어">아우터웨어</a></li>
            <li><a href="/Cos/cos/in/menin2.jsp?pcategory=남성니트웨어">니트웨어</a></li>
            <li><a href="/Cos/cos/in/menin3.jsp?pcategory=남성셔츠">셔츠</a></li>
            <li><a href="/Cos/cos/in/menin4.jsp?pcategory=남성트라우저">트라우저</a></li>
          </ul>
        </li>
<li><a href="sustain.html" class="MenuBarItemSubmenu">Sustainability</a>
          <ul>
            <li><a href="sustain.html">Our Mission</a></li>
          </ul>
        </li>
      </ul>
      <div class="psmenu">
        <div class="pms2"><a href="search.html">검색</a></div>
        <div class="pms2"><a href="memberinfo.html"><%=session.getAttribute("LOGINID") %> COS</a></div>
        <div class="pms2"><a href="/Cos/login/logout.jsp">로그아웃</a></div>
        <div class="pms2"><a href="wishlist.html">위시리스트</a></div>
        <div class="pms2"><a href="cart.html">장바구니</a></div>
      </div>
    </div>
  </div>
  <div id="main">
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	Product product=null;
	Connection conn = ConnectionProvider.getConnection();
	try{
		ProductDao dao = new ProductDao();
		product = dao.selectById(conn, pid);
	}catch(SQLException e){}
	if (product != null){
%>
	<c:set var="p" value="<%=product %>"/>
    <div class="pimage">
    	<img src="/Cos/uploadImages/${p.pimage}" width="608" height="905" />
    </div>
    <div class="dinfo"><table width="545" height="373" border="0" cellpadding="3" cellspacing="2" id="detail">
  <tr>
    <td height="62"><div class="new">NEW</div></td>
  </tr>
  
  <tr>
    <td height="31">${p.pcategory}</td>
  </tr>
  <tr>
    <td height="35"><strong>${p.pname}</strong></td>
  </tr>
  <tr>
    <td height="84">${p.price} 원</td>
  </tr>
<% } %>
  <tr>
    <td height="149">
    	<a href="purchase.jsp"><input type="submit" name="cart_btn" id="cart_btn" value="장바구니 담기" /></a>      
    	<a href="putcart.jsp"><input type="submit" name="pay_btn" id="pay_btn" value="주문하기" /></a>
    </td>
  </tr>
</table>
</div>
    
  </div>
  <div class="tedul"></div>
  <div id="footer"></div>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"/Cos/cos/SpryAssets/SpryMenuBarDownHover.gif", imgRight:"/Cos/cos/SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>
