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
                            <thead class="text-left h1">
                                <tr>
                                    <td>
                                        <h1 class="text-capitalize text-success"><%=resultSet.getString("title")%></h1>
                                    </td>
                                </tr>
                            </thead>
                            <tbody class="text-left h2">
                                <tr>
                                    <td>Poster ID: <%=resultSet.getString("u_id")%></td>
                            <input type="hidden" name="receiverID" value="<%=resultSet.getString("u_id")%>" />
                            </tr>
                            <tr>
                                <td>Post ID: <%=resultSet.getString("post_id")%></td>
                            </tr>
                            <tr>
                                <td>Post Date: <%=resultSet.getString("post_date")%></td>
                            </tr>
                            <tr>
                                <td>Type: <%=resultSet.getString("type")%></td>
                            </tr>
                            <tr>
                                <td>Quantity: <%=resultSet.getString("quantity")%></td>
                            </tr>
                            <tr>
                                <td>Deadline: <%=resultSet.getString("deadline")%></td>
                            </tr>
                            <tr>
                                <td>Availability: <%=resultSet.getString("availability")%></td>
                            </tr>
                            <tr>
                                <td>House Rent: <%=resultSet.getString("house_rent")%></td>
                            </tr>
                            <tr>
                                <td>Utility Cost: <%=resultSet.getString("utility_cost")%></td>
                            </tr>
                            <tr>
                                <td>Address: <%=resultSet.getString("address")%></td>
                            </tr>
                            <tr>
                                <td>Extra Facility: <%=resultSet.getString("provided_fasility")%></td>
                            </tr>
                            </tbody>
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