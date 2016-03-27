<%!
    private String rowCol(int rowCount) {

        try {
            int rowRange = 6;
            if (rowCount % rowRange == 0) {

                return "success";
            } else if (rowCount % rowRange == 1) {

                return "danger";
            } else if (rowCount % rowRange == 2) {

                return "primary";
            } else if (rowCount % rowRange == 3) {

                return "info";
            } else if (rowCount % rowRange == 4) {

                return "success";
            } else if (rowCount % rowRange == 5) {

                return "warning";
            } else {

                return "";
            }
        } catch (Exception e) {

            return "";
        }
    }
%>
<%@page import="java.sql.ResultSet"%>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
%>
<div class="container-fluid">
    <div class="jumbotron">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-10 col-md-offset-1 col-lg-10 col-lg-offset-1">
                <h1>Your advertisements are here</h1>
                <h1>${errorMessage}</h1>
            </div>
        </div>
            <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
                <div class="table-responsive">
                    <table class="table table-hover table-bordered">
                        <thead>
                            <tr>
                                <th>Post Date</th>
                                <th>Type</th>
                                <th>Quantity</th>
                                <th>Deadline</th>
                                <th>Availability</th>
                                <th>House Rent</th>
                                <th>Utility Cost</th>
                                <th>Address</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                int rowCounter = 0;
                                while (resultSet.next()) {
                            %>
                            <tr class="<%=rowCol(rowCounter)%>">
                                <td><%=resultSet.getString("post_date")%></td>
                                <td><%=resultSet.getString("type")%></td>
                                <td><%=resultSet.getString("quantity")%></td>
                                <td><%=resultSet.getString("deadline")%></td>
                                <td><%=resultSet.getString("availability")%></td>
                                <td><%=resultSet.getString("house_rent")%></td>
                                <td><%=resultSet.getString("utility_cost")%></td>
                                <td><%=resultSet.getString("address")%></td>
                            </tr>
                            <%
                                    rowCounter = rowCounter + 1;
                                }
                            %>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</div>