<%@page import="java.sql.ResultSet"%>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
%>
<div class="container-fluid">
    <h1>${errorMessage}</h1>
    <div class="jumbotron">
        <div class="row">
            <div class="col-lg-12">
                <div class="intro-text text-center">
                    <hr/>
                    <strong class="h1">Most Recent Posts</strong>
                    <hr/>
                </div>
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