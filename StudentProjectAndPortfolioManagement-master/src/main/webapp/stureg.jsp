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
    <title>Student Registration</title>
    <link rel="icon" href="/images/PLogo.png" type="image/x-icon" />

    <script>
    // JavaScript to validate Date of Birth, Password and Contact
    window.onload = function() {
        var today = new Date().toISOString().split('T')[0];
        document.getElementById("sdob").setAttribute("max", today);
    };

    function validateForm() {
        // Validate DOB
        var dobInput = document.getElementById("sdob").value;
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

        if (age < 17) {
            alert("Student must be at least 17 years old.");
            return false;
        }

        // Validate Password
        var password = document.getElementById("spwd").value;
        var passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@#$%^&+=!]).{8,}$/;
        if (!passwordRegex.test(password)) {
            alert("Password must be at least 8 characters long, include 1 uppercase letter, 1 lowercase letter, 1 number, and 1 special character (@#$%^&+=!).");
            return false;
        }

        // Validate Contact Number
        var contact = document.getElementById("scontact").value.trim();
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
    <%@include file="adminsnavbar.jsp" %>

    <div class="rig-contt">
        <h3 style="margin-left: 300px; margin-bottom: 40px;"><u>Student Registration</u></h3>
        <div class="form-container">
            <form method="post" action="insertstu" onsubmit="return validateForm();">
                <table>
                    <tr>
                        <td><label for="sname">Enter Name</label></td>
                        <td><input type="text" id="sname" name="sname" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="sgender" value="MALE" required/>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="sgender" value="FEMALE" required/>
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="sgender" value="OTHERS" required/>
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="sdob">Enter Date of Birth</label></td>
                        <td><input type="date" id="sdob" name="sdob" required/></td>
                    </tr>
                    <tr>
                        <td><label for="sdept">Select Department</label></td>
                        <td>
                            <select id="sdept" name="sdept" required>
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
                        <td><label for="slocation">Enter Location</label></td>
                        <td><input type="text" id="slocation" name="slocation" required/></td>
                    </tr>
                    <tr>
                        <td><label for="semail">Enter Email ID</label></td>
                        <td><input type="email" id="semail" name="semail" required/></td>
                    </tr>
                    <tr>
                        <td><label for="spwd">Enter Password</label></td>
                        <td><input type="password" id="spwd" name="spwd" required/></td>
                    </tr>
                    <tr>
                        <td><label for="scontact">Enter Contact</label></td>
                        <td><input type="text" id="scontact" name="scontact" maxlength="10" required/></td>
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
