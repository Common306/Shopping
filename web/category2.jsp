
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Model.Product"%>
<%@page import="Model.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Classify"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Danh mục</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/category.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <% ArrayList<Product> listProduct = (ArrayList<Product>) request.getAttribute("listProduct");
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
            <div class="classify-container">
                <div class="list-product">

                <% for (Product p : listProduct) {
                %>
                <a href="#" class="product-item">
                    <img src="<%= p.getImage()%>" alt="" style="width: 324px;height: 518px;">
                    <p><%= p.getProductName()%></p>
                    <p><%= p.getUnitCost()%> VND</p>
                </a>
                <%}%>
            </div>
        </div>
    </body>
</html>
