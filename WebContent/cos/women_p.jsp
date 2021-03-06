<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cos_main</title>
<link href="/Cos/cos/css/product_layout.css" rel="stylesheet" type="text/css" />
<link href="/Cos/cos/SpryAssets/SpryMenuBarHorizontal.css" rel="stylesheet" type="text/css" />
<script src="/Cos/cos/SpryAssets/SpryMenuBar.js" type="text/javascript"></script>
</head>

<body>
<div id="wrap">
  <div id="page_header">
    <div class="phead">
      <div class="logo"><a href="/Cos/cos/main.html">cos</a></div>
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
        <li><a class="MenuBarItemSubmenu" href="/Cos/cos/women_p.jsp">Women</a>
          <ul>
            <li><a href="/Cos/cos/women1.jsp?pcategory=여성아우터웨어">아우터웨어</a></li>
            <li><a href="/Cos/cos/women2.jsp?pcategory=여성니트웨어">니트웨어</a></li>
            <li><a href="/Cos/cos/women3.jsp?pcategory=여성셔츠">셔츠</a></li>
            <li><a href="/Cos/cos/women4.jsp?pcategory=여성드레스">드레스</a></li>
          </ul>
        </li>
        <li><a href="/Cos/cos/men_p.jsp" class="MenuBarItemSubmenu">Men</a>
          <ul>
            <li><a href="/Cos/cos/men1.jsp?pcategory=남성아우터웨어">아우터웨어</a></li>
            <li><a href="/Cos/cos/men2.jsp?pcategory=남성니트웨어">니트웨어</a></li>
            <li><a href="/Cos/cos/men3.jsp?pcategory=남성셔츠">셔츠</a></li>
            <li><a href="/Cos/cos/men4.jsp?pcategory=남성트라우저">트라우저</a></li>
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
        <div class="pms2"><a href="/Cos/login/loginForm.html">로그인</a></div>
        <div class="pms2"><a href="/Cos/join/joinForm.html">회원가입</a></div>
        <div class="pms2"><a href="wishlist.html">위시리스트</a></div>
        <div class="pms2"><a href="cart.html">장바구니</a></div>
      </div>
    </div>
  </div>
  <div id="page_secon">
    <div class="title">Women</div>
    <div class="cate">
      <div class="ca1">
      	<a href="/Cos/cos/women1.jsp?pcategory=여성아우터웨어">Outerwear</a>
      	<a href="/Cos/cos/women2.jsp?pcategory=여성니트웨어">Knitwear</a>
      	<a href="/Cos/cos/women3.jsp?pcategory=여성셔츠">Shirts</a>
      	<a href="/Cos/cos/women4.jsp?pcategory=여성드레스">Dresses</a>
      </div>
    </div>
  </div>
  <div id="main">
    <div class="mainimg">
      <div class="micon1">
        <div class="micon2"><a href="new_arrivals.html">New arrivals</a></div>
        <div class="mimgbtn1">신상품 쇼핑하기</div>
      </div>
    </div>
    <div class="ma1">
      <div class="macon">
        <div class="mabtn1"><a href="sale.html">여성복 쇼핑하기</a></div>
      </div>
    </div>
  </div>
  <div id="banner">
    <div class="ban2">
      <div class="banimg"></div>
      <div class="baninfo"><a href="/Cos/cos/women1.jsp?pcategory=여성아우터웨어">여성 아우터웨어</a></div>
    </div>
    <div class="ban2">
      <div class="banimg"></div>
      <div class="baninfo"><a href="/Cos/cos/women2.jsp?pcategory=여성니트웨어">여성 니트웨어</a></div>
    </div>
    <div class="ban2">
      <div class="banimg"></div>
      <div class="baninfo"><a href="/Cos/cos/women3.jsp?pcategory=여성셔츠">여성 셔츠</a></div>
    </div>
    <div class="ban2">
      <div class="banimg"></div>
      <div class="baninfo"><a href="/Cos/cos/women4.jsp?pcategory=여성드레스">여성 드레스</a></div>
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
