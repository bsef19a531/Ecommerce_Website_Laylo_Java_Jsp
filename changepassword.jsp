<%String access = (String)session.getAttribute("access");%>
<%
    if(access == null)
    {
        session.setAttribute("message","Cannot Access without proper validation");

        response.sendRedirect("login.jsp");
    }
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
                    <div id="form-div">
                        <h1 class="text-center">
                            <img src="Images/changepassword.png" class="text-center">
                            <b>Forget Password</b>
                        </h1>
                            <form method = "post" action = "pswd" onsubmit="return (match_password())">
                                <%@include file = "Components/message/msg.jsp"%>
                                <p id="forget_para">Enter Your New Password here.</p>
                                <label>Password:</label><span id='error_password' class="error_input"></span><br>
                                <input type = "password" name = 'password' class="input-fields" id="password" onkeyup="match_password()"><br>
                                <label>Confirm Password:</label> <br>
                                <input type = "password" name = 'cnfrm-password' class="input-fields" id="cnfrm_password" onkeyup="match_password()"><br>
                                <div class="d-flex justify-content-end">
                                    <input type=submit value='Change' id="signup-btn">
                                </div>
                            </form>
                        </h1>
                    </div>
                </div>
                <div class="col-md-3"></div>
            </div>
        </div>
    </body>
</html>