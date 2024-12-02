<form id="cmForm" action="ChangeMail" method="post">
    <div class="container">
        <div class="col-4 offset-4">
            <input type="email" name="email" class="form-control" placeholder="Enter new Email" required><br>
            <input type="password" name="pass" class="form-control" placeholder="Enter current password" required><br>

            <input type="text" name="emp_id" value="${userID}" class="form-control" hidden>
            <input type="text" name="weburl" id="cmWeburl" hidden>
            <button class="btn btn-lg btn-primary btn-block" type="submit">Change Email</button>
        </div>
    </div>
</form>