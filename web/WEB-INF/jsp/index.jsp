<%@page import="java.sql.ResultSet"%>
<div>
    <div class="container">
        <div class="jumbotron">
            <h1>Test Git Merging...</h1>
            <h1>This is Jumbotron for sajid</h1>
            <% ResultSet rs = (ResultSet)request.getAttribute("rs"); %>
            <div>
                <table border="1">
                    <tr>
                        <td>ID</td>
                        <td>Values</td>
                    </tr>
                    <% while(rs.next()){ %>
                    <tr>
                        <td><%= rs.getInt("node") %></td>
                        <td><%= rs.getString("adjacents") %></td>
                    </tr>
                    <% } %>
                </table>
            </div>
        </div>
    </div>
</div>