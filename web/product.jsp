

<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/product.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <% Product p = (Product) request.getAttribute("product");%>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <form action="#" method="POST">
            <div class="product-container">
                <div class="product-container-left">
                    <img src="<%= p.getImage()%>" alt="">
                </div>
                <div class="product-container-right">
                    <p class="product-text1"><%= p.getProductName()%></p>
                    <p class="product-text1" style="margin-bottom: 25px"><%= p.getUnitCost()%> VNĐ</p>
                    <p class="product-text2">
                        <%= p.getDescription()%>
                    </p>
                    <div>
                        <input type="number" value="1" min="0" class="product-quantity" name="quantity"/>
                        <input type="submit" value="THÊM VÀO GIỎ" class="add-product"/>
                    </div>
                </div>
            </div>
        </form>
    </body>
</html>
