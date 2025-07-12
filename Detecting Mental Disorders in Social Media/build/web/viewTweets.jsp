
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="DBconnection.SQLconnection"%>
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
    <style>

        .customers {
            font-family: "Trebuchet MS", Arial, Helvetica, sans-serif;
            font-size: 20px;
            border-collapse: collapse;
            width: 100%;
        }

        .customers td, .customers th {
            border: 2px solid black;
            align:"center";  cellpadding:"0"; cellspacing:"2";
            text-align: center;
            padding: 15px;
            color: black;
        }


        .customers th {
            padding-top: 12px;
            padding-bottom: 12px;
            text-align: center;
            background-color: #3399ff;
            color: black;
        }
    </style>
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
                        <li><a style="color: #0099ff" href="viewTweets.jsp">View Tweets</a></li>
                        <li><a href="graph.jsp">Graph</a></li>
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
                    <center><h2>All Tweets</h2></center><br>
                    <div class="row">
                        <div class="col-lg-12">
                            <table class="customers">
                            <tr>
                                <th>Twitter ID</th>
                                <th>User ID</th>
                                <th>Name</th>
                                <th>Tweet's</th>
                                <th>Emotion</th>
                                <th>Mental State</th>
                                <th><center>Photo</center></th>
                            </tr>
                            <%
                                Connection con = SQLconnection.getconnection();
                                Statement st = con.createStatement();
                                Statement st1 = con.createStatement();
                                Statement st2 = con.createStatement();

                                try {
                                    ResultSet rs = st.executeQuery("SELECT * FROM tweet");
                                    while (rs.next()) {

                            %>
                            <tr>
                                <td><%=rs.getString("tid")%></td>
                                <td><%=rs.getString("uid")%></td>
                                <td><%=rs.getString("username")%></td>
                                <td><%=rs.getString("msg")%></td>
                                <td><%=rs.getString("status")%></td>
                                <td><%=rs.getString("emotion")%></td>
                                <td><center><img src="tweet_img?id=<%=rs.getString("tid")%>" width="300" height="300"/></center></td>
                            </tr>
                            <%                                             }
                                } catch (Exception ex) {
                                    ex.printStackTrace();
                                }


                            %>
                        </table>
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

