<diV>
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
</diV>