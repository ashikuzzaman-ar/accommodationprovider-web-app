<%@page import="java.sql.ResultSet"%>


<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1">
            
        </div>
    </div>
</div>



<div class="container-fluid">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <input id="address" type="textbox" placeholder="Enter Address">
            <input type="button" value="Encode" onclick="codeAddress()">
        </div>
    </div>
</div>

<div id="map" >
</div>

<div class="container">
    <div class="row">
        <div class="col-lg-2 col-lg-offset-5">
            <input id="show" type="button" value="SHOWMAP" onclick="show('map');" />
            <input id="hide"  type="button" value="HIDEMAP" onclick="hide('map');" />
        </div>

    </div>
</div>