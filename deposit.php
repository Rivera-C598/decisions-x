<?php
require_once 'db_config.php';

session_start();
if (!isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}

if (isset($_POST['deposit'])) {
    $amount = floatval($_POST['amount']);
    $user = $db->real_escape_string($_SESSION['user']);
    
    $db->query("UPDATE users SET balance = balance + $amount WHERE username='$user'");
    $db->query("INSERT INTO transactions (user_from, user_to, amount) VALUES ('SYSTEM', '$user', $amount)");
    header("Location: dashboard.php");
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-success text-white">
                        <h3 class="text-center">Deposit Money</h3>
                    </div>
                    <div class="card-body">
                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label">Amount</label>
                                <input type="number" name="amount" class="form-control" step="0.01" required>
                            </div>
                            <button type="submit" name="deposit" class="btn btn-success w-100">Deposit</button>
                        </form>
                        <hr>
                        <a href="dashboard.php" class="btn btn-outline-secondary w-100">Back to Dashboard</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>