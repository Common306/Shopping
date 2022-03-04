<%@page import="Model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="classify" class="DAL.ClassifyDBContext" scope="request" ></jsp:useBean>
<jsp:useBean id="category" class="DAL.CategoryDBContext" scope="request" ></jsp:useBean>
<% Account account = (Account) request.getSession().getAttribute("account"); %>

    <div class="header" style="margin-bottom: 50px">
        <div class="header-child">
            <div class="header-left">
                <a href="#" class="padding3020" id="menu-open">
                    CORE
                </a>
                <div class="sub-menu">
                    <ul class="sub-menu-list">
                    <c:forEach items="${classify.listClassify}" var="cl">
                        <li>
                            <a href="category?classify=${cl.classifyId}" class="sub-menu-list-header">${cl.classifyName}</a>
                            <ul>
                                <c:forEach items="${category.getListCategory(cl.classifyId)}" var="ca">
                                    <li><a href="category?classify=${cl.classifyId}&category=${ca.categoryId}" class="sub-menu-item">${ca.categoryName}</a></li>
                                </c:forEach>
                            </ul>
                        </li> 
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="header-middle">
            <a href="home.jsp" class="padding3020" style="display: inline">
                <img src="https://printgo.vn/uploads/media/772948/logo-thoi-trang-nam_1584632299.jpg" alt="logo" style="height: 78px">
            </a>
        </div>
        <div class="header-right">
            
            <%if (account == null) {%> 
                <form action="search" method="GET" style="display: inline-block">
                    <input type="text" placeholder="SEARCH" class="search" name="textSearch"/>              
                </form>
                <a href="account.jsp" class="padding3020">Tài Khoản</a>
            <%} else {%>

                <%if (!account.isManager()) {%>
                    <form action="search" method="GET" style="display: inline-block">
                        <input type="text" placeholder="SEARCH" class="search" name="textSearch"/>              
                    </form>
                    <a href="#" class="padding3020">Hello <%= account.getUsername()%></a>
                <%} else {%>
                    <a href="order" class="padding3020">Quản Lý Đơn Hàng</a>
                    <a href="manager.jsp" class="padding3020">Quản Lý Sản Phẩm</a>
                <%}%>
                
                <a href="signout">Sign out</a>
            <%}%>
            <a href="cart.jsp" class="padding3020">
                <i class="fas fa-shopping-cart"></i>
            </a>
        </div>
    </div>


</div>