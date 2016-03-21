<%@page import="com.models.UserInformation"%>
<%@page import="com.util.GetBeans"%>
<%    
    UserInformation userInformation = (UserInformation) GetBeans.getBean("userInformation");
    if (userInformation != null) {
        
        response.sendRedirect("home");
    }
%>
<div class="container-fluid">
    <h1>${errorMessage}</h1>
    <div class="row">
        <div class="col-xs-12 col-sm-6 col-md-4 col-lg-4">
        </div>
    </div>
</div>

<!--<div class="container-fluid">
    <div class="row">
        <div class="col-sm-1">
            
        </div>
    </div>
</div>-->



<!--<div class="container-fluid">
    <div class="row">
        <div class="col-lg-4 col-lg-offset-4">
            <input id="address" type="textbox" placeholder="Enter Address">
            <input type="button" value="Encode" onclick="codeAddress()">
        </div>
    </div>
</div>-->

<!--<div id="map" >
</div>-->

<!--<div class="container">
    <div class="row">
        <div class="col-lg-2 col-lg-offset-5">
            <input id="show" type="button" value="SHOWMAP" onclick="show('map');" />
            <input id="hide"  type="button" value="HIDEMAP" onclick="hide('map');" />
        </div>

    </div>
</div>-->