<%@page contentType = "text/html" pageEncoding ='utf-8'%>

<!DOC TYPE html>
<html land='en'>
    <head>
        <%@include file = "Components/title/title_info.jsp"%>
        <link rel="stylesheet" href="Style/Signup.css">
        <script src='Script/Signup.js'></script>
    </head>
    <body id='body_div'>
        <%@include file = "Components/navBar/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-3"></div>
                <div class='col-md-6'>
                    <div id="form-div">
                        <h1 class="text-center">
                            <img src="Images/login1.png" class="text-center">
                            <b>Login</b>
                        </h1>
                        <form method = "post" action = "log" onsubmit="return validate_login()">
                            <%@include file = "Components/message/msg.jsp"%>
                            <label>Email:</label><span id='error_email' class="error_input"></span><br>
                            <input type = "text" name = 'email' id = 'email' class="input-fields"><br>
                            <label>Password:</label><span id='error_password' class="error_input"></span><br>
                            <input type = "password" name = 'password' class="input-fields" id="password"><br>
                            <a href="forget.jsp" class="d-flex justify-content-end" id="forget_link">Forgot Password?</a>
                            <div class="d-flex justify-content-end">
                                <input type="submit" value='Login' id="signup-btn">
                            </div>
                        </form>
                    </div>
                </div>
                <div class='col-md-3'></div>
            </div>
        </div>
    </body>
</html>