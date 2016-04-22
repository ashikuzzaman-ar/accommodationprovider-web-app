<div class="container">
    <div class="jumbotron">
        <div class="row">
            <div class="col-lg-12">
                <div class="text-center">
                    <div class="intro-text">
                        <hr/>
                        <strong class="h1">Change Your Password</strong>
                        <hr/>
                    </div>
                    <!--Profile.java Controller-->
                    <form action="change_password" method="POST" class="form">
                        <input onkeyup="checkNull('oldPassword')" id="oldPassword" required="true" class="form-control" type="password" name="oldPassword" placeholder="Old Password"/>
                        <input onkeyup="checkNull('newPassword')" id="newPassword" required="true" class="form-control" type="password" name="newPassword" placeholder="New Password"/>
                        <input onkeyup="passwordMatching('repeatNewPassword', 'newPassword')" id="repeatNewPassword" required="true" class="form-control" type="password" name="repeatNewPassword" placeholder="Repeat New Password"/>
                        <br/>
                        <br/>
                        <button class="btn btn-info left" type="reset" name="">
                            Reset Filds
                        </button>
                        <button class="btn btn-primary right" type="submit" name="changePassword">
                            Change Password
                        </button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
