<div class="container">
    <div class="row">
        <div class="jumbotron">
            <div class="box">
                <div class="col-lg-12">
                    <div class="text-center">
                        <div class="intro-text">
                            <hr/>
                            <strong class="h1">Profile Details</strong>
                            <hr/>
                        </div>
                    </div>
                    <table class="table-striped table-hover font-medium">
                        <tr>
                            <td class="text-left">User ID: </td>
                            <td class="text-right">${userInformation.u_id}</td>
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
    </div>
</div>