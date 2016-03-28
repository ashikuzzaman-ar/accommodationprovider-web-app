<%@page import="java.sql.ResultSet"%>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
    if (resultSet.next()) {
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-8 col-sm-offset-2 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3">
            <div class="jumbotron">
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
                        <tr>
                            <td>
                                <input type="submit" class="btn btn-primary" value="Show Interest" name="button" />
                            </td>
                            <td>
                                <input type="submit" class="btn btn-success" value="Send Message" name="button" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>
<!--<h1><%= resultSet.getString("address")%> </h1>-->
<%}%>