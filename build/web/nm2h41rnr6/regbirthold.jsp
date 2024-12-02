<%@page import="com.vris.helper.IDGen"%>

<div class="container">
    <form action="RegBirth" method="POST">
        <div class="row">
            <div class="col">
                <h6>Place Of Registration</h6> 
                <div class="form-row">
                    <div class="col-2">
                        Region
                    </div>
                    <div class="col-5">
                        <select name="rRegion" class="form-control" id="roRegion">
                            <%@include file="region.jsp" %>
                        </select>
                    </div>
                    <div class="col-5">
                        <select id="roZone" class="form-control" name="rZone">
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
                <h6> Mother Information </h6>
                <input type="text" name="mNidentity" class="form-control" placeholder="National ID Number">
                <br>
                <div class="form-row">
                    <div class="col-5">
                        Marital Status
                    </div>
                    <div class="col-7">
                        <select name="mMstatus" class="form-control">
                            <option value="">Select Marital Status</option>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                            <option value="Widowed">Widowed</option>
                            <option value="Divorced">Divorced</option>
                        </select>
                    </div>
                </div> <hr>
                <h6> Father Information </h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="fNidentity" class="form-control" placeholder="National ID Number">
                    </div>
                </div><br>
                <div class="form-row">
                    <div class="col-5">
                        Marital Status
                    </div>
                    <div class="col-7">
                        <select name="fMstatus" class="form-control">
                            <option value="">Select Marital Status</option>
                            <option value="Single">Single</option>
                            <option value="Married">Married</option>
                            <option value="Widowed">Widowed</option>
                            <option value="Divorced">Divorced</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="col">
                <h6>Guardian Information/If family is not present/</h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="gNidentity" class="form-control" placeholder="National ID Number">
                    </div>

                    <div class="col">
                        <input type="text" name="gRelation" class="form-control" placeholder="Relation with the child">
                    </div>
                </div><hr>
                <input type="text" name="rtNidentity" value="${userID}" class="form-control" hidden>
                <h6> Child Information</h6>
                <div class="form-row">
                    <div class="col-4">
                        <input type="text" name="cNidentity" class="form-control" placeholder="National ID" required>
                    </div>
                    <div class="col-8">
                        <input type="text" name="bInstitution" class="form-control" placeholder="Institution of Birth" required>
                    </div>
                </div>
                <br>

                Place of Birth <br>
                <br>
                <div class="form-row">
                    <div class="col-2">
                        Region
                    </div>
                    <div class="col-5">
                        <select name="cRegion" class="form-control" id="coRegion">
                            <%@include file="region.jsp" %>
                        </select>
                    </div>
                    <div class="col-5">
                        <select id="coZone" class="form-control" name="cZone">
                            <option>Select Zone</option>

                        </select>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="cCity" class="form-control" placeholder="City" required>
                    </div>
                    <div class="col">
                        <input type="text" name="cSubcity" class="form-control" placeholder="SubCity" required>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="cDistrict"class="form-control" placeholder="District/Special District" required>
                    </div>
                    <div class="col">
                        <input type="text" name="cKebele" class="form-control" placeholder="Kebele" required>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="assistance" class="form-control" placeholder="Assistance offered during birth" required>
                    </div>
                    <div class="col">
                        <input type="text" name="weight" class="form-control" placeholder="Weight During Birth" required>
                    </div>
                </div>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="midNidentity" class="form-control" placeholder=" Midwife National ID">
                    </div>
                    <div class="col">
                        <input type="text" name="credential" class="form-control" placeholder=" Midwife Credential">
                    </div>
                </div>

            </div>
        </div>
        <input type="text" name="weburl" id="obWeburl" hidden>
        <input type="text" name="btype" value="oldbirth" hidden>
        <br>
        <div class="offset-4">
            <button type="submit" class="btn btn-success btn-lg"> Register</button>
            <button type="reset" class="btn btn-warning btn-lg">Reset</button>
            <button type="button" id="obBtnCancel" class="btn btn-danger btn-lg">Cancel</button>
        </div>
        <br>
    </form>
</div>

<script>
    $(document).ready(function () {
        $("#roRegion").on("change", function () {
            var region_id = $("#roRegion").val();
            $.ajax({
                url: "nm2h41rnr6/zone.jsp",
                data: {region_id: region_id},
                method: "POST",
                success: function (data) {
                    $("#roZone").html(data);
                }
            });
        });
    });
</script>
<script>
    $(document).ready(function () {
        $("#coRegion").on("change", function () {
            var region_id = $("#coRegion").val();
            $.ajax({
                url: "nm2h41rnr6/zone.jsp",
                data: {region_id: region_id},
                method: "POST",
                success: function (data) {
                    $("#coZone").html(data);
                }
            });
        });
    });
</script>