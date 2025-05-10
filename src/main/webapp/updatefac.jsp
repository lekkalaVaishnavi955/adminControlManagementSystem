<%@page import="com.klef.jfsd.project.model.Faculty"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Faculty fac = (Faculty) session.getAttribute("faculty");
if(fac==null)
{
    response.sendRedirect("facsessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Faculty Profile</title>
    <link rel="icon" href="/images/PLogo.png" type="image/x-icon" />

    <script>
    // JavaScript validation for Password, Contact and DOB
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
    <%@include file="facnavbar.jsp" %>

    <div class="rig-contt">
        <h4 align="center" style="color:red; margin: 20px;">
            <c:out value="${message}"></c:out>
        </h4>

        <h3 style="margin-left: 260px; margin-bottom: 40px;"><u>Update Employee Profile</u></h3>
        <div class="form-container" style="height: 380px;">
            <form method="post" action="updatefacprofile" onsubmit="return validateForm();">
                <table>
                    <tr>
                        <td><label for="fid">Faculty ID</label></td>
                        <td><input type="number" id="fid" name="fid" readonly value="<%= fac.getId() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fname">Enter Name</label></td>
                        <td><input type="text" id="fname" name="fname" value="<%= fac.getName() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td>
                            <input type="radio" id="male" name="fgender" value="MALE" <%= fac.getGender().equals("MALE") ? "checked" : "" %> required/>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="fgender" value="FEMALE" <%= fac.getGender().equals("FEMALE") ? "checked" : "" %> required/>
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="fgender" value="OTHERS" <%= fac.getGender().equals("OTHERS") ? "checked" : "" %> required/>
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="fdob">Enter Date of Birth</label></td>
                        <td><input type="date" id="fdob" name="fdob" value="<%= fac.getDateofbirth() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fdept">Select Department</label></td>
                        <td>
                            <select id="fdept" name="fdept" required>
                                <option value="">---Select---</option>
                                <option value="TECHNICAL" <%= fac.getDepartment().equals("TECHNICAL") ? "selected" : "" %>>Technical</option>
                                <option value="MARKETING" <%= fac.getDepartment().equals("MARKETING") ? "selected" : "" %>>Marketing</option>
                                <option value="SALES" <%= fac.getDepartment().equals("SALES") ? "selected" : "" %>>Sales</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="flocation">Enter Location</label></td>
                        <td><input type="text" id="flocation" name="flocation" value="<%= fac.getLocation() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="femail">Enter Email ID</label></td>
                        <td><input type="email" id="femail" name="femail" readonly value="<%= fac.getEmail() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fpwd">Enter Password</label></td>
                        <td><input type="password" id="fpwd" name="fpwd" value="<%= fac.getPassword() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="fcontact">Enter Contact</label></td>
                        <td><input type="text" id="fcontact" name="fcontact" maxlength="10" value="<%= fac.getContact() %>" required/></td>
                    </tr>
                    <tr>
                        <td colspan="2" class="button-container">
                            <input type="submit" value="Update" id="sub"/>
                            <input type="reset" value="Clear" id="clea"/>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
</body>
</html>
