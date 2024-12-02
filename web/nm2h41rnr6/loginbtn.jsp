<%
    if (request.getSession().getAttribute("username") == null) {
%>
<div class="my-2 my-lg-0">
    <button class="btn btn-outline-primary my-2 my-sm-0" type="button" data-toggle="modal" data-target="#exampleModal">Login</button>
</div>
<%
} else {
%>
<div class="my-2 my-lg-0">
    <a class="btn btn-outline-danger my-2 my-sm-0" href="${pageContext.request.contextPath}/Logout">Logout</a>
</div>
<%
    }
%> 