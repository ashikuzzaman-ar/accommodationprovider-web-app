<%@page import="java.sql.ResultSet"%>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
    if (resultSet.next()) {
%>
<div class="container-fluid">
    <div class="row">
        <div class="box">
            <div class="col-lg-12 text-center">
                <!--Mapped in Index.java Controller-->
                <form action="send_message" method="POST">
                    <div class="table-responsive">
                        <table class="table table-striped">
                            <tr>
                                <td>Poster ID: </td>
                                <td><%=resultSet.getString("u_id")%></td>
                            <input type="hidden" name="receiverID" value="<%=resultSet.getString("u_id")%>" />
                            </tr>
                            <tr>
                                <td>Post ID: </td>
                                <td><%=resultSet.getString("post_id")%></td>
                            </tr>
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
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12 text-center">
                                    <textarea class="" name="message" placeholder="Write your message here" rows="8" cols="50"></textarea>
                                    <div>
                                        <button class="btn btn-primary" type="submit" name="button">
                                            <span class="glyphicon glyphicon-send" aria-hidden="true">
                                                Send Message
                                            </span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%
    }
%>