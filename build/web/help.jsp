<%@include file="nm2h41rnr6/config.jsp" %>
<%@include file="nm2h41rnr6/fancyconfig.jsp" %>
<%@include file="nm2h41rnr6/modal.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Help</title>
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
                    <li class="nav-item">
                        <a class="nav-link" href="contact.jsp">Contact <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Help <span class="sr-only">(current)</span></a>
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
                        <h2 style="color: rgb(0, 0, 0);  text-align: center;">Privacy Policy </h2>
                        <p><span style="color: rgb(0, 0, 0);  text-align: center;">This Privacy Policy explains how VRIS Agency. (“VERA,” “we,” “us,” or “our”) collects, uses, and discloses your information. This Privacy Policy applies to personal data collected on our website (http://www.vris.org) and personal information you provide to us through our website.<br>
                                <br>
                                Personal information is information that can be used to directly or indirectly identify you. Personal information does not include information that has been anonymized or aggregated so that it can no longer enable us, whether in combination with other information or otherwise, to identify you.<br>
                                <br>We make certain personal information available to trusted partners who work on behalf of or with Vera to help communicate with you about Vera’s work, upcoming events, and collaborations between Vera and other organizations. Personal information will only be shared by us with these parties in order to provide or improve our services programming; it will not be shared with third parties for their own marketing purposes without your prior express consent. We may also share personal information for purposes of legal compliance and security.<br>
                            </span>
                        </p></div>
                </div>
            </section>
        </div>
        <%@include file="nm2h41rnr6/footer.jsp" %>
    </body>
</html>