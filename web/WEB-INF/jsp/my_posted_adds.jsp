<%@page import="java.sql.ResultSet"%>
<div class="container-fluid">
    <div class="jumbotron">
        <div class="row">
            <h1>Your advertisements are here</h1>
            <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
                <%
                    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
                    while (resultSet.next()) {
                        out.println("<h1> Bonti </h1>");
                    }
                %>
                <h1>${errorMessage}</h1>
            </div>
        </div>
    </div>
</div>