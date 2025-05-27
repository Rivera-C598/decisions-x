<?php
require_once 'db_config.php';
session_start();

if (!isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}

$user = $_SESSION['user'];
$error = "";
$success = "";

// Handle generating the withdrawal code
if (isset($_POST['generate_code'])) {
    $amount = floatval($_POST['amount']);
    if ($amount <= 0) {
        $error = "Please enter a valid amount.";
    } else {
        // Check user balance
        $stmt = $db->prepare("SELECT balance FROM users WHERE username = ?");
        $stmt->bind_param("s", $user);
        $stmt->execute();
        $result = $stmt->get_result();
        $row = $result->fetch_assoc();
        if (!$row || $row['balance'] < $amount) {
            $error = "Insufficient balance.";
        } else {
            // Generate a random 6-digit code
            $code = random_int(100000, 999999);
            $expires_at = date('Y-m-d H:i:s', strtotime('+5 minutes'));

            // Store code and amount in session (or database)
            $_SESSION['withdraw_code'] = $code;
            $_SESSION['withdraw_amount'] = $amount;
            $_SESSION['withdraw_expires'] = $expires_at;

            $success = "Your withdrawal code is <strong>$code</strong>. It expires in 5 minutes.";
        }
    }
}

// Handle confirming withdrawal with code
if (isset($_POST['confirm_withdraw'])) {
    $entered_code = trim($_POST['code']);
    if (!isset($_SESSION['withdraw_code']) || !isset($_SESSION['withdraw_amount']) || !isset($_SESSION['withdraw_expires'])) {
        $error = "No withdrawal request found. Please start again.";
    } elseif (time() > strtotime($_SESSION['withdraw_expires'])) {
        $error = "Your withdrawal code has expired. Please generate a new one.";
        // Clear session withdrawal data
        unset($_SESSION['withdraw_code'], $_SESSION['withdraw_amount'], $_SESSION['withdraw_expires']);
    } elseif ($entered_code != $_SESSION['withdraw_code']) {
        $error = "Invalid withdrawal code.";
    } else {
        $amount = $_SESSION['withdraw_amount'];

        // Perform withdrawal atomically
        $db->begin_transaction();
        try {
            // Deduct balance
            $stmt = $db->prepare("UPDATE users SET balance = balance - ? WHERE username = ?");
            $stmt->bind_param("ds", $amount, $user);
            $stmt->execute();

            // Log transaction with SYSTEM as sender
            $stmt = $db->prepare("INSERT INTO transactions (user_from, user_to, amount) VALUES ('SYSTEM', ?, ?)");
            $stmt->bind_param("sd", $user, $amount);
            $stmt->execute();

            $db->commit();
            $success = "Withdrawal of $$amount successful!";

            // Clear session withdrawal data
            unset($_SESSION['withdraw_code'], $_SESSION['withdraw_amount'], $_SESSION['withdraw_expires']);
        } catch (Exception $e) {
            $db->rollback();
            $error = "Transaction failed: " . $e->getMessage();
        }
    }
}

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Cardless Withdraw | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow rounded-3 border-0">
                <div class="card-header bg-success text-white text-center rounded-top-3">
                    <h4>Cardless Withdrawal</h4>
                </div>
                <div class="card-body">

                    <?php if ($error): ?>
                        <div class="alert alert-danger"><?php echo $error; ?></div>
                    <?php elseif ($success): ?>
                        <div class="alert alert-success"><?php echo $success; ?></div>
                    <?php endif; ?>

                    <?php if (!isset($_SESSION['withdraw_code'])): ?>
                        <form method="POST" novalidate>
                            <div class="mb-3">
                                <label class="form-label">Enter Amount to Withdraw</label>
                                <input type="number" name="amount" class="form-control" step="0.01" min="0.01" required
                                    value="<?php echo isset($_POST['amount']) ? htmlspecialchars($_POST['amount']) : ''; ?>" />
                            </div>
                            <button type="submit" name="generate_code" class="btn btn-success w-100">Generate Withdrawal Code</button>
                        </form>
                    <?php else: ?>
                        <form method="POST" novalidate>
                            <div class="mb-3">
                                <label class="form-label">Enter Withdrawal Code</label>
                                <input type="text" name="code" class="form-control" required />
                            </div>
                            <button type="submit" name="confirm_withdraw" class="btn btn-success w-100">Confirm Withdrawal</button>
                        </form>
                        <hr>
                        <form method="POST">
                            <button type="submit" name="cancel_withdraw" class="btn btn-outline-danger w-100">Cancel Withdrawal</button>
                        </form>
                    <?php endif; ?>

                    <hr>
                    <a href="dashboard.php" class="btn btn-outline-secondary w-100">Back to Dashboard</a>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>

<?php
if (isset($_POST['cancel_withdraw'])) {
    unset($_SESSION['withdraw_code'], $_SESSION['withdraw_amount'], $_SESSION['withdraw_expires']);
    header("Location: withdraw.php");
    exit();
}
?>
