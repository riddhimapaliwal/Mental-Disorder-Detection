<%@page import="DBconnection.SQLconnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>

<%try {
        Connection con = SQLconnection.getconnection();
        Statement st1 = con.createStatement();
        Statement st2 = con.createStatement();
        Statement st3 = con.createStatement();
        Statement st4 = con.createStatement();
        Statement st5 = con.createStatement();
        Statement st6 = con.createStatement();
        Statement st7 = con.createStatement();
        Statement st8 = con.createStatement();
        Statement sd1 = con.createStatement();
        Statement sd2 = con.createStatement();
        Statement sd3 = con.createStatement();
        Statement sd4 = con.createStatement();

        String msg = (String) session.getAttribute("message");
        System.out.println("Checking  : " + msg);
        boolean bol = false;

        String ms = msg.toLowerCase();

        Statement st = con.createStatement();
        Statement st0 = con.createStatement();
        Statement sd = con.createStatement();
        String Query = "select * from emotion_words";
        ResultSet rs = st.executeQuery(Query);

        String temp1 = "";

        ResultSet rt;
        StringBuffer sb = new StringBuffer();
        String[] sens = ms.split(" ");

        for (String sen : sens) {
            String[] words = sen.split(" ");
            for (String word : words) {
                rt = sd.executeQuery("SELECT * FROM emotion_words where words='" + word + "'");
                if (!rt.next()) {
                    sb.append(word + " ");
                }
            }
            temp1 = sb.toString();
        }
        String[] word = temp1.split(" ");
        ResultSet rs1 = st0.executeQuery(Query);
        while (rs1.next()) {
            String val6 = rs1.getString("depression").toLowerCase();
            String val7 = rs1.getString("anorexia").toLowerCase();
            for (String msg1 : word) {
                if (val6.indexOf(msg1) >= 0) {

                    st7.executeUpdate("update tweet set emotion='Depression' where msg='" + msg + "'");
                    break;

                } else if (val7.indexOf(msg1) >= 0) {

                    st8.executeUpdate("update tweet set emotion='Anorexia' where msg='" + msg + "'");
                    break;
                } 
            }
        }
        while (rs.next()) {
            String val1 = rs.getString("fear").toLowerCase();
            String val2 = rs.getString("anticip").toLowerCase();
            String val3 = rs.getString("surprise").toLowerCase();
            String val4 = rs.getString("anger").toLowerCase();
            String val5 = rs.getString("disgust").toLowerCase();
            String val6 = rs.getString("joy").toLowerCase();
            String val7 = rs.getString("negative").toLowerCase();
            String val8 = rs.getString("positive").toLowerCase();
            String val9 = rs.getString("trust").toLowerCase();
            for (String msg1 : word) {
                if (val1.indexOf(msg1) >= 0) {

                    st1.executeUpdate("update tweet set status='fear' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val2.indexOf(msg1) >= 0) {

                    st2.executeUpdate("update tweet set status='anticip' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val3.indexOf(msg1) >= 0) {
                    st3.executeUpdate("update tweet set status='suprise' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {

                if (val4.indexOf(msg1) >= 0) {
                    st4.executeUpdate("update tweet set status='anger' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val5.indexOf(msg1) >= 0) {
                    st5.executeUpdate("update tweet set status='disgust' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val6.indexOf(msg1) >= 0) {
                    st5.executeUpdate("update tweet set status='joy' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val7.indexOf(msg1) >= 0) {
                    st5.executeUpdate("update tweet set status='negative' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val8.indexOf(msg1) >= 0) {
                    st5.executeUpdate("update tweet set status='positive' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
            for (String msg1 : word) {
                if (val9.indexOf(msg1) >= 0) {
                    st5.executeUpdate("update tweet set status='trust' where msg='" + msg + "'");

                    bol = false;
                    break;
                }
            }
        }
        if (bol == true) {
            st6.executeUpdate("update tweet set status='Normal' where msg='" + msg + "'");

            response.sendRedirect("tweet.jsp?sucess");
        } else {
            response.sendRedirect("tweet.jsp?tweet_added");
        }
    } catch (Exception ex) {
        System.out.println(ex);
    }

%>

