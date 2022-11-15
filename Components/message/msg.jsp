<%
    String msg = (String) session.getAttribute("message");
    if(msg != null)
    {
%>

<div class="alert alert-danger alert-dismissible fade show">
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    <%= msg%>
</div>

<%
    
        session.removeAttribute("message");
    }

    String except = (String) session.getAttribute("exception");
    if(except != null)
    {
%>
<div class="alert alert-danger alert-dismissible fade show">
    <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
    <%= except%>
</div>

<%
        session.removeAttribute("exception");
        }
%>
