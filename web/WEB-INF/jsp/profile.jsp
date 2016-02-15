<div class="container-fluid">
    <div class="container">
        <div class="col-xs-12 col-sm-6 col-sm-offset-3 col-md-6 col-md-offset-3 col-lg-6 col-lg-offset-3 jumbotron">
            <h3 class="font-large">Profile Details</h3>
            <table class="table-striped table-hover font-medium">
                <tr>
                    <td>User ID: </td>
                    <td>${userInformation.u_id}</td>
                </tr>
                <tr>
                    <td>Username: </td>
                    <td>${userInformation.name}</td>
                </tr>
                <tr>
                    <td>Email: </td>
                    <td>${userInformation.email}</td>
                </tr>
                <tr>
                    <td>Contact Number: </td>
                    <td>${userInformation.contact_num}</td>
                </tr>
                <tr>
                    <td>Gender: </td>
                    <td>${userInformation.gender}</td>
                </tr>
            </table>
        </div>
    </div>
</div>