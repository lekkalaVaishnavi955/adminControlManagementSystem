<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html; charset=UTF-8" isELIgnored="false"%>
<%@page import="com.klef.jfsd.project.model.Student"%>
<%
Student stu = (Student) session.getAttribute("student");
if(stu==null)
{
    response.sendRedirect("stusessionexpiry");
    return;
}
%>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Upload Project</title>
    <link rel="icon" href="/images/PLogo.png" type="image/x-icon" />

    <script>
    function validateUploadForm() {
        var projectNumber = document.getElementById("projectnumber").value.trim();
        var projectName = document.getElementById("projectname").value.trim();
        var projectDescription = document.getElementById("projectdescription").value.trim();
        var projectUrl = document.getElementById("projecturl").value.trim();
        var facultyId = document.getElementById("facultyId").value;

        // Validate Project Number (only letters, numbers allowed)
        var projectNumberRegex = /^[A-Za-z0-9\-]+$/;
        if (!projectNumberRegex.test(projectNumber)) {
            alert("Project Number must contain only letters, numbers, and hyphens.");
            return false;
        }

        // Validate Project Name
        if (projectName.length < 3) {
            alert("Project Name must be at least 3 characters long.");
            return false;
        }

        // Validate Project Description
        if (projectDescription.length < 20) {
            alert("Project Description must be at least 20 characters long.");
            return false;
        }

        // Validate URL (if entered)
        if (projectUrl.length > 0) {
            var urlRegex = /^(https?:\/\/)?([\w\-]+\.)+[\w\-]+(\/[\w\-]*)*\/?$/;
            if (!urlRegex.test(projectUrl)) {
                alert("Please enter a valid Project URL starting with http:// or https://");
                return false;
            }
        }

        // Validate Faculty selection
        if (facultyId === "") {
            alert("Please select a Faculty.");
            return false;
        }

        return true; // Passed all checks
    }
    </script>
</head>
<body>

<%@ include file="stunavbar.jsp" %> 

<div class="rig-contttt">
    <h3 style="margin-left: 300px; margin-bottom: 40px;"><u>Upload Project</u></h3>
    <br>

    <form action="uploadproject" method="post" class="form-container" style="height: 250px;" onsubmit="return validateUploadForm();">

        <table align="center">
            <!-- Student ID (hidden) -->
            <input type="hidden" name="studentId" value="<%= stu.getId() %>" />

            <!-- Project Number -->
            <tr>
                <td><label for="projectnumber">Project Number</label></td>
                <td><input type="text" id="projectnumber" name="projectnumber" required /></td>
            </tr>

            <!-- Project Name -->
            <tr><td></td></tr>
            <tr>
                <td><label for="projectname">Project Name</label></td>
                <td><input type="text" id="projectname" name="projectname" required /></td>
            </tr>

            <!-- Project Description -->
            <tr><td></td></tr>
            <tr>
                <td><label for="projectdescription">Description</label></td>
                <td><textarea id="projectdescription" name="projectdescription" required></textarea></td>
            </tr>

            <!-- Project URL -->
            <tr><td></td></tr>
            <tr>
                <td><label for="projecturl">Project URL</label></td>
                <td><input type="text" id="projecturl" name="projecturl" /></td>
            </tr>

            <!-- Faculty Dropdown -->
            <tr><td></td></tr>
            <tr>
                <td><label for="facultyId">Faculty</label></td>
                <td>
                    <select id="facultyId" name="facultyId" required>
                        <option value="" disabled selected>Select Faculty</option>
                        <c:forEach var="faculty" items="${faculties}">
                            <option value="${faculty.id}">${faculty.name}</option>
                        </c:forEach>
                    </select>
                </td>
            </tr>

            <!-- Submit Button -->
            <tr><td></td></tr>
            <tr><td></td></tr>
            <tr align="center">
                <td colspan="2"><input type="submit" value="Upload Project" class="button" id="clearrr"/></td>
            </tr>
        </table>

    </form>

    <!-- Display Error/Success Messages -->
    <c:if test="${not empty errorMessage}">
        <p style="color: red; text-align: center;">${errorMessage}</p>
    </c:if>

    <c:if test="${not empty successMessage}">
        <p style="color: green; text-align: center;">${successMessage}</p>
    </c:if>
</div>
</body>
</html>
