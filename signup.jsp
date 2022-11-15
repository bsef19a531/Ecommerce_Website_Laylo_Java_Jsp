<%@page contentType = "text/html" pageEncoding ='utf-8'%>

<!DOCTYPE html>
<html lang='en'>
    <head>
        <%@include file = "Components/title/title_info.jsp"%>
        <link rel="stylesheet" href="Style/Signup.css">
        <script src='Script/Signup.js'></script>

    </head>
    <body id='body_div'>
        <%@include file = "Components/navBar/navbar.jsp"%>
        <div class='container-fluid'>
            <div class="row">
            <div class='col-md-3'></div>
            <div class='col-md-6'>
                <div id="form-div">
                    
                    <h1 class="text-center">
                        <img src="Images/signup.png" class="text-center">
                        <b>SignUp</b>
                    </h1>
                    <form method="post" action="sign" onsubmit="return validate_form()">
                        <%@include file = "Components/message/msg.jsp"%>
                        <label>User Name:</label><span id='error_name' class="error_input"></span><br> 
                        <input type = "text" name = 'userName' id="userName" class="input-fields" onblur="name_validate()"> <br>
                        <label>Email:</label><span id='error_email' class="error_input"></span><br>
                        <input type = "text" name = 'email' id = 'email' class="input-fields"><br>
                        <label>Password:</label><span id='error_password' class="error_input"></span><br>
                        <input type = "password" name = 'password' class="input-fields" id="password" onkeyup="match_password()"><br>
                        <label>Confirm Password:</label> <br>
                        <input type = "password" name = 'cnfrm-password' class="input-fields" id="cnfrm_password" onkeyup="match_password()"><br>
                        <label>Phone:</label><span id='error_phone' class="error_input"></span><br>
                        <input type = "text" name = 'phone'  id = 'phone' class="input-fields" onkeypress='return printNumber(event)'><br>
                        <label>Address:</label><span id='error_address' class="error_input"></span><br>
                        <input type = "text-area" name = 'address' id = 'address' class="input-fields"><br>
                        <div class="d-flex justify-content-end">
                            <input type=submit value='Signup' id="signup-btn">
                        </div>
                    </form>
                </div>
            </div>
            <div class='col-md-3'></div>
            </div>
        </div>
    </body>
</html>