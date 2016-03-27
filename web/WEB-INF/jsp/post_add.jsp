<%@page import="java.sql.ResultSet"%>
<div class="container-fluid">
    <div class="row jumbotron">
        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <h2 style="align-self: center;">Search in new decade!</h2>
            <div>
                <div id="map" style="width: 100%;height: 528px;">
                </div>
            </div>
        </div>

        <div class="col-xs-12 col-sm-6 col-md-6 col-lg-6">
            <h1>Post An Add</h1>
            <h3>Please fill all necessary field carefully and correctly</h3>
            <!--PostAdd.java Controller-->
            <form class="form" action="post_add" method="POST">
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Poster ID</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="posterID" class="form-control" type="text" name="posterID" value="${userInformation.u_id}" readonly="readonly" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Address</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="address" onkeyup="checkNull('address')" class="form-control" type="text" name="adress" placeholder="Address" />
                        <input class="btn btn-success" type="button" value="Search" onclick="codeAddress()">
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Post Type</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <select class="" required="true" id="type" name="type" placeholder="Post Type" >
                            <option>Seat</option>
                            <option>Room</option>
                        </select>
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Available Vacancy</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="vacancy" onkeyup="checkNull('vacancy')" class="form-control" type="text" name="vacancy" placeholder="Available Vacancy" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Post Deadline</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="deadline" onkeyup="checkNull('deadline')" class="form-control" type="text" name="deadline" placeholder="Post Deadline" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Rent</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="rent" onkeyup="checkNull('rent')" class="form-control" type="text" name="rent" placeholder="Rent" />
                    </div>
                </div>    
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Utility Cost</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <input required="true" id="utility" onkeyup="checkNull('utility')" class="form-control" type="text" name="utility" placeholder="Utility Cost" />
                    </div>
                </div>
                <div class="row form-padding">
                    <div class="col-xs-4 col-sm-4 col-md-4 col-lg-4">
                        <span class="label label-success">Special Facility</span>
                    </div>
                    <div class="col-xs-8 col-sm-8 col-md-8 col-lg-8">
                        <p>Describe some special facility you are providing within 200 character</p>
                        <textarea required="true" id="facility" onkeyup="checkNull('facility')" class="form-control" type="text" name="facility" rows="4" cols="20"></textarea>
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