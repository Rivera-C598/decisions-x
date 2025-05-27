<?php
require_once 'db_config.php';

session_start();
if (!isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}

$error = "";
$success = "";

if (isset($_POST['transfer'])) {
    $amount = floatval($_POST['amount']);
    $to_user = trim($_POST['to_user']);
    $from_user = $_SESSION['user'];

    if ($to_user === $from_user) {
        $error = "You cannot transfer money to yourself!";
    } elseif ($amount <= 0) {
        $error = "Please enter a valid positive amount.";
    } else {
        // Check sender balance
        $stmt = $db->prepare("SELECT balance FROM users WHERE username = ?");
        $stmt->bind_param("s", $from_user);
        $stmt->execute();
        $result = $stmt->get_result();
        $sender = $result->fetch_assoc();

        if (!$sender) {
            $error = "Sender account not found.";
        } elseif ($sender['balance'] < $amount) {
            $error = "Insufficient balance to transfer.";
        } else {
            // Check if recipient exists
            $stmt = $db->prepare("SELECT * FROM users WHERE username = ?");
            $stmt->bind_param("s", $to_user);
            $stmt->execute();
            $result = $stmt->get_result();

            if ($result->num_rows == 0) {
                $error = "Recipient does not exist!";
            } else {
                // Begin transaction
                $db->begin_transaction();

                try {
                    // Deduct from sender
                    $stmt1 = $db->prepare("UPDATE users SET balance = balance - ? WHERE username = ?");
                    $stmt1->bind_param("ds", $amount, $from_user);
                    $stmt1->execute();

                    // Add to recipient
                    $stmt2 = $db->prepare("UPDATE users SET balance = balance + ? WHERE username = ?");
                    $stmt2->bind_param("ds", $amount, $to_user);
                    $stmt2->execute();

                    // Log transaction
                    $stmt3 = $db->prepare("INSERT INTO transactions (user_from, user_to, amount) VALUES (?, ?, ?)");
                    $stmt3->bind_param("ssd", $from_user, $to_user, $amount);
                    $stmt3->execute();

                    $db->commit();
                    $success = "Successfully transferred $$amount to $to_user.";
                } catch (Exception $e) {
                    $db->rollback();
                    $error = "Transaction failed: " . $e->getMessage();
                }
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Transfer | NexaBank</title>
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"/>
</head>
<body class="bg-light">
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm rounded-4 border-0">
                <div class="card-header bg-info text-white text-center rounded-top-4">
                    <h4><i class="bi bi-arrow-left-right me-2"></i>Transfer Money</h4>
                </div>
                <div class="card-body">
                    <?php if ($error): ?>
                        <div class="alert alert-danger text-center"><?php echo htmlspecialchars($error); ?></div>
                    <?php elseif ($success): ?>
                        <div class="alert alert-success text-center"><?php echo htmlspecialchars($success); ?></div>
                    <?php endif; ?>
                    <form method="POST" novalidate>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Recipient Username</label>
                            <input type="text" name="to_user" class="form-control" required value="<?php echo isset($_POST['to_user']) ? htmlspecialchars($_POST['to_user']) : ''; ?>">
                        </div>
                        <div class="mb-3">
                            <label class="form-label fw-semibold">Amount</label>
                            <input type="number" name="amount" class="form-control" step="0.01" min="0.01" required value="<?php echo isset($_POST['amount']) ? htmlspecialchars($_POST['amount']) : ''; ?>">
                        </div>
                        <button type="submit" name="transfer" class="btn btn-info w-100">
                            <i class="bi bi-currency-exchange me-1"></i>Transfer
                        </button>
                    </form>
                    <hr />
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
