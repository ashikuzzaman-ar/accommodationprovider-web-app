<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">

        </div>




        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 jumbotron">
            <h1>Sign Up</h1>
            <h3>It's free and always will be.</h3>
            <form class="form" action="#" method="POST">
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Full name</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input class="form-control" type="text" name="fullName" placeholder="Full name" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">User ID</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input class="form-control" type="text" name="userID" placeholder="User ID" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Password</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input class="form-control" type="password" name="password" placeholder="Password" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Repeat password again</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input class="form-control" type="password" name="repeatPassword" placeholder="Repeat password" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Email</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input class="form-control" type="text" name="email" placeholder="Email" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Contact number</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input class="form-control" type="text" name="contactNumber" placeholder="Contact number" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Choose Gender</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <div class="row">
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <label class="label-warning">Male</label>
                                <input class="" type="radio" name="gender" value="male" />
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <label class="label-warning">Female</label>
                                <input type="radio" name="gender" value="female" />
                            </div>
                            <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                                <label class="label-warning">Other</label>
                                <input type="radio" name="gender" value="other" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <h6 style="color: green">Type this to right side box</h6>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input type="text" name="robotTest1" value="" readonly="readonly" />
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input type="text" name="robotTest2" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <h6 style="color: green">Please Accept Terms & Condition</h6>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input type="checkbox" name="condition" value="ON" />
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <a href="#">Terms & Condition</a>
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 form-padding">
                        <input class="btn btn-primary btn-lg" type="submit" value="Confirm" name="confirm" />
                    </div>
                    <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6 form-padding">
                        <input class="btn btn-info btn-lg" type="reset" value="Reset" name="reset" />
                    </div>
                </div>
            </form>
        </div>
    </div>



    <div class="jumbotron">
        <div class="form">

            <form name="signupform">
                <table>
                    <tr>
                        <th style="padding-right: 10px">Username : </th>
                        <td><input type="text" name="username" id="username" size="50">
                        </td>
                        <td> <span class="error" name="userspan" id="userspan">This field is required</span></td>
                    </tr>

                    <tr></tr>


                    <tr>
                        <th style="padding-right: 10px">Password : </th>
                        <td><input type="password" name="password" id="password" size="50">
                        </td>
                        <td> <span class="error" name="passwordspan" id="passwordspan">This field is required</span></td>
                    </tr>

                    <tr></tr>

                    <tr>
                        <th style="padding-right: 10px">Confirm Password : </th>
                        <td><input type="password" name="confirmpass" id="confirmpass" size="50">
                        </td>
                        <td> <span class="error" name="confirmspan" id="confirmspan">This field is required</span></td>
                    </tr>




                    <tr>
                        <th style="padding-right: 10px">Email : </th>
                        <td><input type="text" name="email" id="email" size="50">
                        </td>
                        <td> <span class="error" name="emailspan" id="emailspan">This field is required</span></td>
                    </tr>

                    <tr></tr>

                    <tr>
                        <th style="padding-right: 10px">Contact Number : </th>
                        <td><input type="text" name="contact" id="contact" size="50">
                        </td>
                        <td> <span class="error" name="contactspan" id="contactspan">This field is required</span></td>
                    </tr>

                    <tr></tr>


                </table>
                <table>
                    <tr>
                        <td>
                            <span class="error" name="passwordmatchspan" id="passwordmatchspan" style="margin-top: 15px; font-size: xx-large; margin-bottom: 10em">PLEASE RE-CONFIRM PASSWORD</span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="submit" onclick="return validate();" value="SIGNUP" style="background-color: green; margin-left: 20px; margin-top: 30px">
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</div>