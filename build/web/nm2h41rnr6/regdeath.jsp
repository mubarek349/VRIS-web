<div class="container">
    <form action="RegDeath" method="POST">
        <div class="row">              
            <div class="col">
                <h6>Place Of Registration</h6> 
                <div class="form-row">
                    <div class="col">
                        <select name="rRegion" class="form-control" id="rdRegion">
                            <%@include file="region.jsp" %>
                        </select>
                    </div>
                    <div class="col">
                        <select id="rdZone" class="form-control" name="rZone">
                            <option>Select Zone</option>

                        </select>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="rCity" class="form-control" placeholder="City" required>
                    </div>
                    <div class="col">
                        <input type="text" name="rSubcity" class="form-control" placeholder="SubCity" required>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="rDistrict"class="form-control" placeholder="District/Special District" required>
                    </div>
                    <div class="col">
                        <input type="text" name="rKebele" class="form-control" placeholder="Kebele" required>
                    </div>
                </div>
                <hr>
                <h6> Deceased Information</h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="decNidentity" class="form-control" placeholder="National ID Number" required>
                    </div>
                    <div class="col">
                        <input type="text" name="decBirthID" class="form-control" placeholder="Birth Registration Number" required>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="title" class="form-control" placeholder="Title">
                    </div>
                    <div class="col">
                        <select name="mstatus" class="form-control">
                            <option>Select Marital Status</option>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                            <option value="Widowed">Widowed</option>
                            <option value="Divorced">Divorced</option>
                        </select>
                    </div>
                </div>
                <hr>
                <h6> Info about Registrar</h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="relNidentity" class="form-control" placeholder="National ID Number" required>
                    </div>
                    <div class="col">
                        <input type="text" name="relation" class="form-control" placeholder="Relation with the deceased" required>
                    </div>
                </div>
            </div>

            <div class="col">
                <h6>Death Information</h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="dod" id="dod" class="form-control" placeholder="Date of Death" required>
                    </div>
                    <div class="col">
                        <input type="text" name="institution" class="form-control" placeholder="Institution" required>
                    </div>
                </div>
                <br>
                Place of Death
                <div class="form-row">
                    <div class="col">
                        <select name="dRegion" class="form-control" id="dRegion">
                            <%@include file="region.jsp" %>
                        </select>
                    </div>
                    <div class="col">
                        <select id="dZone" class="form-control" name="dZone">
                            <option>Select Zone</option>

                        </select>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="dCity" class="form-control" placeholder="City" required>
                    </div>
                    <div class="col">
                        <input type="text" name="dSubcity" class="form-control" placeholder="SubCity" required>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="dDistrict"class="form-control" placeholder="District/Special District" required>
                    </div>
                    <div class="col">
                        <input type="text" name="dKebele" class="form-control" placeholder="Kebele" required>
                    </div>
                </div><br>
                <input type="text" name="cause" class="form-control" placeholder="Cause of Death" required><br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="evidencetype" class="form-control" placeholder="Type of Evidence" required><br>
                    </div>
                    <div class="col">
                        <input type="text" name="evidenceid" class="form-control" placeholder="Evidence ID" required><br>
                    </div>
                </div>

                <input type="text" name="burial" class="form-control" placeholder="Place of burial" required>
                <input type="text" name="rtNidentity" value="${userID}" class="form-control" hidden>
                <input type="text" name="weburl" id="dWeburl" hidden>
            </div>
        </div><br>
        <div class="offset-4">
            <button type="submit" class="btn btn-success btn-lg"> Register</button>
            <button type="reset" class="btn btn-warning btn-lg">Reset</button>
            <button type="button" id="dBtnCancel" class="btn btn-danger btn-lg">Cancel</button>
        </div>
    </form>
</div>
<script>
    $(document).ready(function () {
        $("#rdRegion").on("change", function () {
            var region_id = $("#rdRegion").val();
            $.ajax({
                url: "nm2h41rnr6/zone.jsp",
                data: {region_id: region_id},
                method: "POST",
                success: function (data) {
                    $("#rdZone").html(data);
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        $("#dRegion").on("change", function () {
            var region_id = $("#dRegion").val();
            $.ajax({
                url: "nm2h41rnr6/zone.jsp",
                data: {region_id: region_id},
                method: "POST",
                success: function (data) {
                    $("#dZone").html(data);
                }
            });
        });
    });
</script>