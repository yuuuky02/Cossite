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
            <li><a href="women.html">아우터웨어</a></li>
            <li><a href="women.html">니트웨어</a></li>
            <li><a href="women.html">셔츠</a></li>
            <li><a href="women.html">드레스</a></li>
          </ul>
        </li>
        <li><a href="men.html" class="MenuBarItemSubmenu">Men</a>
          <ul>
            <li><a href="men.html">아우터웨어</a></li>
            <li><a href="men.html">니트웨어</a></li>
            <li><a href="men.html">셔츠</a></li>
            <li><a href="men.html">드레스</a></li>
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
    <div class="listp">
<%
	String pageNumberStr = request.getParameter("page");
	int pageNumber = 1;
	if (pageNumberStr != null){
		pageNumber = Integer.parseInt(pageNumberStr);
	}
	ProductListView viewData = null;
	List<Product> products = null;
	Connection conn = ConnectionProvider.getConnection();
	try{
		ProductDao dao = new ProductDao();
		viewData = dao.getProductList(pageNumber,conn);
		products = viewData.getProductList();
	}catch(SQLException e){}
	finally{
		JdbcUtil.close(conn);
	}
	if (products != null){
%>
  
  
      <table width="1500" height="257" border="0" cellpadding="3" cellspacing="1" id="listproduct">
        <tr>
          <td width="55" height="58" bgcolor="#3D3D3D"><strong>번호</strong></td>
          <td width="315" bgcolor="#3D3D3D"><strong>상품명</strong></td>
          <td width="143" bgcolor="#3D3D3D"><strong>상품가격</strong></td>
          <td width="68" bgcolor="#3D3D3D"><strong>성별</strong></td>
          <td width="161" bgcolor="#3D3D3D"><strong>상품분류</strong></td>
          <td width="234" bgcolor="#3D3D3D"><strong>상품종류</strong></td>
          <td width="150" bgcolor="#3D3D3D"><strong>출시일</strong></td>
          <td width="123" bgcolor="#3D3D3D"><strong>상품이미지</strong></td>
          <td width="90" bgcolor="#3D3D3D"><strong>수정</strong></td>
          <td width="90" bgcolor="#3D3D3D"><strong>삭제</strong></td>
        </tr>
       <c:forEach var="product" items="<%=products %>">
        <tr>
          <td height="100">${product.pid}</td>
          <td>${product.pname}</td>
          <td>${product.price}</td>
          <td>${product.pgender}</td>
          <td>${product.pcategory}</td>
          <td>${product.psort}</td>
          <td>${product.pdate}</td>
          <td><img src="/Cos/uploadImages/${product.pimage}" width="50" height="60"></td>
          <td><input type="button" name="update_btn" id="updatebtn" value="수정" onclick="location.href='updateForm.jsp?pid=${product.pid}'"></td>
          <td><input type="button" name="delete_btn" id="deletebtn" value="삭제" onclick="location.href='delete.jsp?pid=${product.pid}'"></td>
        </tr>
       </c:forEach>
      </table>
      <div class="listbtn">
      	<c:forEach var="i" begin="1" end="<%=viewData.getPageTotalCount() %>">
        	<input type="button" value="${i}"
        		onclick="location.href='listProduct.jsp?page=${i}'">
        </c:forEach>
      </div>

<% } %>
    </div>
  </div>
  <div class="tedul">
    <p>&nbsp;</p>
    <p>&nbsp;</p>
  </div>
  <div id="footer"></div>
</div>
<script type="text/javascript">
var MenuBar1 = new Spry.Widget.MenuBar("MenuBar1", {imgDown:"/Cos/cos/SpryAssets/SpryMenuBarDownHover.gif", imgRight:"/Cos/cos/SpryAssets/SpryMenuBarRightHover.gif"});
</script>
</body>
</html>
