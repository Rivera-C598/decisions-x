<?php
require_once 'db_config.php';

session_start();
if (!isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}

if (isset($_POST['transfer'])) {
    $amount = floatval($_POST['amount']);
    $to_user = $db->real_escape_string($_POST['to_user']);
    $from_user = $db->real_escape_string($_SESSION['user']);
    
    // Check if recipient exists
    $check = $db->query("SELECT * FROM users WHERE username='$to_user'");
    if ($check->num_rows == 0) {
        $error = "Recipient does not exist!";
    } else {
        $db->query("UPDATE users SET balance = balance - $amount WHERE username='$from_user'");
        $db->query("UPDATE users SET balance = balance + $amount WHERE username='$to_user'");
        $db->query("INSERT INTO transactions (user_from, user_to, amount) VALUES ('$from_user', '$to_user', $amount)");
        header("Location: dashboard.php");
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transfer | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-info text-white">
                        <h3 class="text-center">Transfer Money</h3>
                    </div>
                    <div class="card-body">
                        <?php if (isset($error)): ?>
                            <div class="alert alert-danger"><?php echo $error; ?></div>
                        <?php endif; ?>
                        <form method="POST">
                            <div class="mb-3">
                                <label class="form-label">Recipient Username</label>
                                <input type="text" name="to_user" class="form-control" required>
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Amount</label>
                                <input type="number" name="amount" class="form-control" step="0.01" required>
                            </div>
                            <button type="submit" name="transfer" class="btn btn-info w-100">Transfer</button>
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