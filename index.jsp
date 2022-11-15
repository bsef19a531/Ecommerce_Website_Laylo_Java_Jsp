<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="javaFiles.Category"%>
<%@page import="javaFiles.Product"%>


<%
    String dbAddress = getServletContext().getInitParameter("DataBaseAddress");
    String dbDriver = getServletContext().getInitParameter("DataBaseDriver");
%>

<%@page contentType = "text/html" pageEncoding ='utf-8'%>

<!DOCTYPE html>
<html lang='en-US'>
    <head>
        <%@include file = "Components/title/title_info.jsp"%>
        <link rel="stylesheet" href="Style/index.css">
    </head>
    <body style="margin: 80px 10px 10px 10px;">
            <%@include file = "Components/navBar/navbar.jsp"%>
            <%@include file = "Components/message/msg.jsp"%>
            <div class="container-fluid">
            <div class="row">
                <%
                    for (Object product : Product.getProducts(dbAddress,dbDriver) )
                    { if(!(((Product)(product)).quantity.equals("0"))){ %>
                        <div class="col-md-3">
                            <div class="card card_boundary">
                                <div class="text-center">
                                <img src="Images/productImages/<%=((Product)(product)).img%>" alt="..." class="img_card">
                                </div>
                                <div class="card-body">
                                    <h5 class="card-title title_card" ><%=((Product)(product)).name%></h5>
                                    <p class="card-text desc_card">
                                       <%
                                            String desc = (String)(((Product)(product)).description); 
                                            if(desc.length()< 50)
                                            {
                                                int i = 50 - desc.length();
                                                while(i > 0)
                                                {
                                                    desc += ".";     
                                                    i--;                                           
                                                }
                                            }
                                            else
                                            {
                                                desc = desc.substring(0,50);
                                                desc += "...";
                                            }
                                       %>

                                       <%=desc%>

                                    </p>
                            </div>
                            <div class="footer footer_card">
                                
                                <span><%
                                    if(((Product)(product)).discount.equals("0"))
                                    {%>
                                    
                                        <span id = "price_box" class="btn">Rs <%=((Product)(product)).price%></span>
                                    
                                    <%}
                                    else{
                                        int price = Integer.parseInt(((Product)(product)).price);
                                        int discount = Integer.parseInt(((Product)(product)).price) - Integer.parseInt(((Product)(product)).discount);
                                        double discountedPrice = (Float.parseFloat(((Product)(product)).discount)/Float.parseFloat(((Product)(product)).price))*100;
                                        discountedPrice =  Math.round(discountedPrice * 100.0) / 100.0;
                                        %>
                                        
                                           <table>
                                               <tr>
                                               <td>Rs  <strike> <%=price%> </strike> &nbsp;</td>
                                               </tr>
                                               <tr>
                                                <td><%=discountedPrice%>% Off &nbsp;</td>
                                                </tr>
                                            </table>
                                          <span class="btn" id = "price_box"> Rs <%=discount%> </span>
                                          
                                    <%}%>
                                </span>
                            
                                <a class="btn cart_btn" onclick="addToCart('<%=((Product)(product)).name%>' , <%=(Integer.parseInt(((Product)(product)).price) - Integer.parseInt(((Product)(product)).discount))%> , <%=((Product)(product)).quantity%> ); updateCart() ">Add to Cart</a>
                            </div>
                            </div>
                            </div>
                    <%}}%>
            </div>
            </div>

            <div id="snackbar"></div>
    </body>
</html>