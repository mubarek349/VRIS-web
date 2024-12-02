<%@page import="com.vris.helper.IDGen"%>
<form action="RegPerson" id="regPForm" method="post" enctype="multipart/form-data">
    <% String nationalId = IDGen.getNationalID();%>
    <div class="container">
        <div class="row">
            <div class="col">
                <input type="text" name="first_name" id="first_name" class="form-control" placeholder="Firstname" required autofocus><br>
                <input type="text" name="middle_name" id="middle_name" class="form-control" placeholder="Middlename" required><br>
                <input type="text" name="last_name"id="last_name" class="form-control" placeholder="Lastname" required><br>
                <input type="text" name="nationality" id="nationality" class="form-control" placeholder="Nationality" required><br>
                <div class="form-row">
                    <div class="col-5">
                        National ID
                    </div>
                    <div class="col-7">
                        <input type="text" class="form-control" value="<%= nationalId%>" disabled>
                    </div>
                </div><br>
                <p style="color: red">*Memorize or Write down the National ID for later use</p>
                <input type="text" name="national_id" class="form-control" value="<%= nationalId%>" hidden>
                <div class="form-row">
                    <div class="col-4">
                        Gender
                    </div>
                    <div class="col-8">
                        <select name="gender" class="form-control">
                            <option value="Male" selected>Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>
            </div>

            <div class="col">
                <input type="text" name="dob" id="dob" class="form-control" placeholder="Date of Birth" required><br>
                <div class="form-row">
                    <div class="col"> 
                        <input type="text" name="birthplace" id="birthplace2" class="form-control" placeholder="Country of birth" required>
                    </div>
                    <div class="col">
                        <input type="text" name="residence" id="residence2" class="form-control" placeholder="Country of residence" required>
                    </div>
                </div><br>
                <div class="form-row">
                    <div class="col-4"> 
                        Ethnicity
                    </div>
                    <div class="col-8">
                        <select name="ethnicity" class="form-control">
                            <%@include file="ethnicity.jsp" %>
                        </select>
                    </div>
                </div><br>

                <input type="text" name="religion" id="religion2" class="form-control" placeholder="Religion" required><br>
                <input type="text" name="education" id="education2" class="form-control" placeholder="Educational Background" required><br>
                <input type="text" name="occupation"id="occupation2" class="form-control" placeholder="Occupation" required><br>    
                <div class="form-row">
                    <div class="col-3">Photo </div>
                    <div class="col-9"><input type="file" name="photo" required></div>
                </div>

                <input type="text" name="idtype" value="idonly" hidden>
                <input type="text" name="weburl" id="regweburl" hidden>
            </div>
        </div><br>
        <button class="btn btn-lg btn-primary btn-block col-2 offset-5" type="submit">Register</button>
    </div>
</form>