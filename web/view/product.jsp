

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sản phẩm</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="../css/home.css">
        <link rel="stylesheet" href="../css/product.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <div class="product-container">
            <div class="product-container-left">
                <img src="https://hanoiriot.com/wp-content/uploads/2021/12/DSCF0979.jpeg" alt="">
            </div>
            <div class="product-container-right">
                <p class="product-text1">H0008 – Hoodie – Core visual ver 2.0</p>
                <p class="product-text1" style="margin-bottom: 25px">460.000VNĐ</p>
                <p class="product-text2">
                    – Trọng lượng vải 360grm
                    <br>
                    – Chất liệu: Nỉ bông
                    <br>
                    – Có các đường trang trí dọc 2 tay áo & giữa lưng
                    <br>
                    – Cổ tay áo và vạt áo đều là viền vải trang trí
                </p>
                <div>
                    <input type="number" value="1" min="0" class="product-quantity"/>
                    <a href="#" class="add-product">THÊM VÀO GIỎ</a>
                </div>
            </div>
        </div>
    </body>
</html>
