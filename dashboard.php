<?php
require_once 'db_config.php';

session_start();
if (!isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}

$user = $db->real_escape_string($_SESSION['user']);
$balance = $db->query("SELECT balance FROM users WHERE username='$user'")->fetch_assoc()['balance'];
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="card shadow mb-4">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title">Account Summary</h5>
                    </div>
                    <div class="card-body">
                        <p><strong>User:</strong> <?php echo htmlspecialchars($_SESSION['user']); ?></p>
                        <p><strong>Balance:</strong> $<?php echo number_format($balance, 2); ?></p>
                    </div>
                </div>
            </div>
            <div class="col-md-8">
                <div class="card shadow">
                    <div class="card-header bg-primary text-white">
                        <h5 class="card-title">Quick Actions</h5>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-4 mb-3">
                                <a href="deposit.php" class="btn btn-success w-100">Deposit</a>
                            </div>
                            <div class="col-md-4 mb-3">
                                <a href="withdraw.php" class="btn btn-warning w-100">Withdraw</a>
                            </div>
                            <div class="col-md-4 mb-3">
                                <a href="transfer.php" class="btn btn-info w-100">Transfer</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="mt-3 text-center">
            <a href="logout.php" class="btn btn-danger">Logout</a>
        </div>
    </div>
</body>
</html>