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
        <li><a class="MenuBarItemSubmenu" href="/Cos/cos/in/women_pin.jsp">Women</a>
          <ul>
            <li><a href="/Cos/cos/in/women.jsp">아우터웨어</a></li>
            <li><a href="/Cos/cos/in/women.jsp">니트웨어</a></li>
            <li><a href="/Cos/cos/in/women.jsp">셔츠</a></li>
            <li><a href="/Cos/cos/in/women.jsp">드레스</a></li>
          </ul>
        </li>
        <li><a href="/Cos/cos/in/men_pin.jsp" class="MenuBarItemSubmenu">Men</a>
          <ul>
            <li><a href="/Cos/cos/in/men.jsp">아우터웨어</a></li>
            <li><a href="/Cos/cos/in/men.jsp">니트웨어</a></li>
            <li><a href="/Cos/cos/in/men.jsp">셔츠</a></li>
            <li><a href="/Cos/cos/in/men.jsp">드레스</a></li>
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

  
  <div id="main">
    <div class="join">
      <table width="420" height="400" border="0" cellpadding="3" cellspacing="2" id="jointable">
        <tr>
          <td height="70" colspan="2"><strong>관리자 화면</strong></td>
        </tr>
        <tr>
          <td height="50" colspan="2"><div class="td1"><a href="/Cos/admin/uploadForm.jsp">상품등록</a></div></td>
        </tr>
        <tr>
          <td height="50" colspan="2"><div class="td1"><a href="/Cos/admin/listProduct.jsp">상품정보조회</a></div></td>
        </tr>
        <tr>
          <td height="50" colspan="2"><div class="td1"><a href="saleView.jsp">판매내역조회</a></div></td>
        </tr>
        <tr>
          <td height="50" colspan="2"><div class="td1"><a href="memberManaging.jsp">회원관리</a></div></td>
        </tr>
        <tr>
          <td height="50" colspan="2"><div class="td1"><a href="bsManaging.jsp">게시판관리</a></div></td>
        </tr>
        <tr>
          <td height="150" colspan="4"><a href="/Cos/cos/in/mainin.jsp"><img src="/Cos/cos/images/main/finish_btn.jpg" width="305" height="43" /></a></td>
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
