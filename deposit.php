<?php
require_once 'db_config.php';
session_start();

if (!isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['deposit'])) {
    $amount = floatval($_POST['amount']);
    if ($amount > 0) {
        $user = $db->real_escape_string($_SESSION['user']);
        $db->query("UPDATE users SET balance = balance + $amount WHERE username='$user'");
        $db->query("INSERT INTO transactions (user_from, user_to, amount) VALUES ('SYSTEM', '$user', $amount)");
        header("Location: dashboard.php");
        exit();
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 1rem;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="dashboard.php">← NexaBank</a>
        <div class="ms-auto">
            <a href="logout.php" class="btn btn-outline-danger">Logout</a>
        </div>
    </div>
</nav>

<!-- Deposit Form -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-header bg-success text-white text-center">
                    <h4 class="mb-0"><i class="bi bi-wallet2 me-2"></i>Deposit Funds</h4>
                </div>
                <div class="card-body">
                    <form method="POST">
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Amount ($)</label>
                            <input type="number" name="amount" class="form-control" step="0.01" min="0.01" required>
                        </div>
                        <button type="submit" name="deposit" class="btn btn-success w-100">
                            <i class="bi bi-plus-circle me-1"></i>Deposit
                        </button>
                    </form>
                    <hr>
                    <a href="dashboard.php" class="btn btn-outline-secondary w-100">
                        <i class="bi bi-arrow-left me-1"></i>Back to Dashboard
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
