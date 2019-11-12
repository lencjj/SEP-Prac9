<%@page import ="java.sql.*"%>
<%
    int idTxt = Integer.parseInt(request.getParameter("frmID"));
    String brandTxt=request.getParameter("frmBrand");
    String modelTxt=request.getParameter("frmModel");
    String functionsTxt=request.getParameter("frmFunct");
    String quantityTxt=request.getParameter("frmQty");
%>
<html>
<head><title>Pract5 Part4</title></head>
<body>

    <h3><%=request.getRequestURI()%></h3>

    <%
    int nRecord=0;
        //=======================================
        //here is where I will be checking with the db if the record exist.
    try {
          // Step1: Load JDBC Driver
          Class.forName("com.mysql.jdbc.Driver");

          // Step 2: Define Connection URL
          String connURL ="jdbc:mysql://localhost/db1?user=root&password=12345"; 

          // Step 3: Establish connection to URL
          Connection conn = DriverManager.getConnection(connURL); 
          // Step 4: Create Statement object
          //Statement stmt = conn.createStatement();
          // Step 5: Execute SQL Command
          String sqlStr = "UPDATE inventory SET brand=?, model=?, functions=?, quantity=? WHERE id=?";    
          PreparedStatement pstmt  = conn.prepareStatement(sqlStr);
          pstmt.setString(1, brandTxt);
          pstmt.setString(2, modelTxt);
          pstmt.setString(3, functionsTxt);
          pstmt.setString(4, quantityTxt);
          pstmt.setInt(5, idTxt);          
          
          nRecord = pstmt.executeUpdate();

          // Step 6: Process Result
          //nothing to process
        
          // Step 7: Close connection
          conn.close();
     } catch (Exception e) {
        out.println("<h1>Error :" + e+"<h1>");
        //out.print("<h2>We are sorry that the application is not available at the moment. Pleas call our Helpdesk at 68707070</h2>");
        out.print("<h1>Error code: 1234 in page: "+request.getRequestURI()+"</h1>");
     }
        
        //========================================
        if(nRecord>0){
                out.print("Update done! "+nRecord);
                //response.sendRedirect("done.jsp");
        } else {
                out.print("Fail");
                //response.sendRedirect("updateAccount.jsp?status="+nRecord); 
        }
        %>
        <br><br>
        <a href="searchForm.jsp" ><button>Back to product search</button></a>
 
</body>
</html> 