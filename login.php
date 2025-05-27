<?php
require_once 'db_config.php';
session_start();

if (isset($_SESSION['user'])) {
    header("Location: dashboard.php");
    exit();
}

$error = "";

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['login'])) {
    $user = trim($db->real_escape_string($_POST['username']));
    $pass = trim($_POST['password']);

    if (empty($user) || empty($pass)) {
        $error = "Please enter both username and password!";
    } else {
        $stmt = $db->prepare("SELECT * FROM users WHERE username = ?");
        $stmt->bind_param("s", $user);
        $stmt->execute();
        $result = $stmt->get_result();

        if ($result->num_rows === 1) {
            $row = $result->fetch_assoc();
            if (password_verify($pass, $row['password'])) {
                $_SESSION['user'] = $user;
                header("Location: dashboard.php");
                exit();
            } else {
                $error = "Invalid password!";
            }
        } else {
            $error = "User not found!";
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Login | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow-sm border-0 rounded-4">
                    <div class="card-header bg-primary text-white text-center rounded-top-4">
                        <h4><i class="bi bi-box-arrow-in-right me-2"></i>Login to NexaBank</h4>
                    </div>
                    <div class="card-body">
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
                                <input type="password" name="password" class="form-control" required />
                            </div>
                            <button type="submit" name="login" class="btn btn-primary w-100">
                                <i class="bi bi-box-arrow-in-right me-1"></i>Login
                            </button>
                        </form>
                        <hr />
                        <a href="register.php" class="btn btn-outline-secondary w-100">
                            <i class="bi bi-person-plus me-1"></i>Create an Account
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
