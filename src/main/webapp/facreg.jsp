<%@page import="com.klef.jfsd.project.model.Admin"%>
<%
 Admin admin = (Admin) session.getAttribute("admin");
 if (admin == null) {
     response.sendRedirect("adminsessionexpiry");
     return;
 }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Faculty Registration</title>
    <link rel="icon" href="/images/PLogo.png" type="image/x-icon" />

    <script>
    // JavaScript to validate Date of Birth, Password and Contact Number
    window.onload = function() {
        var today = new Date().toISOString().split('T')[0];
        document.getElementById("fdob").setAttribute("max", today);
    };

    function validateForm() {
        // Validate DOB
        var dobInput = document.getElementById("fdob").value;
        if (!dobInput) {
            alert("Please select your Date of Birth.");
            return false;
        }

        var dob = new Date(dobInput);
        var today = new Date();

        if (dob > today) {
            alert("Date of Birth cannot be in the future.");
            return false;
        }

        var age = today.getFullYear() - dob.getFullYear();
        var month = today.getMonth() - dob.getMonth();
        if (month < 0 || (month === 0 && today.getDate() < dob.getDate())) {
            age--;
        }

        if (age < 21) {
            alert("Faculty must be at least 21 years old.");
            return false;
        }

        // Validate Password
        var password = document.getElementById("fpwd").value;
        var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$/;

        if (!passwordRegex.test(password)) {
            alert("Password must be at least 8 characters long, include 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character (@#$%^&+=!).");
            return false;
        }

        // Validate Contact Number
        var contact = document.getElementById("fcontact").value.trim();
        var contactRegex = /^[6-9]\d{9}$/;

        if (!contactRegex.test(contact)) {
            alert("Contact number must be a valid 10-digit Indian mobile number starting with 6, 7, 8, or 9.");
            return false;
        }

        return true; // all validations passed
    }
    </script>

</head>
<body>
    <%@include file="adminnavbar.jsp" %>

    <div class="rig-contt">
        <h3 style="margin-left: 300px; margin-bottom: 40px;"><u>Faculty Registration</u></h3>
        <div class="form-container" style="height: 340px;">
            <form method="post" action="insertfac" onsubmit="return validateForm();">
                <table>
                    <tr>
                        <td><label for="fname">Enter Name</label></td>
                        <td><input type="text" id="fname" name="fname" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="fgender" value="MALE" required/>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="fgender" value="FEMALE" required/>
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="fgender" value="OTHERS" required/>
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="fdob">Enter Date of Birth</label></td>
                        <td><input type="date" id="fdob" name="fdob" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fdept">Select Department</label></td>
                        <td>
                            <select id="fdept" name="fdept" required>
                                <option value="">---Select---</option>
                                <option value="CSE">CSE</option>
                                <option value="CSIT">CSIT</option>
                                <option value="ECE">ECE</option>
                                <option value="ECS">ECS</option>
                                <option value="EEE">EEE</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="flocation">Enter Location</label></td>
                        <td><input type="text" id="flocation" name="flocation" required/></td>
                    </tr>
                    <tr>
                        <td><label for="femail">Enter Email ID</label></td>
                        <td><input type="email" id="femail" name="femail" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fpwd">Enter Password</label></td>
                        <td><input type="password" id="fpwd" name="fpwd" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fcontact">Enter Contact</label></td>
                        <td><input type="text" id="fcontact" name="fcontact" required maxlength="10"/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Register" id="sub"/>
                            <input type="reset" value="Clear" id="clea"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
