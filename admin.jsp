<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javaFiles.Category"%>
<%@page import="javaFiles.User"%>
<%@page import="javaFiles.Product"%>
<%
    User user = (User)session.getAttribute("current_user");

    if(user == null)
    {
        session.setAttribute("message","Access Denied without Proper Authentication");

        response.sendRedirect("login.jsp");
    }
    else
    {
        if(user.role.equals("1"))
        {
            session.setAttribute("message","Your are not Admin, Only admin is allowed here");
            response.sendRedirect("login.jsp");
        }
    }
%>

<%@page contentType = "text/html" pageEncoding ='utf-8'%>

<!DOCTYPE html>
<html land='en'>
    <head>
        
        <%@include file = "Components/title/title_info.jsp"%>
        <link rel="stylesheet" href="Style/admin.css">
        <!--<script src='Script/Signup.js'></script>-->
        
    </head>
        <body id='body_div'>
            <%@include file = "Components/navBar/navbar.jsp"%>
            <%@include file = "Components/message/msg.jsp"%>
            <div class="container">
                <div class="row">
                    <div class="col-sm-4">
                        <div class="tabs ">
                            <img src="Images/Admin/users.png" class="card_imgs">
                            <h2>Users</h2>
                            <h2 class="card_numbers"><%=(User.getTotalUsers(dbAdd, dbDr))-1%></h2>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="tabs">
                            <img src="Images/Admin/categories.png" class="card_imgs">
                            <h2>Categories</h2>
                            <h2 class="card_numbers"><%=productCategory.size()%></h2>
                        </div>
                    </div>
                    <div class="col-sm-4">
                        <div class="tabs">
                            <img src="Images/Admin/product.png" class="card_imgs">
                            <h2>Products</h2>
                            <h2 class="card_numbers"><%=Product.getProducts(dbAdd,dbDr).size()%></h2>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-6">
                        <div class="tabs" data-bs-toggle="modal" data-bs-target="#add_categories" >
                            <img src="Images/Admin/add-category.png" class="card_imgs">
                            <h2>Add Category</h2>
                            <h6 class="card_numbers">Click here to add new Category</h6>
                        </div>
                    </div>
                    <div class="col-sm-6">
                        <div class="tabs" data-bs-toggle="modal" data-bs-target="#add_products">
                            <img src="Images/Admin/add-product.png" class="card_imgs">
                            <h2>Add-Product</h2>
                            <h6 class="card_numbers">Click here to add new Product</h6>
                        </div>
                    </div>
                </div>
            </div>
            <%@include file = "Components/addCategories/add_categories.jsp" %>
            <%@include file = "Components/addCategories/add_product.jsp" %>
    </body>
</html>