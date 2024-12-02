<%@include file="nm2h41rnr6/config.jsp" %>
<%@include file="nm2h41rnr6/fancyconfig.jsp" %>

<form id="register-form" role="form" class="form" method="post" action="mailfp.jsp">
    <div class="offset-4 col-5">
        <h3>Enter Your Email Below</h3>
        <input id="email" name="email" placeholder="Email address" class="form-control"  type="email" required autofocus><br>
        <input id="idonly" name="id" type="text" placeholder="Email Your Employee Id" class="form-control"   required><br>
        <input  name="recover-submit" class="btn btn-lg btn-primary btn-block col-6 offset-3" value="Click to Change Password" type="submit">
    </div>
</form>