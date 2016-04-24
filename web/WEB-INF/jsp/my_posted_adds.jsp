<%@page import="java.sql.ResultSet"%>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("resultSet");
%>
<div class="container-fluid">
    <div class="jumbotron">
        <div class="row">
            <!--<div class="box">-->
            <div class="col-lg-12">
                <div class="intro-text text-center">
                    <hr/>
                    <strong class="h1">My Posted Advertisements</strong>
                    <hr/>
                </div>
            </div>
            <% while (resultSet != null && resultSet.next()) {%>
            <div class="col-lg-12">
                <div class="box">
                    <form class="form" action="update_add" method="POST">
                        <table class="table table-responsive table-hover">
                            <thead>
                                <tr>
                                    <td>
                                        <a class="" href="#">
                                            <h2 class="text-capitalize"><%= resultSet.getString("title")%></h2>
                                        </a>
                                    </td>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>Post Date: <%=resultSet.getString("post_date")%></td>
                                </tr>
                                <tr>
                                    <td>Post ID: <%=resultSet.getString("post_id")%></td>
                            <input type="hidden" value="<%=resultSet.getString("post_id")%>" name="postID"/>
                            </tr>
                            <tr>
                                <td>Address: <%=resultSet.getString("address")%></td>
                            </tr>
                            <tr>
                                <td>Type: <%=resultSet.getString("type")%></td>
                            </tr>
                            <tr>
                                <td> Quantity: <%=resultSet.getString("quantity")%></td>
                            </tr>
                            <tr>
                                <td> 
                                    Availability: 
                                    <%
                                        String postAvailability = resultSet.getString("availability");
                                        if (postAvailability.equals("Y")) {
                                    %>

                                    <label>Yes </label> <input id="yAvailability" type="radio" name="availability" value="Y" checked="checked" />
                                    <label>No </label> <input id="nAvailability" type="radio" name="availability" value="N" disabled="true" />

                                    <% } else { %>

                                    <label>Yes </label> <input id="yAvailability" type="radio" name="availability" value="Y" disabled="true" />
                                    <label>No </label> <input id="nAvailability" type="radio" name="availability" value="N" checked="checked" />

                                    <% } %>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                        <br/>
                        <div>
                            <a class="btn btn-success left" href="index">Back to Home</a>
                            <button type="button" class="btn btn-info" onclick="
                                    setEditableTextField('yAvailability');
                                    setEditableTextField('nAvailability');">

                                Edit this post
                            </button>
                            <button type="submit" class="btn btn-primary">
                                Save Change
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <% }%>
            <!--</div>-->
        </div>
    </div>
</div>