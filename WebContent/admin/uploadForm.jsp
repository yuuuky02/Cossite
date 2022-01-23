<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*,my.util.*,my.dao.*,my.model.*,java.util.*" %>
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
            <li><a href="/Cos/cos/in/womenin1.jsp?pcategory=여성아우터웨어">아우터웨어</a></li>
            <li><a href="/Cos/cos/in/womenin2.jsp?pcategory=여성니트웨어">니트웨어</a></li>
            <li><a href="/Cos/cos/in/womenin3.jsp?pcategory=여성셔츠">셔츠</a></li>
            <li><a href="/Cos/cos/in/womenin4.jsp?pcategory=여성드레스">드레스</a></li>
          </ul>
        </li>
        <li><a href="/Cos/cos/in/men_pin.jsp" class="MenuBarItemSubmenu">Men</a>
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
        <div class="pms2"><a href="/Cos/login/admin.jsp"><%=session.getAttribute("LOGINID") %> COS</a></div>
        <div class="pms2"><a href="/Cos/login/logout.jsp">로그아웃</a></div>
        <div class="pms2"><a href="wishlist.html">위시리스트</a></div>
        <div class="pms2"><a href="cart.html">장바구니</a></div>
      </div>
    </div>
  </div>
  <div id="main">
    <div class="upload">
     <form action="upload.jsp" method="post" enctype="multipart/form-data" name="form1">
      <table width="420" height="457" border="0" cellpadding="3" cellspacing="2" id="uploadtable">
        <tr>
          <td height="75" colspan="2"><strong>상품등록</strong></td>
        </tr>
        <tr>
          <td width="111" height="60">상품명</td>
          <td width="291" id="uploadtable"><input type="text" name="pname" id="product" /></td>
        </tr>
        <tr>
          <td width="111" height="60">상품가격</td>
          <td id="uploadtable"><input type="text" name="price" id="product" /></td>
        </tr>
        <tr>
          <td width="111" height="60">성별</td>
          <td id="uploadtable">
            <p>
              <label>
                <input name="pgender" type="radio" id="pgender_0" value="여" checked="checked" />
                여성</label>
              <label>
                <input type="radio" name="pgender" value="남" id="pgender_1" />
                남성</label>
            </p>
          </td>
        </tr>
        <tr>
          <td width="111" height="60">상품분류</td>
          <td id="uploadtable"><select name="pcategory" id="product">
            <option value="여성아우터웨어" selected="selected">여성아우터웨어</option>
            <option value="남성니트웨어">남성아우터웨어</option>
            <option value="여성니트웨어">여성니트웨어</option>
            <option value="남성니트웨어">남성니트웨어</option>
            <option value="여성드레스">여성드레스</option>
            <option value="남성트라우저">남성트라우저</option>
          </select></td>
        </tr>
        <tr>
          <td width="111" height="60">상품종류</td>
          <td id="uploadtable"><select name="psort" id="product">
            <option value="여성재킷" selected="selected">여성 재킷</option>
            <option value="여성코트">여성 코트</option>
            <option value="남성재킷">남성 재킷</option>
            <option value="남성코트">남성 코트</option>
            <option value="여성가디건">여성 가디건</option>
            <option value="여성베스트">여성 베스트</option>
            <option value="남성가디건">남성 가디건</option>
            <option value="남성베스트">남성 베스트</option>
            <option value="여성블라우스">여성 블라우스</option>
            <option value="여성셔츠드레스">여성 셔츠 드레스</option>
            <option value="남성셔츠재킷">남성 셔츠 재킷</option>
            <option value="남성릭랙스드핏셔츠">남성 릭랙스드 핏 셔츠</option>
            <option value="여성니트드레스">여성 니트 드레스</option>
            <option value="여성슬리브리스드레스">여성 슬리브리스 드레스</option>
            <option value="남성레귤러핏트라우저">남성 레귤러 핏 트라우저</option>
            <option value="남성릭랙스드핏트라우저">남성 릭랙스드 핏 트라우저</option>
          </select></td>
        </tr>
        <tr>
          <td width="111" height="60">상품이미지</td>
          <td id="uploadtable"><input type="file" name="pimage" id="pimage" /></td>
        </tr>
        <tr>
          <td height="118" colspan="2"><p>
            <input type="submit" name="yes" id="yes" value="" /> 
            <input type="reset" name="no" id="no" value="" />
          </p></td>
        </tr>
      </table>
     </form>
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
