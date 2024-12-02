<link rel="stylesheet" href="css/changepass.css">
<script src="js/changepass.js"></script>
<script src="js/valChangePass.js"></script>
<form id="cpForm" action="ChangePass" method="post">
    <div class="container">
        <div class="row">
            <div class="col-4 offset-4">
                <input type="password" name="oldpass" class="form-control" placeholder="Enter old password" required><br>
                <input type="password" id="t1" name="pass" class="form-control" placeholder="Enter new password" required><br>
                <input type="password" id="t2" name="repass" class="form-control" placeholder="Enter new password again" required><br>  
                <input type="text" name="emp_id" value="${userID}" class="form-control" hidden>
                <input type="text" name="weburl" id="cpWeburl" hidden>
                <button class="btn btn-lg btn-primary btn-block" type="submit">Change Password</button>
            </div>
            <div class="col-4">
                <ul  id="d1" class="list-group">
                    <li class="list-group-item list-group-item-success">Password Conditions</li>
                    <li class="list-group-item" id=d12><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> One Upper Case Letter</li>
                    <li class="list-group-item" id=d13 ><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> One Lower Case Letter </li>
                    <li class="list-group-item" id=d14><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> One Special Char </li>
                    <li class="list-group-item" id=d15><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> One Number</li>
                    <li class="list-group-item" id=d16><span class='glyphicon glyphicon-remove' aria-hidden='true'></span> Length 8 Char</li>
                </ul>
            </div>
        </div>
    </div>
</form>
