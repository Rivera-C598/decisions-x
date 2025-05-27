<?php
require_once 'db_config.php';
session_start();

if (!isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}

$user = $db->real_escape_string($_SESSION['user']);
$balance = $db->query("SELECT balance FROM users WHERE username='$user'")->fetch_assoc()['balance'];
$account_number = $db->query("SELECT account_number FROM users WHERE username='$user'")->fetch_assoc()['account_number'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .card {
            border-radius: 1rem;
        }
        .nav-link.active {
            font-weight: bold;
            color: #0d6efd !important;
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">NexaBank</a>
        <div class="ms-auto">
            <a href="logout.php" class="btn btn-outline-danger">Logout</a>
        </div>
    </div>
</nav>

<div class="container my-5">
    <div class="row g-4">

        <div class="col-md-4">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0"><i class="bi bi-person-circle me-2"></i>Account Summary</h5>
                </div>
                <div class="card-body">
                    <p><strong>Username:</strong> <?= htmlspecialchars($_SESSION['user']) ?></p>
                    <p><strong>Account number:</strong> <?= htmlspecialchars($account_number) ?></p>
                    <p><strong>Balance:</strong> $<?= number_format($balance, 2) ?></p>
                </div>
            </div>
        </div>
        <!-- Quick Actions -->
        <div class="col-md-8">
            <div class="card shadow-sm">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0"><i class="bi bi-lightning-fill me-2"></i>Quick Actions</h5>
                </div>
                <div class="card-body">
                    <div class="row g-3">
                        <div class="col-md-4">
                            <a href="deposit.php" class="btn btn-success w-100">
                                <i class="bi bi-arrow-down-circle me-1"></i>Deposit
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="withdraw.php" class="btn btn-warning w-100">
                                <i class="bi bi-arrow-up-circle me-1"></i>Withdraw
                            </a>
                        </div>
                        <div class="col-md-4">
                            <a href="transfer.php" class="btn btn-info w-100">
                                <i class="bi bi-arrow-left-right me-1"></i>Transfer
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card mt-4 shadow-sm">
                <div class="card-header bg-secondary text-white">
                    <h6 class="mb-0"><i class="bi bi-clock-history me-2"></i>Transaction History (Coming Soon)</h6>
                </div>
                <div class="card-body text-muted">
                    You’ll soon be able to view your past transactions and activity here.
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Bootstrap JS (Optional, for components) -->
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>
