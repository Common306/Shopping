

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tài khoản</title>
        <style>
            @import url('https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400&display=swap');
        </style>
        <link rel="stylesheet" href="../css/home.css">
        <link rel="stylesheet" href="../css/account.css">

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
              integrity="sha512-Fo3rlrZj/k7ujTnHg4CGR2D7kSs0v4LLanw2qksYuRlEzO+tcaEPQogQ0KaoGN26/zrn20ImR1DfuLWnOo7aBA=="
              crossorigin="anonymous" referrerpolicy="no-referrer" />
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>

        <div class="account-container">
            <h1 class="title">Tài khoản</h1>
            <div class="account-container-child">
                <h2 class="title2">Đăng nhập</h2>
                <div class="account-form">
                    <label for="username-login">Tên đăng nhập hoặc địa chỉ Email *</label>
                    <input type="text" id="username-login"/>
                </div>
                <div class="account-form">
                    <label for="password-login">Mật khẩu *</label>
                    <input type="text" id="password-login"/>
                </div>
                <div class="account-form2">
                    <input type="checkbox" id="remember"/>
                    <label for="remember">Lưu đăng nhập</label>
                </div>
                <input type="submit" value="Đăng nhập"/>
            </div>
            <div class="account-container-child">
                <h2 class="title2">Đăng ký</h2>
                <div class="account-form">
                    <label for="username-regis">Địa chỉ email *</label>
                    <input type="text" id="username-regis"/>
                </div>
                <div class="account-form">
                    <label for="phone-regis">Số điện thoại *</label>
                    <input type="text" id="phone-regis"/>
                </div>
                <div class="account-form">
                    <label for="password-regis">Mật khẩu *</label>
                    <input type="text" id="password-regis"/>
                </div>
                <input type="submit" value="Đăng ký"/>
            </div>
        </div>
    </body>
</html>
