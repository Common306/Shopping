

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Thanh toán</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/pay.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <% String error_name = "", error_phone = "", error_address = "";
            try {
                error_name = (String) request.getAttribute("errorName");
                error_phone = (String) request.getAttribute("errorPhone");
                error_address = (String) request.getAttribute("errorAddress");
            } catch (Exception e) {
            }
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <div class="pay-container">
            <form action="pay" method="POST">
                <h2 class="title">Địa chỉ giao hàng</h2>
                <div class="form-info">
                    <div>
                        <label for="name">Tên *</label>
                        <input type="text" id="name" name="name"/>
                        <%= error_name != null ? "<p class='error'>Fill must not be blank</p>" : ""%>
                    </div>
                    <div>
                        <label for="phone">SĐT *</label>
                        <input type="text" id="phone" name="phone"/>
                        <%= error_phone != null ? "<p class='error'>Fill must not be blank</p>" : ""%>
                    </div>
                    <div>
                        <label for="address">Địa chỉ *</label>
                        <input type="text" id="address" name="address"/>
                        <%= error_address != null ? "<p class='error'>Fill must not be blank</p>" : ""%>
                    </div>
                </div>
                <input type="submit" value="Thanh toán">
            </form>
        </div>
    </body>
</html>
