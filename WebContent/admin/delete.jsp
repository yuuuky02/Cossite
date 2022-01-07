<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cos_main</title>
<link href="/Cos/cos/css/listproduct_layout.css" rel="stylesheet" type="text/css" />
<link href="/Cos/cos/SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="/Cos/cos/SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>
<div id="wrap">
  <div id="page_header">
    <div class="phead">
      <div class="logo"><a href="/Cos/cos/in/mainin.jsp">cos</a></div>
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
            <li><a href="women.html">모두보기</a></li>
            <li><a href="women.html">니트웨어</a></li>
            <li><a href="women.html">아우터웨어</a></li>
            <li><a href="women.html">드레스</a></li>
          </ul>
        </li>
        <li><a href="men.html" class="MenuBarItemSubmenu">Men</a>
          <ul>
            <li><a href="men.html">모두보기</a></li>
            <li><a href="men.html">니트웨어</a></li>
            <li><a href="men.html">아우터웨어</a></li>
            <li><a href="men.html">트라우저</a></li>
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
        <div class="pms2"><a href="/Cos/login/admin.jsp"><%=session.getAttribute("LOGINID") %> COS</a></div>
        <div class="pms2"><a href="/Cos/login/logout.jsp">로그아웃</a></div>
        <div class="pms2"><a href="wishlist.html">위시리스트</a></div>
        <div class="pms2"><a href="cart.html">장바구니</a></div>
      </div>
    </div>
  </div>
  
<%
	int pid = Integer.parseInt(request.getParameter("pid"));
	Connection conn = ConnectionProvider.getConnection();
	List<Product> products = null;
	try{
		ProductDao dao = new ProductDao();
		dao.deleteById(conn, pid);
	}catch(SQLException e){}
%>
  
  <div id="main">
  	<div class="delete">
      <table width="420" height="338" border="0" cellpadding="3" cellspacing="2" id="deletetable">
        <tr>
          <td height="70" colspan="4"><strong>상품 삭제</strong></td>
        </tr>
        <tr>
          <td height="60" colspan="4"><%=pid %> 번,</td>
        </tr>
        <tr>
          <td height="60" colspan="4">상품이 삭제되었습니다.</td>
        </tr>
        <tr>
          <td height="125" colspan="4"><a href="/Cos/admin/listProduct.jsp"><img src="/Cos/cos/images/admin/list_btn.jpg" width="305" height="41" /></a></td>
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
