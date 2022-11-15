<%@page import="javaFiles.User"%>
<%
    User user = (User)session.getAttribute("current_user");

    if(user == null)
    {
        session.setAttribute("message","You must Login before Checking Out");

        response.sendRedirect("login.jsp");
    }
%>

<%@page contentType = "text/html" pageEncoding ='utf-8'%>

<!DOCTYPE html>
<html lang='en-US'>
    <head>
        <%@include file = "Components/title/title_info.jsp"%>
        <link rel="stylesheet" href="Style/index.css">
        <link rel="stylesheet" href="Style/Signup.css">
        <link rel="stylesheet" href="Style/cart.css">
        <script src="Script/checkout.js"></script>
    </head>
    <body onload="pageCart()">
        <%@include file = "Components/navBar/navbar.jsp"%>
        <%@include file = "Components/message/msg.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-6" id="table-out">
                    <div class="text-center">
                        <h1 >Checkout Items</h1>
                    <form method="post" action="check" id="bill-form">
                        
                        <div id ="cart-body">
                            
                        </div>
                        
                    </form>
                    </div>
                </div>
                <div class="col-md-6">
                    <div>
                        <h1 class="text-center">Customer Details</h1>
                    <div id="form_bg">
                        <form method="POST" action="check" id="customer-form">
                            <label>Name:</label><br>
                            <input type = "text" name = 'name' id = 'name_field' class="input-fields" placeholder="Order Reciever Name" required><br>
                            <label>Address:</label><br>
                            <input type = "text" name = 'address' class="input-fields" id="address_field" placeholder="Order Destination" required><br>
                            <div class="d-flex justify-content-end">
                                <input type="button" value='Order' id="signup-btn" onclick="submitForms()">
                            </div>
                        </form>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>