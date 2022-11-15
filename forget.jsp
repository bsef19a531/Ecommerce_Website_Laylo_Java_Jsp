<%
    String rand = (String)session.getAttribute("resetCode");
    String check = (String)session.getAttribute("success");

%>

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
                <div class="col-md-6">

                <%if(check == null) {%>
                <div id="form-div">
                    <h1 class="text-center">
                        <img src="Images/forgetpassword.png" class="text-center">
                        <b>Forget Password</b>
                    </h1>
                        <form method = "post" action = "frgt" onsubmit="return email_validator()">
                            <%@include file = "Components/message/msg.jsp"%>
                            <p id="forget_para">Enter Your Email in the Field given below.You will recieve a Password reset code on your Registered Email Address.</p>
                            <label>Email:</label><span id='error_email' class="error_input"></span><br>
                            <input type = "text" name = 'email' id = 'email' class="input-fields"><br>
                            <div class="d-flex justify-content-end">
                                <span id="spin_loader"></span>
                                <input type=submit value='Send Mail' id="signup-btn" onclick="load_spinner()">
                            </div>
                        </form>
                    </h1>
                </div>
                <%} else{%>


                <div id="form-div">
                    <h1 class="text-center">
                        <img src="Images/forgetpassword.png" class="text-center">
                        <b>Forget Password</b>
                    </h1>
                        <form method = "post" action = "rcp">
                            <%@include file = "Components/message/msg.jsp"%>
                            <p id="forget_para">Enter Your Reset Code recieved on Email.</p>
                            <label>Code:</label>
                            <input type = "text" name = 'code' id = 'code' class="input-fields" onkeypress='return printNumber(event)'><br>
                            <div class="d-flex justify-content-end">
                                <span id="spin_loader"></span>
                                <input type=submit value='Submit' id="signup-btn" onclick="load_spinner()">
                            </div>
                            
                            <a href="forget.jsp" class="d-flex justify-content-end" id="forget_link">Submit Another email</a>
                        </form>
                    </h1>
                </div>

                <%}%>

                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </body>
</html>
<%
    session.removeAttribute("success");
%>