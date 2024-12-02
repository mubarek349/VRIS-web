<form action="RegPerson" id="regPIForm" method="post" enctype="multipart/form-data">
    <div class="container">
        <div class="row">
            <div class="offset-3 col-5">
                <input type="text" name="birth_reg_no" id="birth_reg_no" class="form-control" placeholder="Birth Registration Number" required><br>
                <div class="form-row">
                    <div class="col"> 
                        <input type="text" name="birthplace" id="birthplace" class="form-control" placeholder="Country of birth" required>
                    </div>
                    <div class="col">
                        <input type="text" name="residence" id="residence" class="form-control" placeholder="Country of residence" required>
                    </div>
                </div><br>
                <div class="form-row">
                    <div class="col-4"> 
                        &nbsp;Ethnicity
                    </div>
                    <div class="col-8">
                        <select name="ethnicity" class="form-control">
                            <%@include file="ethnicity.jsp" %>
                        </select>
                    </div>
                </div><br>
                <input type="text" name="religion" id="religion" class="form-control" placeholder="Religion" required><br>
                <input type="text" name="education" id="education" class="form-control" placeholder="Educational Background" required><br>
                <input type="text" name="occupation" id="occupation" class="form-control" placeholder="Occupation" required><br> 
                <div class="form-row">
                    <div class="col-3">Photo </div>
                    <div class="col-9"><input type="file" name="photo" required></div>
                </div>
                <input type="text" name="idtype" value="idwithbirth" hidden>
                <input type="text" name="weburl" id="regwbweburl" hidden>
            </div>
        </div><br>
        <button class="btn btn-lg btn-primary btn-block col-2 offset-5" type="submit">Register</button>
    </div>
</form>