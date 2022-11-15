<%@page import="javaFiles.User"%>
<%
    User user = (User)session.getAttribute("current_user");

    if(user == null)
    {
        session.setAttribute("message","Access Denied without Proper Authentication");

        response.sendRedirect("login.jsp");
    }
    else
    {
        if(user.role.equals("0"))
        {
            session.setAttribute("message","You donot have permission to view this profile");
            response.sendRedirect("login.jsp");
        }
    }
%>

<%@page contentType = "text/html" pageEncoding ='utf-8'%>
<%if(user!=null){%>
<!DOCTYPE html>

<html land='en'>
    <head>
        <%@include file = "Components/title/title_info.jsp"%>
        <link rel="stylesheet" href="Style/normal.css">
        <script src='Script/Signup.js'></script>
        <script src='Script/datefunc.js'></script>
    </head>
    <body id='body_div'>
        <%@include file = "Components/navBar/navbar.jsp"%>
        <div class="container-fluid">
            <div class="row">
                <div class="col-md-1"></div>
                <div class="col-md-10">
                    <div id="user_details">
                        <h1>User Details</h1>
                        <div class="table-responsive mb-4">
                            <table class="table">
                              <thead id="table_head">
                                  <tr>
                                      <th>Name</th>
                                      <th>Email</th>
                                      <th>Phone</th>
                                      <th>Address</th>
                                  </tr>
                              </thead>
                              <tbody id="table_body">
                                  <tr>
                                      <td><%=user.name%></td>
                                      <td><%=user.email%></td>
                                      <td><%=user.phone%></td>
                                      <td><%=user.address%></td>
                                  </tr>
                              </tbody>
                            </table>
                          </div>
                        <div>
                            <h2>Change Password</h2>
                            <p><b>Click the Button below to Change password.</b></p>
                          <div>
                            <button id="pswd-btn" onclick='<% session.setAttribute("access","1"); session.setAttribute("email",user.email); %>'><a href="changepassword.jsp">Change Password</a></button>
                          </div>
                        </div>

                        <div>
                            <h2 class="mt-2">Order Record(s)</h2>
                            <%@include file = "Components/orderTable/order_records.jsp"%>
                        </div>

                    </div>
                </div>
                <div class="col-md-1"></div>
            </div>
        </div>
    </body>
</html>
<%}%>