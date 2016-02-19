<%@page import="java.sql.ResultSet"%>
<div class="container-fluid">
    <!--    <div class="container">
            <div class = "alert alert-danger alert-dismissable">
                <button type = "button" class = "close" data-dismiss = "alert" aria-hidden = "true">
                    &times;
                </button>
                <h4></h4>
            </div>
        </div>-->
    <div class="jumbotron">
        <span class="font-large">Welcome to UIU Accommodation Provider</span>
    </div>
    <div class="container">
        <div id="sample" style="width:570px;height:580px;"></div>
    </div>
    <div class="container">
        ${errorMessage}
        <% if (!request.getAttribute("searchResults").equals("")) { %>
        <h1>Search result is shown below</h1>
        <% } else { %>
        <h1>No result found</h1>
        <% } %>
        <table class="table-bordered table-striped table-hover font-medium">
            <thead>
                <tr>
                    <th>Posted By</th>
                    <th>Location</th>
                    <th>Type</th>
                    <th>Quantity</th>
                    <th>Last Date</th>
                </tr>
            </thead>
            <tbody>
                <%
                    ResultSet resultSet = (ResultSet) request.getAttribute("searchResults");
                    while (resultSet.next()) {
                %>
                <tr>
                    <td>${searchResults.getString("u_id")}</td>
                    <td>${searchResults.getString("address")}</td>
                    <td>${searchResults.getString("type")}</td>
                    <td>${searchResults.getString("quantity")}</td>
                    <td>${searchResults.getString("deadline")}</td>
                </tr>
                <% }%>
            </tbody>
        </table>
    </div>
</div>