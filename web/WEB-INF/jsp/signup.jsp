<%
    int robotTest = (int) (1 + Math.random() * 100000);
%>
<div class="container-fluid">
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 jumbotron">
            <h1>Sign Up</h1>
            <h3>It's free and always will be</h3>
            <!--Signup Controller-->
            <form class="form" action="signup" onsubmit="
                if(document.getElementById('fullname').style.backgroundColor==='red'){
                    
                    document.getElementById('fullname').focus();
                    return false;
                }
                if(document.getElementById('userID').style.backgroundColor==='red'){
                    
                    document.getElementById('userID').focus();
                    return false;
                }
                if(document.getElementById('password').style.backgroundColor==='red'){
                    
                    document.getElementById('password').focus();
                    return false;
                }
                if(document.getElementById('repeatPassword').style.backgroundColor==='red'){
                    
                    document.getElementById('repeatPassword').focus();
                    return false;
                }
                if(document.getElementById('email').style.backgroundColor==='red'){
                    
                    document.getElementById('email').focus();
                    return false;
                }
                if(document.getElementById('contactNumber').style.backgroundColor==='red'){
                    
                    document.getElementById('contactNumber').focus();
                    return false;
                }
                if(document.getElementById('robotTest2').style.backgroundColor==='red'){
                    
                    document.getElementById('robotTest2').focus();
                    return false;
                }
                if(!document.getElementById('termsAndCondition').checked){
                    
                    document.getElementById('termsAndCondition').focus();
                    return false;
                }
                  " method="POST">
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Full name</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="fullname" onkeyup="checkNull('fullname')" class="form-control" type="text" name="name" placeholder="Full name" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">User ID</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="userID" onkeyup="checkNull('userID')" class="form-control" type="text" name="u_id" placeholder="User ID" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Password</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="password" onkeyup="checkNull('password')" class="form-control" type="password" name="password" placeholder="Password" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Repeat password again</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="repeatPassword" onkeyup="passwordMatching('repeatPassword', 'password')" class="form-control" type="password" name="repeatPassword" placeholder="Repeat password" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Email</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="email" onkeyup="checkNull('email')" class="form-control" type="text" name="email" placeholder="Email" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Contact number</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="contactNumber" onkeyup="checkNull('contactNumber')" class="form-control" type="text" name="contact_num" placeholder="Contact number" />
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
                                <input checked="checked" type="radio" name="gender" value="male" />
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
                        <input id="robotTest1" type="text" name="robotTest1" value="<%=robotTest%>" readonly="readonly" />
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input required="true" id="robotTest2" onkeyup="robotAccessTesting('robotTest2', 'robotTest1')" type="text" name="robotTest2" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <h6 style="color: green">Please Accept Terms & Condition</h6>
                    </div>
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <input required="true" id="termsAndCondition" type="checkbox" name="condition" value="ON" />
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
</div>