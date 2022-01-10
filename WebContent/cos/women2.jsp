<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cos_main</title>
<link href="/Cos/cos/css/women_layout.css" rel="stylesheet" type="text/css" />
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
        <li><a class="MenuBarItemSubmenu" href="/Cos/cos/women_p.html">Women</a>
          <ul>
            <li><a href="/Cos/cos/women1.jsp?pgender=여&pcategory=아우터웨어">아우터웨어</a></li>
            <li><a href="/Cos/cos/women2.jsp?pgender=여&pcategory=니트웨어">니트웨어</a></li>
            <li><a href="/Cos/cos/women3.jsp?pgender=여&pcategory=셔츠">셔츠</a></li>
            <li><a href="/Cos/cos/women4.jsp?pgender=여&pcategory=드레스">드레스</a></li>
          </ul>
        </li>
        <li><a href="/Cos/cos/men_p.html" class="MenuBarItemSubmenu">Men</a>
          <ul>
            <li><a href="/Cos/cos/men1.jsp?pgender=남&pcategory=아우터웨어">아우터웨어</a></li>
            <li><a href="/Cos/cos/men2.jsp?pgender=남&pcategory=니트웨어">니트웨어</a></li>
            <li><a href="/Cos/cos/men3.jsp?pgender=남&pcategory=셔츠">셔츠</a></li>
            <li><a href="/Cos/cos/men4.jsp?pgender=남&pcategory=트라우저">트라우저</a></li>
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
    <div class="title">니트웨어</div>
    <div class="cate">
      <div class="ca1">
      	<a href="/Cos/cos/women2.jsp?pgender=여">모두보기</a>
      	<a href="/Cos/cos/women2.jsp?pcategory=니트웨어">가디건</a>
      	<a href="/Cos/cos/women2.jsp?pcategory=니트웨어&psort=베스트">베스트</a>
      </div>
    </div>
  </div>
  <div id="main">
    <div class="ma1">
      <div class="category">
        <select name="category" id="category">
          <option value="추천순" selected="selected">추천순</option>
          <option value="신상품">신상품순</option>
          <option value="낮은가격순">낮은가격순</option>
          <option value="높은가격순">높은가격순</option>
        </select>
      </div>
    </div>
  </div>
  
<%
	//String pgender = request.getParameter("pgender");
  	String pcategory = request.getParameter("pcategory");
  	String psort = request.getParameter("psort");
	Connection conn = ConnectionProvider.getConnection();
	List<Product> products = null;
	
	try{
		ProductDao dao = new ProductDao();
		//products = dao.selectGender(conn, pgender);
		products = dao.selectCategory(conn, pcategory, psort);
		//products = dao.selectSort(conn, psort);
	}catch(SQLException e){}
%>
  
  <div id="banner">
   <c:forEach var="product" items="<%=products %>">
    <div class="ban1">
      <div class="banimg"><img src="/Cos/uploadImages/${product.pimage}"/></div>
      <div class="baninfo">${product.pname}<br />
${product.price} 원</div>
    </div>
   </c:forEach>
  </div>
  <div class="tedul"></div>
  <div id="footer"></div>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"/Cos/cos/SpryAssets/SpryMenuBarDownHover.gif", imgRight:"/Cos/cos/SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>
