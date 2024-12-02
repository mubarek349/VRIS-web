<div class="container"> 
    <form action="RegDivorce" method="POST">
        <div class="row">
            <div class="col">
                <h6>Place Of Registration  </h6>
                <div class="form-row">
                    <div class="col">
                        <select name="rRegion" class="form-control" id="rdiRegion">
                            <%@include file="region.jsp" %>
                        </select>
                    </div>
                    <div class="col">
                        <select id="rdiZone" class="form-control" name="rZone">
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
                <h6> About the Grasswidower </h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="xhNidentity" class="form-control" placeholder="National ID Number" required>
                    </div>
                    <div class="col">
                        <input type="text" name="xhBirthID" class="form-control" placeholder="Birth Registration Number" required>
                    </div>
                </div>
                <hr>
                <h6> About the Grasswidow </h6>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="xwNidentity" class="form-control" placeholder="National ID Number" required>
                    </div>
                    <div class="col">
                        <input type="text" name="xwBirthID" class="form-control" placeholder="Birth Registration Number" required>
                    </div>
                </div>
            </div>
            <div class="col">
                <h6>About the Late Marriage</h6>
                <input type="text" name="xdom" id="xdom" class="form-control" placeholder="Date of the late Marriage" required>
                <br>
                <input type="text" name="mOrder" class="form-control" placeholder="Type of Marriage (Traditional, Court)" required>
                <br>
                <input type="text" name="diCause" class="form-control" placeholder="Cause of divorce" required>
                <br>
                <input type="text" name="dodi" id="dodi" class="form-control" placeholder="Date of divorce" required>
                <br>
                <div class="form-row">
                    <div class="col">
                        <input type="text" name="diCourt" class="form-control" placeholder="Name of approving court" required>
                    </div>
                    <div class="col">
                        <input type="text" name="diDocNum" class="form-control" placeholder="Document Number" required>
                    </div>
                </div>
                <br>
                <input type="text" name="children" class="form-control" placeholder="Number of Children" required>
            </div>
            <input type="text" name="rtNidentity" value="${userID}" class="form-control" hidden>
            <input type="text" name="weburl" id="diWeburl" hidden>
        </div><br>

        <div class="offset-4">
            <button type="submit" class="btn btn-success btn-lg"> Register</button>
            <button type="reset" class="btn btn-warning btn-lg">Reset</button>
            <button type="button" id="diBtnCancel" class="btn btn-danger btn-lg">Cancel</button>
        </div>
        <br>
    </form>
</div>
<script>
    $(document).ready(function () {
        $("#rdiRegion").on("change", function () {
            var region_id = $("#rdiRegion").val();
            $.ajax({
                url: "nm2h41rnr6/zone.jsp",
                data: {region_id: region_id},
                method: "POST",
                success: function (data) {
                    $("#rdiZone").html(data);
                }
            });
        });
    });
</script>