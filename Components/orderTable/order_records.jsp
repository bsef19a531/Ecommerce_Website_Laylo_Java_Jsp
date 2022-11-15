<%@page import="javaFiles.Order"%>
<%@page import="javaFiles.OrderDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>


<% if(OrderDAO.getOrder(user.email, dbAdd, dbDr).size() != 0){        
    int idCount = 0;%>
<div class="table-responsive mb-4">
    <table class="table">
    <thead id="table_head">
        <tr>
            <th>Date</th>
            <th>Reciever</th>
            <th>Address</th>
            <th>Items</th>
            <th>Quantity</th>
            <th>Price</th>
            <th>SubTotal</th>
        </tr>
    </thead>
<%
    String name, address, date,items, quantity, price;
    for(Object odr : OrderDAO.getOrder(user.email, dbAdd, dbDr))
    {
       name = ((Order)odr).name;
       address = ((Order)odr).address;
       date = ((Order)odr).date;
       items = ((Order)odr).items;
       quantity = ((Order)odr).quantity;
       price = ((Order)odr).price;

       String[] tmp = items.split(",");
       String[] qty = quantity.split(",");
       String[] pr = price.split(",");
       int sub = 0; 
       int bill = 0;
%>
        
            <tbody id="table_body">
                <tr>
                    <td rowspan="<%=tmp.length+1%>"><%=date%></td>
                    <td rowspan="<%=tmp.length+1%>"><%=name%></td>
                    <td rowspan="<%=tmp.length+1%>"><%=address%></td>
                </tr>
                
                    <% for(int i =0; i < tmp.length; i++)
                    {%>
                    <tr>
                        <td >
                            
                            <%=tmp[i]%>
                            
                        </td>
                        <td >
                            
                            <%=qty[i]%>
                        </td>
                        <td >
                            <%=pr[i]%>
                        </td>
                        <td >
                            <%=Integer.parseInt(pr[i])*Integer.parseInt(qty[i])%>
                            <%
                                bill+= Integer.parseInt(pr[i])*Integer.parseInt(qty[i]);
                            %>
                        </td>
                    
                    </tr>
                    <%}
                    


                    %>
        <tr>
                    <td id="table-bottom-info">Mode: COD</td>
                    <td id="table-bottom-info" >Status: <span id="status<%=idCount%>" ></span> </td>
                    <script>orderStatusCalculator('<%=date%>','status<%=idCount%>')</script>
                    <% idCount = idCount+1 ; %>
                    <td class="text-end" colspan="5" id="table-bottom-info"><b>Final Total(Rs) : <%=bill%></b></td>
        </tr>           
                   
                    
                   
  <%  }%>
</tbody>
</table>
</div> 
<%}
else{%>

        <p><b>No Order History...</b></p>

<%}%>
