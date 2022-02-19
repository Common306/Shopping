

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="css/home.css">
        <link rel="stylesheet" href="css/account.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
        <%  Object errorWrong = request.getAttribute("errorWrong");
            errorWrong = errorWrong == null ? "" : errorWrong;
            
            Object errorUserLogin = request.getAttribute("errorUserLogin");
            errorUserLogin = errorUserLogin == null ? "" : errorUserLogin;
            
            Object errorPassLogin = request.getAttribute("errorPassLogin");
            errorPassLogin = errorPassLogin == null ? "" : errorPassLogin;
            
            Object errorUserRegis = request.getAttribute("errorUserRegis");
            errorUserRegis = errorUserRegis == null ? "" : errorUserRegis;
            
            Object errorPassRegis = request.getAttribute("errorPassRegis");
            errorPassRegis = errorPassRegis == null ? "" : errorPassRegis;
            
            Object errorRePassRegis = request.getAttribute("errorRePassRegis");
            errorRePassRegis = errorRePassRegis == null ? "" : errorRePassRegis;
            
            Object errorExist = request.getAttribute("errorExist");
            errorExist = errorExist == null ? "" : errorExist;
        %>
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <div class="account-container">
                <h1 class="title">Tài khoản</h1>
                <form action="login" method="POST" style="width: 50%">
                    <div class="account-container-child">
                        <h2 class="title2">Đăng nhập</h2>
                        <div class="account-form">
                            <label for="username-login">Tên đăng nhập *</label>
                            <input type="text" id="username-login" name="usernameLogin"/>
                            <p style="color: red"><%= errorUserLogin %></p>
                        </div>
                        <div class="account-form">
                            <label for="password-login">Mật khẩu *</label>
                            <input type="password" id="password-login" name="passwordLogin"/>
                            <p style="color: red"><%= errorPassLogin %></p>
                        </div>
                        <p style="color: red"><%= errorWrong %></p>
                    <div class="account-form2">
                        <input type="checkbox" id="remember" name="remember"/>
                        <label for="remember">Lưu đăng nhập</label>
                    </div>
                    <input type="submit" value="Đăng nhập"/>
                </div>
            </form>
            <form action="register" method="POST" style="width: 50%">
                <div class="account-container-child">
                    <h2 class="title2">Đăng ký</h2>
                    <div class="account-form">
                        <label for="username-regis">Tên đăng nhập *</label>
                        <input type="text" id="username-regis" name="usernameRegister"/>
                        <p style="color: red"><%= errorUserRegis %></p>
                    </div>
                    <div class="account-form">
                        <label for="phone-regis">Mật khẩu *</label>
                        <input type="password" id="phone-regis" name="passwordRegister"/>
                        <p style="color: red"><%= errorPassRegis %></p>
                    </div>
                    <div class="account-form">
                        <label for="password-regis">Nhập lại mật khẩu *</label>
                        <input type="password" id="password-regis" name="re-password"/>
                        <p style="color: red"><%= errorRePassRegis %></p>
                    </div>
                    <p style="color: red"><%= errorExist %></p>
                    <input type="submit" value="Đăng ký"/>
                </div>
            </form>
        </div>
    </body>
</html>
