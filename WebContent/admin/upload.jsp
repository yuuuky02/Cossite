<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>
<%@ page import="java.io.File"%>
<%@ page import="java.util.Enumeration"%>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Cos_main</title>
<link href="/Cos/cos/css/upload_layout.css" rel="stylesheet" type="text/css" />
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
            <li><a href="/Cos/cos/in/womenin.jsp">아우터웨어</a></li>
            <li><a href="/Cos/cos/in/womenin.jsp">니트웨어</a></li>
            <li><a href="/Cos/cos/in/womenin.jsp">셔츠</a></li>
            <li><a href="/Cos/cos/in/womenin.jsp">드레스</a></li>
          </ul>
        </li>
        <li><a href="/Cos/cos/in/men_pin.jsp" class="MenuBarItemSubmenu">Men</a>
          <ul>
            <li><a href="/Cos/cos/in/menin.jsp">아우터웨어</a></li>
            <li><a href="/Cos/cos/in/menin.jsp">니트웨어</a></li>
            <li><a href="/Cos/cos/in/menin.jsp">셔츠</a></li>
            <li><a href="/Cos/cos/in/menin.jsp">트라우저</a></li>
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

  	String uploadPath="C:\\web\\ws\\Cos\\WebContent\\uploadImages";
  	int maxSize = 1024 *1024 *10;
  	
  	String pname="";
  	int price=0;
  	String pgender="";
  	String pcategory="";
  	String psort="";
  	String pimage="";
  	MultipartRequest multi=null;
  	
  	try{
  		multi = new MultipartRequest(request,uploadPath,maxSize,"utf-8",new DefaultFileRenamePolicy());
  		pname = multi.getParameter("pname");
  		price = Integer.parseInt(multi.getParameter("price"));
  		pgender = multi.getParameter("pgender");
  		pcategory = multi.getParameter("pcategory");
  		psort = multi.getParameter("psort");
  		pimage = multi.getFilesystemName("pimage");
  		Connection conn = ConnectionProvider.getConnection();
  		ProductDao dao = new ProductDao();
  		Product product = new Product(0, pname, price, pgender, pcategory, psort, pimage, new java.util.Date());
  		dao.insert(conn, product);
  	}catch(Exception e){}
%>
  
  <div id="main">
    <div class="upload">
      <table width="420" height="457" border="0" cellpadding="3" cellspacing="2" id="uploadtable">
        <tr>
          <td height="75" colspan="2"><strong>상품등록</strong></td>
        </tr>
        <tr>
          <td width="111" height="60">상품명</td>
          <td width="291" id="uploadtable"><div class="td1"><%=pname %></div></td>
        </tr>
        <tr>
          <td width="111" height="60">상품가격</td>
          <td id="uploadtable"><div class="td1"><%=price %></div></td>
        </tr>
        <tr>
          <td width="111" height="60">성별</td>
          <td id="uploadtable"><div class="td1"><%=pgender %></div></td>
        </tr>
        <tr>
          <td width="111" height="60">상품분류</td>
          <td id="uploadtable"><div class="td1"><%=pcategory %></div></td>
        </tr>
        <tr>
          <td width="111" height="60">상품종류</td>
          <td id="uploadtable"><div class="td1"><%=psort %></div></td>
        </tr>
        <tr>
          <td width="111" height="60">상품이미지</td>
          <td id="uploadtable"><div class="td1"><%=pimage %></div></td>
        </tr>
        <tr>
          <td height="90" colspan="4"><a href="/Cos/login/admin.jsp"><img src="/Cos/cos/images/admin/admin_btn.jpg" width="305" height="43" /></a></td>
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
