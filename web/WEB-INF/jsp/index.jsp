<div>


    <div class="jumbotron centered ">
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

<script>
    function validate() {

        var usernameempty = 0;
        var passwordempty = 0;
        var confirmpassempty = 0;
        var emailempty = 0;
        var contactempty = 0;
        var element;
        var span;
        var password;
        var confirmpassword;
        var bothpasswordsame = 0;

        element = document.getElementById("username");
        span = document.getElementById("userspan");
        if (element.value === "") {
            span.style.visibility = "visible";
            usernameempty = 1;
        } else {

            span.style.visibility = "hidden";
            usernameempty = 0;
        }


        element = document.getElementById("password");
        password = element.value;
        span = document.getElementById("passwordspan");
        if (element.value === "") {
            span.style.visibility = "visible";
            passwordempty = 1;
        } else {

            span.style.visibility = "hidden";
            passwordempty = 0;
        }

        element = document.getElementById("confirmpass");
        confirmpassword = element.value;
        span = document.getElementById("confirmspan");
        if (element.value === "") {
            span.style.visibility = "visible";
            confirmpassempty = 1;
        } else {

            span.style.visibility = "hidden";
            confirmpassempty = 0;
        }

        span = document.getElementById("passwordmatchspan");
        if (password !== confirmpassword) {
            span.style.visibility = "visible";
            bothpasswordsame = 1;
        } else {
            span.style.visibility = "hidden";
            bothpasswordsame = 0;
        }


        element = document.getElementById("email");
        span = document.getElementById("emailspan");
        if (element.value === "") {
            span.style.visibility = "visible";
            emailempty = 1;
        } else {

            span.style.visibility = "hidden";
            emailempty = 0;
        }

        element = document.getElementById("contact");
        span = document.getElementById("contactspan");
        if (element.value === "") {
            span.style.visibility = "visible";
            contactempty = 1;
        } else {

            span.style.visibility = "hidden";
            contactempty = 0;
        }

        if (usernameempty === 0 && passwordempty === 0 && emailempty === 0 && contactempty === 0 && confirmpassempty === 0 && bothpasswordsame === 0) {
            return true;
        } else {
            return false;
        }

    }
</script>