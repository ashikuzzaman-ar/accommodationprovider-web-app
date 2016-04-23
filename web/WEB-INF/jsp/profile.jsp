<div class="container">
    <div class="jumbotron">
        <div class="row">
            <!--<div class="jumbotron">-->
            <div class="box">
                <div class="col-lg-12">
                    <div class="text-center">
                        <div class="intro-text">
                            <hr/>
                            <strong class="h1">Profile Details</strong>
                            <hr/>
                        </div>
                    </div>
                    <!--Signup.java Controller-->
                    <form class="form" action="update_profile" method="POST">
                        <table class="table-striped table-hover font-medium table-responsive">
                            <tr class="">
                                <td class="text-left hidden-xs">User ID: </td>
                                <td class="text-center">
                                    <input class="form-control" type="text" id="u_id" name="u_id" value="<%=this.userInformation.getU_id()%>" disabled="true"/>
                                </td>
                                <td class="text-left">
                                    <button class="btn btn-info" type="button" disabled="true">
                                        Edit ID
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left hidden-xs">Username: </td>
                                <td class="text-center">
                                    <input class="form-control" type="text" id="name" name="name" value="<%=this.userInformation.getName()%>" disabled="true" />
                                </td>
                                <td class="text-left">
                                    <button class="btn btn-info" type="button" onclick="changeDisability('name');">
                                        Edit Name
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left hidden-xs">Email: </td>
                                <td class="text-center">
                                    <input class="form-control" type="text" id="email" name="email" value="<%=this.userInformation.getEmail()%>" disabled="true" />
                                </td>
                                <td class="text-left">
                                    <button class="btn btn-info" type="button" onclick="changeDisability('email');">
                                        Edit Email ID
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left hidden-xs">Contact Number: </td>
                                <td class="text-center">
                                    <input class="form-control" type="text" id="contact_num" name="contact_num" value="<%=this.userInformation.getContact_num()%>" disabled="true" />
                                </td>
                                <td class="text-left">
                                    <button class="btn btn-info" type="button" onclick="changeDisability('contact_num');">
                                        Edit Contact Number
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td class="text-left hidden-xs">Gender: </td>
                                <td class="text-center">
                                    <input class="form-control" type="text" id="gender" name="gender" value="<%= this.userInformation.getGender()%>" disabled="true" />
                                </td>
                                <td class="text-left">
                                    <button class="btn btn-info" type="button" disabled="true">
                                        Please don't edit this!
                                    </button>
                                </td>
                            </tr>
                        </table>
                        <hr/>
                        <br/>
                        <div>
                            <a class="btn btn-primary left" href="index">Back to Home</a>
                            <button class="btn btn-success right" type="submit" onclick="
                                    setEditableTextField('u_id');
                                    setEditableTextField('name');
                                    setEditableTextField('email');
                                    setEditableTextField('contact_num');
                                    setEditableTextField('gender');">

                                Update Profile
                            </button>
                        </div>
                    </form>
                </div>
            </div>
            <!--</div>-->
        </div>
    </div>
</div>