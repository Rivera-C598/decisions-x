<?php
require_once 'db_config.php';
session_start();
if (isset($_SESSION['user'])) {
    header("Location: dashboard.php");
    exit();
}

if (isset($_POST['register'])) {
    $user = $db->real_escape_string($_POST['username']);
    $pass = $db->real_escape_string($_POST['password']);
    
    // Check if user exists
    $check = $db->query("SELECT * FROM users WHERE username='$user'");
    if ($check->num_rows > 0) {
        $error = "Username already exists!";
    } else {
        $db->query("INSERT INTO users (username, password, balance) VALUES ('$user', '$pass', 0)");
        $_SESSION['user'] = $user;
        header("Location: dashboard.php");
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Register | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h3 class="text-center">Register</h3>
                    </div>
                    <div class="card-body">
                        <?php if (isset($error)): ?>
                            <div class="alert alert-danger"><?php echo $error; ?></div>
                        <?php endif; ?>
                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label">Username</label>
                                <input type="text" name="username" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Password</label>
                                <input type="password" name="password" class="form-control" required>
                            </div>
                            <button type="submit" name="register" class="btn btn-primary w-100">Register</button>
                        </form>
                        <hr>
                        <a href="index.php" class="btn btn-outline-secondary w-100">Back to Login</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>