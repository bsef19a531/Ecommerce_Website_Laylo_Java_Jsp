<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javaFiles.Category"%>
<%@page import="javaFiles.Product"%>
<%@page import="javaFiles.User"%>
<%
    User user1 = (User)session.getAttribute("current_user");
%>
<%
  String uri = request.getRequestURI();
	String pageName = uri.substring(uri.lastIndexOf("/")+1);
%>

<%
    String order = (String)session.getAttribute("order");
    if(order != null)
    { %>
      <script>
        clearCart();
      </script>
<%
      session.removeAttribute("order");
    }
%>

<%@include file ="../cartModal/cart_modal.jsp"%>
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container-fluid">
      <div id = "logo_container">
        <span class="navbar-brand">
            <img src = "Images/Logo/Laylo_logo.png" id="ecom_logo">
        </span>
     </div>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#mynavbar">
        
        <span class="navbar-toggler-icon">
          <img src="Images/Logo/hamburger.png" style="height: 30px;">
        </span>
      </button>
      <div class="collapse navbar-collapse" id="mynavbar">
        <ul class="navbar-nav me-auto">
          <li class="nav-item">
            <a class="nav-link" href="index.jsp">Home</a>
          </li>
          <%if(user1 != null){%>
          <li class="nav-item">
            <a class="nav-link" <%if(user1.email.equals("admin@laylo.com")){%> href="admin.jsp" <%} else{%> href="normal.jsp"<%}%> >Profile</a>
          </li>
          <%}%>
          <%
                  String dbAdd = getServletContext().getInitParameter("DataBaseAddress");
                  String dbDr = getServletContext().getInitParameter("DataBaseDriver");
                  List<String> productCategory = new ArrayList<String>(); 
                  productCategory = Category.getCategory(dbAdd,dbDr);
          %>
          <%if(user1 != null){%>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">Categories</a>
            <ul class="dropdown-menu">
              <li><a class = "dropdown-item" href="index.jsp?category=all" id="category_option">All</a></li>
              <%
                for (String cat : productCategory) {
                %>
                <li><a class="dropdown-item" href="index.jsp?category=<%=cat%>" id="category_option"><%=cat%></a></li>
                <%}%>
          </ul>
          </li>
          <%}%>
          <li class="nav-item">
            <a class="nav-link" href="#" data-bs-toggle="modal" data-bs-target="#cart-modal">MyCart</a>
          </li>
          <div>
            <img src="Images/cart.png" id="cart-icon">
            <span style="font-size: 25px; color:white;">(<span id="cart-number"></span>)</span>
          </div>
        </ul>
        <script>updateCart()</script>
        <!--<form class="d-flex">
          <input class="form-control me-2" type="text" placeholder="Search" id="search_bar">
          <button class="btn" type="button" id="search_button">Search</button>
        </form>-->
        <li class="nav-item d-flex justify-content-end">
          <%
            if(user1 == null)
            {  
              if(pageName.equals("signup.jsp") || pageName.equals("forget.jsp")){
          %>
              <a class="nav-link" href="login.jsp">Login</a>
          <% }
              else  { 
          %>
              <a class="nav-link" href="signup.jsp">Signup</a>
          <%  }
              
            } 
              else { 
          %>
                    <a class="nav-link" href="Logout">Logout</a>

          <%
                  }
          %>

        </li>
      </div>
    </div>
  </nav>
  
 