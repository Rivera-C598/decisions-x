<?php
require_once 'db_config.php';
session_start();

if (isset($_SESSION['user'])) {
    header("Location: dashboard.php");
    exit();
}

$error = "";

function generateAccountNumber() {
    return str_pad(mt_rand(0, 9999999999), 10, '0', STR_PAD_LEFT);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['register'])) {
    $user = trim($db->real_escape_string($_POST['username']));
    $pass = trim($_POST['password']);
    $confirm_pass = trim($_POST['confirm_password']);
    $bank_code = trim($_POST['bank_code']);

    if (empty($user) || empty($pass) || empty($confirm_pass) || empty($bank_code)) {
    $error = "All fields are required!";
    } elseif (!preg_match('/^(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/', $pass)) {
        $error = "Password must be at least 8 characters long, contain an uppercase letter, a number, and a special character.";
    } elseif ($pass !== $confirm_pass) {
        $error = "Passwords do not match!";
    } elseif ($bank_code !== '142831') {
        $error = "Invalid bank confirmation code!";
    } else {
        $check = $db->query("SELECT * FROM users WHERE username='$user'");
        if ($check->num_rows > 0) {
            $error = "Username already exists!";
        } else {
            $hashed_pass = password_hash($pass, PASSWORD_DEFAULT);
            $account_number = str_pad(mt_rand(0, 9999999999), 10, '0', STR_PAD_LEFT);
            $db->query("INSERT INTO users (username, password, account_number, balance) 
                        VALUES ('$user', '$hashed_pass', '$account_number', 0)");
            $_SESSION['user'] = $user;
            header("Location: dashboard.php");
            exit();
        }
    }
}

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Register | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 1rem;
        }
        .card-header {
            border-top-left-radius: 1rem;
            border-top-right-radius: 1rem;
        }
    </style>
</head>
<body>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm border-0">
                    <div class="card-header bg-primary text-white text-center">
                        <h4><i class="bi bi-person-plus-fill me-2"></i>Create an Account</h4>
                    </div>
                    <div class="card-body p-4">
                        <?php if (!empty($error)): ?>
                            <div class="alert alert-danger text-center"><?php echo $error; ?></div>
                        <?php endif; ?>
                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Username</label>
                                <input type="text" name="username" class="form-control" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Password</label>
                                <input type="password" name="password" id="password" class="form-control" required
                                    pattern="(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&]).{8,}" 
                                    title="Must include uppercase, number, special character, and be at least 8 characters long" />
                                <small class="form-text text-muted">
                                    Password must be at least 8 characters and include uppercase, number, and special character.
                                </small>
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Confirm Password</label>
                                <input type="password" name="confirm_password" id="confirm_password" class="form-control" required />
                            </div>
                            <div class="mb-3">
                                <label class="form-label fw-semibold">Bank Confirmation Code</label>
                                <input type="text" name="bank_code" class="form-control" required />
                            </div>
                            <div class="form-check mb-3">
                                <input type="checkbox" class="form-check-input" onclick="togglePassword()">
                                <label class="form-check-label">Show Password</label>
                            </div>
                            <button type="submit" name="register" class="btn btn-primary w-100">
                                <i class="bi bi-box-arrow-in-right me-1"></i>Register
                            </button>
                        </form>
                        <hr />
                        <a href="index.php" class="btn btn-outline-secondary w-100 mt-2">
                            <i class="bi bi-arrow-left me-1"></i>Back to Login
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
    function togglePassword() {
        let pass = document.getElementById("password");
        let confirm = document.getElementById("confirm_password");
        pass.type = pass.type === "password" ? "text" : "password";
        confirm.type = confirm.type === "password" ? "text" : "password";
    }
    </script>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
