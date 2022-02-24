
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
            int pageIndex = (Integer) request.getAttribute("pageIndex");
            int numPage = (Integer) request.getAttribute("numPage");
            String textSearch = (String) request.getAttribute("textSearch");
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <% if (listProduct.isEmpty()) {
        %>
        <p style="margin: 50px 100px;">Không có sản phẩm nào</p>
        <%} else {%>
        <div class="classify-container">
            <div class="list-product">

                <% for (Product p : listProduct) {
                %>
                <a href="product?productId=<%= p.getProductId()%>" class="product-item">
                    <img src="<%= p.getImage()%>" alt="" style="width: 324px;height: 518px;">
                    <p><%= p.getProductName()%></p>
                    <p><%= p.getUnitCost()%> VND</p>
                </a>
                <%}%>
            </div>
        </div>
        <div style="text-align: center; margin-bottom: 50px">
            Page: <input id="page" style="width: 50px" type="number" value="<%= pageIndex%>" min="1" max="<%= numPage%>"> / <%= numPage%>
        </div>

        <script>
            var txt = "${textSearch}";
            var page = document.getElementById("page");

            page.addEventListener("keyup", function (event) {
                if (event.keyCode === 13) {
                    event.preventDefault();
                    window.location.href = "search?textSearch=" + txt + "&page=" + page.value;
                }
            });

            page.addEventListener("change", function () {
                window.location.href = "search?textSearch=" + txt + "&page=" + page.value;
            });

        </script>
        <%}%>
    </body>
</html>
