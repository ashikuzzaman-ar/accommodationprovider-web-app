<%@page import="java.sql.ResultSet"%>
<%
    ResultSet resultSet = (ResultSet) request.getAttribute("searchResults");
    int rowCount = 0;
%>
<div class="container-fluid">
    <h1>${errorMessage}</h1>
    <% if (request.getSession().getAttribute("userInformation") != null) { %>
    <% if (!resultSet.equals(null)) {%>
    <div class="row">
        <div class="box">
            <div class="col-lg-12">
                <div class="intro-text text-center">
                    <hr/>
                    <strong class="h1">Search Result</strong>
                    <hr/>
                </div>
            </div>
            <% while (resultSet.next()) {%>
            <div class="col-lg-12">
                <div class="box hoverable">
                    <table>
                        <thead>
                            <tr>
                                <td>
                                    <a class="" href="<%=resultSet.getString("post_id")%>">
                                        <h2 class="text-capitalize"><%= resultSet.getString("title")%></h2>
                                    </a>
                                </td>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Posted By: <%=resultSet.getString("name")%></td>
                            </tr>
                            <tr>
                                <td>Address: <%=resultSet.getString("address")%></td>
                            </tr>
                            <tr>
                                <td>Post Date: <%=resultSet.getString("post_date")%></td>
                            </tr>
                            <tr>
                                <td><%=resultSet.getString("quantity")%> - <%=resultSet.getString("type")%></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
            <% rowCount++;
                } %>
            <% if (rowCount == 0) { %>
            <div class="col-lg-12">
                <div class="text-left">
                    <strong class="h2">No Results Found</strong>
                </div>
            </div>
            <% } %>
        </div>
    </div>
    <% } %>
    <% }%>
</div>