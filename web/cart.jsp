

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.HashMap"%>
<%@page import="Model.Cart"%>
<%@page import="java.util.Map"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Giỏ hàng</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/cart.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <%
            ArrayList<Cart> listCart = (ArrayList<Cart>) request.getSession().getAttribute("listCart");
            int total = 0;
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%if (listCart == null) {%>
        <p style="margin-left: 100px">Giỏ hàng trống</p>
        <%} else {%>
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
                            <% for (Cart cart : listCart) {
                            %>
                            <tr>
                                <td class="remove">
                                    <a href="cart?idDelete=<%= cart.getProduct().getProductId()%>"> 
                                        <i class="far fa-times-circle"></i>
                                    </a>

                                </td>
                                <td class="img" style="text-align: center"><img src="<%= cart.getProduct().getImage()%>" alt="">
                                </td>
                                <td><%= cart.getProduct().getProductName()%></td>
                                <td style="text-align:center"><%= cart.getProduct().getUnitCost()%>VNĐ</td>
                                <td style="text-align:center">
                                    <%= cart.getQuantity()%>
                                </td>
                                <% total += cart.getProduct().getUnitCost() * cart.getQuantity();%>
                                <td style="text-align: center"><%= cart.getProduct().getUnitCost() * cart.getQuantity()%>VNĐ</td>
                            </tr>

                            <% }%>
                        </tbody>
                    </table>
                </form>
            </div>
            <div class="cart-container-right">
                <form action="pay.jsp">
                    <table >
                        <thead >
                        <th style="text-align:left;">Giỏ hàng</th>
                        <th></th>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Tổng tiền</td>
                                <td><%= total%> VND</td>
                            </tr>
                        </tbody>
                    </table>
                    <input type="submit" value="THANH TOÁN" />
                </form>
            </div>
        </div>
        <%}%>
    </body>
</html>
