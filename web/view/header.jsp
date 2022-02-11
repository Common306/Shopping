<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:useBean id="classify" class="DAL.ClassifyDBContext" scope="request" ></jsp:useBean>

    <div class="header">
        <div class="header-child">
            <div class="header-left">
                <a href="#" class="padding3020" id="menu-open">
                    CORE
                </a>
                <div class="sub-menu">
                    <ul class="sub-menu-list">
                    <c:forEach items="${classify.listClassify}" var="cl">
                        <li>
                            <a href="#" class="sub-menu-list-header">${cl.classifyName}</a>
                            <ul>
                                <li><a href="#" class="sub-menu-item">Áo sweater</a></li>
                                <li><a href="#" class="sub-menu-item">Áo sweater</a></li>
                                <li><a href="#" class="sub-menu-item">Áo sweater</a></li>
                                <li><a href="#" class="sub-menu-item">Áo sweater</a></li>
                                <li><a href="#" class="sub-menu-item">Áo sweater</a></li>
                            </ul>
                        </li> 
                    </c:forEach>
                </ul>
            </div>
        </div>
        <div class="header-middle">
            <a href="#" class="padding3020" style="display: inline">
                <img src="https://printgo.vn/uploads/media/772948/logo-thoi-trang-nam_1584632299.jpg" alt="logo" style="height: 78px">
            </a>
        </div>
        <div class="header-right">
            <input type="text" placeholder="SEARCH" class="search"/>
            <a href="#" class="padding3020">Tài Khoản</a>
            <a href="#" class="padding3020">
                <i class="fas fa-shopping-cart"></i>
            </a>
        </div>
    </div>


</div>