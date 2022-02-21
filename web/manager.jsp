
<%@page import="Model.Account"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Quản Lý</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/manager.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <jsp:useBean id="product" class="DAL.ProductDBContext" scope="request" ></jsp:useBean>

        <% Account account = (Account) request.getSession().getAttribute("account"); %>

    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%if (account == null || !account.isManager()) {%>
        <p style="margin-left: 100px;color: red;">Access denied</p>
        <%} else if(account != null && account.isManager()) {%>
        <div class="manager-container">
            <div class="manager-header">
                <h2>Manage Product</h2>
                <a href="add.jsp" id="add-btn">
                    + Add new product
                </a>
            </div>
            <div class="manager-body">
                <table border="1px">
                    <thead>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Image</th>
                    <th>Unit cost</th>
                    <th>Description</th>
                    <th>Category</th>
                    <th></th>
                    <th></th>
                    </thead>
                    <tbody>
                        <c:forEach items="${product.allProduct}" var="p">
                            <tr>
                                <td>${p.productId}</td>
                                <td>${p.productName}</td>
                                <td><img src="${p.image}" alt=""></td>
                                <td>${p.unitCost} VND</td>
                                <td>${p.description}</td>
                                <td>${p.category.categoryName}</td>
                                <td><a href="edit?id=${p.productId}"><i class="fa-solid fa-pen edit-btn"></i></a></td>
                                <td><a href="#" onclick="deleteProduct(${p.productId})"><i class="fa-solid fa-trash delete-btn"></i></a></td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <%}%>

        <script>
            function deleteProduct(id) {
                var rs = confirm("Do you want to delete this product?");
                if (rs) {
                    window.location.href = "delete?id=" + id;
                }
            }
        </script>
    </body>
</html>
