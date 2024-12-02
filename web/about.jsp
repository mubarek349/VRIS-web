<%@include file="nm2h41rnr6/config.jsp" %>
<%@include file="nm2h41rnr6/fancyconfig.jsp" %>
<%@include file="nm2h41rnr6/modal.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>About Us</title>
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
                    <li class="nav-item active">
                        <a class="nav-link" href="#">About <span class="sr-only">(current)</span></a>
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
        <div class="col-8 offset-2">
            <section class="about_us section-padding">
                <div class="container">
                    <div class="section-header text-center">
                        <h2 style="color: rgb(0, 0, 0);  text-align: center;">About Us </h2>
                        <p><span style="color: rgb(0, 0, 0); text-align: center;">Vital Registration and Identity System is an organization that is established under the Ethiopian Civil , Family and Vital law and its head office is located in the capital city of Ethiopia. Owned and Managed by an Ethiopian, with a great experience by working in Ethiopia.<br>
                                <br>
                                The historical attempt to establish vital events registration system in Ethiopia started during the reign of Menelik II. After time the other effort to establish the conventional vital events registration system in Ethiopia was mainly associated with the inclusion of the civil registration provisions (about 100 Articles) in Civil code of 1960.<br>
                                <br>However, Article 3361 (1) of the code states that registration of civil status shall not come into force until a day to be notified by Order published and the Order was not published and the provisions of the code was not enforced.
                                <br>The proclamation from 2012 established the legal and organizational framework of the vital events registration, but The Vital Events Registration Agency (VERA) was not established until August 2016.</span> </p>

                        <p style="font-size: 30px ;font-family:century Gothic">
                            Make Everyone Visible!!!
                        </p>
                    </div>
                </div>
            </section>
        </div>

        <!-- /About-us--> 

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
