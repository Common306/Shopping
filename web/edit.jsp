
<%@page import="Model.Account"%>
<%@page import="java.util.ArrayList"%>
<%@page import="Model.Category"%>
<%@page import="Model.Product"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/form.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
              integrity="sha512-9usAa10IRO0HhonpyAIVpjrylPvoDwiPUiKdWk5t3PyolY1cOd4DSE0Ga+ri4AuTroPR5aQvXU9xC6qOPnzFeg=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <% Product p = (Product) request.getAttribute("product");
            ArrayList<Category> listCategory = (ArrayList<Category>) request.getAttribute("listCategory");
        %>
        <% String error_name = "", error_price = "", error_img = "", error_desc = "";
            try {
                error_name = (String) request.getAttribute("error_name");
                error_price = (String) request.getAttribute("error_price");
                error_img = (String) request.getAttribute("error_img");
                error_desc = (String) request.getAttribute("error_desc");

            } catch (Exception e) {
            }
        %>
        <% Account account = (Account) request.getSession().getAttribute("account"); %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        <%if (account == null || !account.isManager()) {%>
        <p style="margin-left: 100px;color: red;">Access denied</p>
        <%} else if(account != null && account.isManager()) {%>
        <div class="form" >
            <form action="edit" method="POST">
                <div class="form-header">
                    <h3>Edit product</h3>
                </div>
                <div class="form-body">
                    <div>
                        <input type="hidden" name="pid" value="<%= p.getProductId()%>">
                    </div>
                    <div>
                        <label for="name" class="label">Name</label>
                        <input type="text" name="name" id="name" class="input" value="<%= p.getProductName()%>">
                        <%= error_name != null ? "<p class='error'>Fill must not be blank</p>" : ""%>
                    </div>
                    <div>
                        <label for="image" class="label">Image</label>
                        <input type="text" name="image" id="image" class="input" value="<%= p.getImage()%>">
                        <%= error_img != null ? "<p class='error'>Fill must not be blank</p>" : ""%>
                    </div>
                    <div>
                        <label for="price" class="label">Unit cost</label>
                        <input type="text" name="price" id="price" class="input"  value="<%= p.getUnitCost()%>">
                        <%= error_price != null ? "<p class='error'>Fill must not be blank and be a number</p>" : ""%>
                    </div>
                    <div>
                        <label for="desc" class="label">Description</label>
                        <textarea type="text" name="desc" id="desc" class="input" style="height:100px"><%= p.getDescription()%></textarea>
                        <%= error_desc != null ? "<p class='error'>Fill must not be blank</p>" : ""%>
                    </div>              
                    <div>
                        <label for="" class="label">Category</label>
                        <select name="category" id="" class="input">
                            <% for (Category c : listCategory) {%>  
                            <option <%= c.getCategoryId() == p.getCategory().getCategoryId() ? "selected" : ""%> value="<%= c.getCategoryId()%>"><%= c.getCategoryName()%></option>
                            <%}%>
                        </select>
                    </div>
                </div>
                <div class="form-footer">
                    <input type="submit" value="UPDATE" />
                </div>
            </form>
        </div>
        <%}%>

    </body>
</html>
