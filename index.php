<?php
session_start();
if (isset($_SESSION['user'])) {
    header("Location: dashboard.php");
    exit();
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome to NexaBank Online</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <style>
        .hero {
            background: linear-gradient(rgba(0,0,0,0.4), rgba(0,0,0,0.6)), url('images/hero-bank.jpg') center/cover no-repeat;
            color: white;
            padding: 100px 0;
        }
        .trust-icons i {
            font-size: 2rem;
        }
        .footer {
            background-color: #f8f9fa;
            padding: 40px 0;
            margin-top: 50px;
        }
    </style>
</head>
<body>

    <nav class="navbar navbar-expand-lg navbar-light bg-light shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="#">NexaBank</a>
            <div class="ms-auto">
                <a href="login.php" class="btn btn-outline-primary me-2">Login</a>
                <a href="register.php" class="btn btn-primary">Register</a>
            </div>
        </div>
    </nav>

    <section class="hero text-center">
        <div class="container">
            <h1 class="display-4">Secure. Reliable. NexaBank.</h1>
            <p class="lead mt-3">Your trusted partner in digital banking and financial freedom.</p>
            <a href="login.php" class="btn btn-lg btn-primary mt-4">Access Your Account</a>
        </div>
    </section>

    <section class="py-5 bg-white">
        <div class="container text-center">
            <h2 class="mb-4">Why Choose NexaBank?</h2>
            <div class="row">
                <div class="col-md-4">
                    <div class="p-4">
                        <img src="images/secure.svg" width="60" alt="Secure">
                        <h5 class="mt-3">Bank-Grade Security</h5>
                        <p>256-bit encryption and advanced fraud protection to keep your money safe.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4">
                        <img src="images/support.svg" width="60" alt="Support">
                        <h5 class="mt-3">24/7 Customer Support</h5>
                        <p>We’re here for you anytime, day or night—online or by phone.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="p-4">
                        <img src="images/mobile.svg" width="60" alt="Mobile">
                        <h5 class="mt-3">Bank from Anywhere</h5>
                        <p>Use our mobile app or website to manage your finances anytime, anywhere.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <footer class="footer text-center">
        <div class="container">
            <p class="mb-1">&copy; 2025 NexaBank. All rights reserved.</p>
            <p class="small">Your funds are FDIC insured. Privacy Policy | Terms of Service</p>
        </div>
    </footer>

</body>
</html>
