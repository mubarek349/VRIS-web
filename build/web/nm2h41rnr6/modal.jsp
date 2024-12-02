<%@page import="com.vris.helper.CaptchaGen"%>
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Please Log In</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form class="form-signin" action="${pageContext.request.contextPath}/Login" method="POST">
                    <input type="email" name="email" id="inputEmail" class="form-control" placeholder="Username" required autofocus><br>
                    <input type="password" name="pword" id="inputPassword" class="form-control" placeholder="Password" required><br>
                    <div class="form-row">
                        <div class="col-3 offset-1">
                            <% String preCaptcha = CaptchaGen.getCaptcha();%>
                            <h6><%=preCaptcha%></h6>
                            <input type="text" name="precaptcha" value="<%= preCaptcha%>" hidden>
                        </div>
                        <div class="col-7 offset-1">
                            <input type="text" name="captcha" class="form-control" placeholder="Enter the phrase you see on screen">
                        </div>
                    </div><br>
                    <div class="row">
                        <div class="col">
                            <button class="btn btn-primary btn-block" type="submit">Log In</button>
                        </div>
                        <div class="col">
                            <button type="button" class="btn btn-block btn-secondary" data-dismiss="modal">Close</button>
                        </div>
                    </div>
                    <br>
                    <a class="offset-4" href="forgotpass.jsp"> Forget Password ?</a>
                </form>     
            </div>
        </div>
    </div>
</div>