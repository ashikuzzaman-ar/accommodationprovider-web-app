<%@page import="java.sql.ResultSet"%>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
%>
<div class="container-fluid">
    <h1>${errorMessage}</h1>
    <div class="row">
        <%
            int count = 1;
            while (resultSet.next()) {
        %>
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
            <h1>Most Recent : <%=count%></h1>
            <div class="table-responsive">
                <table class="table table-striped">
                    <tr>
                        <td>Post Date: </td>
                        <td><%=resultSet.getString("post_date")%></td>
                    </tr>
                    <tr>
                        <td>Type: </td>
                        <td><%=resultSet.getString("type")%></td>
                    </tr>
                    <tr>
                        <td>Quantity: </td>
                        <td><%=resultSet.getString("quantity")%></td>
                    </tr>
                    <tr>
                        <td>Deadline: </td>
                        <td><%=resultSet.getString("deadline")%></td>
                    </tr>
                    <tr>
                        <td>Availability: </td>
                        <td><%=resultSet.getString("availability")%></td>
                    </tr>
                    <tr>
                        <td>House Rent: </td>
                        <td><%=resultSet.getString("house_rent")%></td>
                    </tr>
                    <tr>
                        <td>Utility Cost: </td>
                        <td><%=resultSet.getString("utility_cost")%></td>
                    </tr>
                    <tr>
                        <td>Address: </td>
                        <td><%=resultSet.getString("address")%></td>
                    </tr>
                    <tr>
                        <td>Extra Facility: </td>
                        <td><%=resultSet.getString("provided_fasility")%></td>
                    </tr>
                </table>
            </div>
        </div>
        <%
                count = count + 1;
            }
        %>
    </div>
</div>