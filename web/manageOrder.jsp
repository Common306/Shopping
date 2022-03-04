
<%@page import="Model.Account"%>
<%@page import="Model.Order"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Đơn hàng</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/manageOrder.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <%  ArrayList<Order> listOrder = (ArrayList<Order>) request.getAttribute("listOrder"); 
            Account account = (Account) request.getSession().getAttribute("account");
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%if (account == null || !account.isManager()) {%>
            <p style="margin-left: 100px;color: red;">Access denied</p>
        <%} else if (account != null && account.isManager()) {%>

            <%if (listOrder.isEmpty()) {
            %>
                <p style="margin-left: 100px;">Hiện tại không có đơn hàng nào</p>
            <%} else {%>
                <div class="manager-order-container">
                    <table border="1px">
                        <tr>
                            <td>Date</td>
                            <td>Time</td>
                            <td>Name</td>
                            <td>Phone</td>
                            <td>Address</td>
                            <td>Name Product</td>
                            <td>Image</td>
                            <td>Price</td>
                            <td>Quantity</td>
                            <td>Total price</td>
                            <td></td>
                        </tr>
                        <% for (Order o : listOrder) {
                        %>

                        <tr>
                            <td><%= o.getDate()%></td>
                            <td><%= o.getTime()%></td>
                            <td><%= o.getName()%></td>
                            <td><%= o.getPhone()%></td>
                            <td class="address"><%= o.getAddress()%></td>
                            <td class="name-product"><%= o.getProduct().getProductName()%></td>
                            <td><img src="<%= o.getProduct().getImage()%>" class="manager-img-product"></td>
                            <td><%= o.getProduct().getUnitCost()%> VND</td>
                            <td><%= o.getQuantity()%></td>
                            <% int totalPrice = o.getProduct().getUnitCost() * o.getQuantity();%>
                            <td> <%= totalPrice%> VND</td>
                            <td><a href="confirm?id=<%= o.getOrderId()%>">Xác nhận</a></td>
                        </tr>

                        <%}%>

                    </table>
                </div>
            <%}%>
        <%}%>
    </body>
</html>
