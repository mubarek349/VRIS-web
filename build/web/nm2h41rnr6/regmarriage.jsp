<div class="container"> 
    <form action="RegMarriage" method="POST">
        <div class="row">
            <div class="col">
                <h6>Place Of Registration  </h6>
                <div class="form-row">
                    <div class="col">
                        <select name="rRegion" class="form-control" id="rmRegion">
                            <%@include file="region.jsp" %>
                        </select>
                    </div>
                    <div class="col">
                        <select id="rmZone" class="form-control" name="rZone">
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
                <h6> About the Bride </h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="bNidentity" class="form-control" placeholder="National ID Number" required>
                    </div>
                    <div class="col">
                        <input type="text" name="bBirthID" class="form-control" placeholder="Birth Registration Number" required>
                    </div>
                </div>
                <br>
                <select name="bXmstatus" class="form-control">
                    <option>Marital Status before this marriage</option>
                    <option value="Single">Single</option>
                    <option value="Divorced">Divorced</option>
                    <option value="Widowed">Widowed</option>
                </select>
                <hr>
                <h6> About the Groom </h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="gNidentity" class="form-control" placeholder="National ID Number" required>
                    </div>
                    <div class="col">
                        <input type="text" name="gBirthID" class="form-control" placeholder="Birth Registration Number" required>
                    </div>
                </div>
                <br>
                <select name="gXmstatus" class="form-control">
                    <option>Marital Status before this marriage</option>
                    <option value="Single">Single</option>
                    <option value="Divorced">Divorced</option>
                    <option value="Widowed">Widowed</option>
                </select>
            </div>
            <div class="col">
                <h6>About the Marriage</h6>
                <input type="text" name="dom" id="dom" class="form-control" placeholder="Date of Marriage" required>
                <br>
                <input type="text" name="mOrder" class="form-control" placeholder="Type of Marriage (Traditional, Court)" required>
                <br>
                Witnesses One From Bride side
                <input type="text" name="bWitOneID" class="form-control" placeholder="National ID Number" required>
                <br>
                Witnesses Two From Bride side
                <input type="text" name="bWitTwoID" class="form-control" placeholder="National ID Number" required>
                <br>
                Witnesses One From Groom side
                <input type="text" name="gWitOneID" class="form-control" placeholder="National ID Number" required>
                <br>
                Witnesses Two From Groom side
                <input type="text" name="gWitTwoID" class="form-control" placeholder="National ID Number" required>
            </div>
            <input type="text" name="rtNidentity" value="${userID}" class="form-control" hidden>
            <input type="text" name="weburl" id="mWeburl" hidden>
        </div><br>

        <div class="offset-4">
            <button type="submit" class="btn btn-success btn-lg"> Register</button>
            <button type="reset" class="btn btn-warning btn-lg">Reset</button>
            <button type="button" id="mBtnCancel" class="btn btn-danger btn-lg">Cancel</button>
        </div>
        <br>
    </form>
</div>
<script>
    $(document).ready(function () {
        $("#rmRegion").on("change", function () {
            var region_id = $("#rmRegion").val();
            $.ajax({
                url: "nm2h41rnr6/zone.jsp",
                data: {region_id: region_id},
                method: "POST",
                success: function (data) {
                    $("#rmZone").html(data);
                }
            });
        });
    });
</script>