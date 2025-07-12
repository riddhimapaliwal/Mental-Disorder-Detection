
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.google.gson.Gson"%>
<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Detecting Mental Disorders in Social Media</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Jost:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
        <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

    </head>
    <body>

        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top ">
            <div class="container d-flex align-items-center">

                <h1 class="logo mr-auto"><a></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <!-- <a href="index.html" class="logo mr-auto"><img src="assets/img/logo.png" alt="" class="img-fluid"></a>-->

                <nav class="nav-menu d-none d-lg-block">
                    <ul>
                        <li><a href="adminHome.jsp">Home</a></li>
                        <li><a href="userDetails.jsp">User Details</a></li>
                        <li><a href="viewTweets.jsp">View Tweets</a></li>
                        <li><a style="color: #0099ff" href="graph.jsp">Graph</a></li>
                        <li><a href="index.jsp">Logout</a></li>
                    </ul>
                </nav><!-- .nav-menu -->


            </div>
        </header><!-- End Header -->

        <!-- ======= Hero Section ======= -->
        <section id="hero" class="d-flex align-items-center">

            <div class="container">
                <div class="row">
                    <div class="col-lg-6 d-flex flex-column justify-content-center pt-4 pt-lg-0 order-2 order-lg-1" data-aos="fade-up" data-aos-delay="200">
                        <h1>Detecting Mental Disorders in Social Media
                            Through Emotional Patterns - The case of Anorexia
                            and Depression</h1>
                    </div>
                    <div class="col-lg-6 order-1 order-lg-2 hero-img" data-aos="zoom-in" data-aos-delay="200">
                        <img src="assets/img/hero-img.png" class="img-fluid animated" alt="">
                    </div>
                </div>
            </div>

        </section><!-- End Hero -->

        <main id="main">

            <section id="about" class="about">
                <div class="container" data-aos="fade-up">
                    <center><h2>Analysis</h2></center><br>
                    <div class="row">
                        <div class="col-lg-12">
                            <%
                                String val1 = "", val2 = "", val3 = "";
                                String val11 = "", val22 = "", val33 = "";
                                int i = 0;

                                try {
                                    Connection con = SQLconnection.getconnection();

                                    Statement st = con.createStatement();
                                    ResultSet rs0 = st.executeQuery("SELECT  COUNT(tid) AS value_occurrence FROM  tweet WHERE emotion = 'depression'");
                                    rs0.next();
                                    {

                                        val1 = rs0.getString("value_occurrence");
                                    }
                                    rs0.close();
                                    Statement st1 = con.createStatement();
                                    ResultSet rs2 = st1.executeQuery("SELECT  COUNT(tid) AS value_occurrence FROM  tweet WHERE emotion = 'anorexia'");
                                    rs2.next();
                                    {
                                        val2 = rs2.getString("value_occurrence");
                                    }
                                    //Integer sii = rs0.getInt("value_occurrence");
                                    System.out.println("count------------------> " + val1);
                                    System.out.println("count------------------> " + val2);

                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }

                            %>
                            <script type="text/javascript">
                                window.onload = function () {

                                    var chart = new CanvasJS.Chart("chartContainer", {
                                        animationEnabled: true,
                                        exportEnabled: true,
                                        title: {
                                            text: ""
                                        },
                                        axisY: {
                                            includeZero: true
                                        },
                                        data: [{
                                                type: "column", //change type to bar, line, area, pie, etc
                                                //indexLabel: "{y}", //Shows y value on all Data Points
                                                indexLabelFontColor: "#5A5757",
                                                indexLabelPlacement: "outside",
                                                dataPoints: [{y: <%=val1%>, label: "Depression Tweets"},
                                                    {y: <%=val2%>, label: "Anorexia Tweets"}]
                                            }]
                                    });
                                    chart.render();

                                }
                            </script>
                            <div id="chartContainer" style="height: 370px; max-width: 920px; margin: 0px auto;"></div>
                        </div>
                    </div>
                </div>
            </section><!-- End About Section -->
        </main><!-- End #main -->


        <footer id="footer">
            <div class="container footer-bottom clearfix">
                <center>&copy;  <strong><span>2025</span></strong>.</center>
            </div>
        </footer><!-- End Footer -->

        <a href="#" class="back-to-top"><i class="ri-arrow-up-line"></i></a>
        <div id="preloader"></div>

        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>
        <script src="https://canvasjs.com/assets/script/canvasjs.min.js"></script>
        <!-- About us Skills Circle progress  -->
        <script>
                                // First circle
                                new Circlebar({
                                    element: "#circle-1",
                                    type: "progress",
                                    maxValue: "90"
                                });

                                // Second circle
                                new Circlebar({
                                    element: "#circle-2",
                                    type: "progress",
                                    maxValue: "84"
                                });

                                // Third circle
                                new Circlebar({
                                    element: "#circle-3",
                                    type: "progress",
                                    maxValue: "60"
                                });

                                // Fourth circle
                                new Circlebar({
                                    element: "#circle-4",
                                    type: "progress",
                                    maxValue: "74"
                                });

        </script>
        <!-- Vendor JS Files -->
        <script src="assets/vendor/jquery/jquery.min.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
        <script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendor/venobox/venobox.min.js"></script>
        <script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>

