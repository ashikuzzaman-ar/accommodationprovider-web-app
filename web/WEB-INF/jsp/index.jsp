<%@page import="java.sql.ResultSet"%>
<!--<div class="container-fluid">
        <div class="container">
            <div class = "alert alert-danger alert-dismissable">
                <button type = "button" class = "close" data-dismiss = "alert" aria-hidden = "true">
                    &times;
                </button>
                <h4></h4>
            </div>
        </div>
    <div class="jumbotron">
        <span class="font-large">Welcome to UIU Accommodation Provider</span>
    </div>
        <div class="container">
            <div id="sample" style="width:900px;height:580px;"></div>
        </div>
</div>-->

<script>
    <%@include file="../resources/js/google_map_with_geolocation.js"  %>
</script>
<div class="container-fluid">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <input id="address" type="textbox" placeholder="Enter place">
            <input type="button" value="Encode" onclick="codeAddress()">
        </div>
    </div>
</div>

<div id="map" >
</div>




<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCXA5uxjjER6J_Y5PeXLGevkfOfELYaCrY&libraries=places&callback=initialize"
        async defer>
</script>

<div class="container">
    <div class="row">
        <div class="col-lg-2 col-lg-offset-5">
            <input id="show" type="button" value="SHOWMAP" onclick="show('map');" />
            <input id="hide"  type="button" value="HIDEMAP" onclick="hide('map');" />
        </div>

    </div>
</div>