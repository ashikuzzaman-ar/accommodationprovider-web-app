<%@page import="java.sql.ResultSet"%>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("searchResults");
//    int rowCount = 0;
%>
<div class="container-fluid">
    <h1>${errorMessage}</h1>
    <div class="jumbotron">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-8 col-md-offset-2 col-lg-6 col-lg-offset-3">
                <h1>Your Search Results</h1>
            </div>
        </div>
        <div class="row">
            <%
                while (resultSet.next()) {
            %>
            <div class="col-xs-6 col-sm-4 col-md-4 col-lg-2">
                <p>
                    <%=resultSet.getString("post_date")%><br/>
                    <%=resultSet.getString("quantity")%> - <%=resultSet.getString("type")%> <br/>
                    <%=resultSet.getString("address")%>
                </p>
                <a class="btn btn-primary" href="<%=resultSet.getString("post_id")%>">Details</a>
            </div>
            <%}%>
        </div>
    </div>
</div>