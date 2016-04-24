<%
    ResultSet inboxMessages = (ResultSet) request.getAttribute("inboxMessages");
    ResultSet outboxMessages = (ResultSet) request.getAttribute("outboxMessages");
%>
<div class="container">
    <div class="box">
        <div class="row">
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
                <div class="text-capitalize">
                    <strong class="h1">Inbox</strong>
                </div>
                <div class="text-warning">
                    <% if (inboxMessages == null) { %>

                    <strong class="h1">You have no message in inbox!</strong>

                    <% } %>
                    <div class="text-center">
                        <div class="box">
                            <%
                                String[] inboxMessageArray;
                                while (inboxMessages.next()) {
                            %>

                            <div title="Click to see full conversation" class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true">
                                        <small>Message from </small>
                                        <strong><%= inboxMessages.getString("name")%></strong>
                                    </span>
                                </a>
                                <div class="dropdown-menu">
                                    <form class="navbar-form navbar-left" action="send_message" method="POST">
                                        <div class="form-group form-group-lg">
                                            <table class="table table-hover table-responsive">
                                                <%
                                                    inboxMessageArray = inboxMessages.getString("messages_text").split("##@@!!#@#");

                                                    for (int i = 0; i < inboxMessageArray.length; i++) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <small>Date: <%= inboxMessageArray[i].split("##@@!#@#")[0]%></small>
                                                        <br/>
                                                        <strong><%= inboxMessageArray[i].split("##@@!#@#")[1]%></strong>
                                                        <br/>
                                                    </td>
                                                </tr>
                                                <% }%>
                                            </table>
                                        </div>
                                        <br/>
                                        <textarea class="" name="message" placeholder="Write your message here" rows="4" cols="50"></textarea>
                                        <input type="hidden" name="receiverID" value="<%=inboxMessages.getString("u_id")%>" />
                                        <div>
                                            <button class="btn btn-primary hoverable" type="submit" name="button">
                                                <span class="glyphicon glyphicon-send" aria-hidden="true">
                                                    Reply
                                                </span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <% } %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-xs-12 col-sm-12 col-md-6 col-lg-6 text-center">
                <div class="text-capitalize">
                    <strong class="h1">Outbox</strong>
                </div>
                <div class="text-warning">
                    <% if (outboxMessages == null) { %>

                    <strong class="h1">You have no message in outbox!</strong>

                    <% } %>
                    <div class="text-center">
                        <div class="box">
                            <%
                                String[] outboxMessageArray;
                                while (outboxMessages.next()) {
                            %>

                            <div title="Click to see full conversation" class="dropdown">
                                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">
                                    <span class="glyphicon glyphicon-envelope" aria-hidden="true">
                                        <small>Messaged to </small>
                                        <strong><%= outboxMessages.getString("name")%></strong>
                                    </span>
                                </a>
                                <div class="dropdown-menu">
                                    <form class="navbar-form navbar-left" action="send_message" method="POST">
                                        <div class="form-group form-group-lg">
                                            <table class="table table-hover table-responsive">
                                                <%
                                                    outboxMessageArray = outboxMessages.getString("messages_text").split("##@@!!#@#");

                                                    for (int i = 0; i < outboxMessageArray.length; i++) {
                                                %>
                                                <tr>
                                                    <td>
                                                        <small>Date: <%= outboxMessageArray[i].split("##@@!#@#")[0]%></small>
                                                        <br/>
                                                        <strong><%= outboxMessageArray[i].split("##@@!#@#")[1]%></strong>
                                                        <br/>
                                                    </td>
                                                </tr>
                                                <% }%>
                                            </table>
                                        </div>
                                        <br/>
                                        <textarea class="" name="message" placeholder="Write your message here" rows="4" cols="50"></textarea>
                                        <input type="hidden" name="receiverID" value="<%=outboxMessages.getString("u_id")%>" />
                                        <div>
                                            <button class="btn btn-primary hoverable" type="submit" name="button">
                                                <span class="glyphicon glyphicon-send" aria-hidden="true">
                                                    Send Again
                                                </span>
                                            </button>
                                        </div>
                                    </form>
                                </div>
                            </div>

                            <% }%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>