<%@include file="nm2h41rnr6/config.jsp" %>
<%@include file="nm2h41rnr6/fancyconfig.jsp" %>
<%@include file="nm2h41rnr6/modal.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Us</title>
    </head>
    <body>
        <%@include file="nm2h41rnr6/banner.jsp" %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="index.jsp">VRIS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Contact <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="help.jsp">Help <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <div id="google_translate_element"></div> 

                        <script type="text/javascript">
                            function googleTranslateElementInit() {
                                new google.translate.TranslateElement({pageLanguage: 'en'}, 'google_translate_element');
                            }
                        </script> 

                        <script type="text/javascript" src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"></script> 

                    </li>
                    <%@include file="nm2h41rnr6/specpage.jsp" %>
                </ul>
                <%@include file="nm2h41rnr6/loginbtn.jsp" %> 
            </div>
        </nav>
        <div class="col-md-4 mb-5 mb-lg-0">
            <h4 class="text-uppercase mb-4">Location</h4>
            <p class="lead mb-0">Piasa, Near Enat Building 
                <br>Addis Ababa, Ethiopia</p>

            <i class="fab fa-fw fa-telegram"></i>

            &nbsp; 011 157 3357
        </div>
        <!-- Footer -->
        <%@include file="nm2h41rnr6/footer.jsp" %>
    </body>
</html>
