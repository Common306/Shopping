

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="../css/home.css">
        <link rel="stylesheet" href="../css/cart.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <div class="cart-container">
            <h1 class="title">Giỏ hàng</h1>
            <div class="cart-container-left">
                <form action="">
                    <table >
                        <thead >
                            <tr>
                                <th></th>
                                <th></th>
                                <th>Sản phẩm</th>
                                <th>Giá</th>
                                <th>Số lượng</th>
                                <th>Tổng tiền</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="remove">
                                    <i class="far fa-times-circle"></i>
                                </td>
                                <td class="img"><img src="https://hanoiriot.com/wp-content/uploads/2021/12/DSCF0979-324x518.jpeg" alt="">
                                </td>
                                <td>H0008 – Hoodie – Core visual ver 2.0 – M</td>
                                <td>460.000VNĐ</td>
                                <td style="text-align:center">
                                    <input type="number" value="1" min="0"/>
                                </td>
                                <td>460.000VNĐ</td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" value="CẬP NHẬT GIỎ HÀNG" id="updateBtn"/>
                </form>
            </div>
            <div class="cart-container-right">
                <form action="">
                    <table >
                        <thead >
                        <th style="text-align:left;">Giỏ hàng</th>
                        <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Tổng tiền</td>
                                <td>460.000 VNĐ</td>
                            </tr>
                            <tr>
                                <td>Total</td>
                                <td>460.000 VNĐ</td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" value="THANH TOÁN" />
                </form>
            </div>
        </div>
    </body>
</html>
