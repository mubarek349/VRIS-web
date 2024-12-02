<%@include file="nm2h41rnr6/config.jsp" %>
<%@include file="nm2h41rnr6/fancyconfig.jsp" %>
<%@include file="nm2h41rnr6/modal.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Federal Democratic Republic Of Ethiopia</title>
    </head>
    <body>
        <%@include file="nm2h41rnr6/banner.jsp" %>
        <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
            <a class="navbar-brand" href="#">VRIS</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="about.jsp">About <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact <span class="sr-only">(current)</span></a>
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
        <header class="masthead bg-transparent text-secondary text-center" style="background: wheat">
            <div class="container">
                <h2 class="text-uppercase mb-0">Vital registration data is essential for a functional and people-centered integration process that aims to improve well-being and promotes job creation and market expansion”

                </h2>
                <hr class="star-dark">
                <h2 class="font-weight-light mb-0">MAKING EVERY ONE VISIBLE!!!</h2>
            </div>
        </header>

        <!-- Footer -->
        <%@include file="nm2h41rnr6/footer.jsp" %>

        <!-- Scroll to Top Button (Only visible on small and extra-small screen sizes) -->
        <div class="scroll-to-top d-lg-none position-fixed ">
            <a class="js-scroll-trigger d-block text-center text-white rounded" href="#page-top">
                <i class="fa fa-chevron-up"></i>
            </a>
        </div>
    </body>
</html>
