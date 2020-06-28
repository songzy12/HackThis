<?php
    session_start();

    require('class.user.php');
    $user = new User('mysql:host=localhost;dbname=dev', 'root', 'meep');

?>

<!doctype html>

<html lang="en">
    <head>
        <meta charset="utf-8">
        <title>Login</title>

        <link rel="stylesheet" href="styles.css">
    </head>

    <body>
        <?php
            if ($user->authorized):
        ?>
                Welcome, <?=$user->username;?>!
        <?php
            elseif (isset($_GET['forgot'])):
        ?>
            <div class="module form-module">
                <div class="form">
                    <h2>Reset password</h2>
                    <?php if (isset($_POST['reset'])): ?>
                        <div class="success">Email sent</div>
                    <?php endif; ?>
                    <form method="POST">
                        <input type="text" name="reset" placeholder="Username"/>
                        <button>Reset</button>
                    </form>
                </div>
                <div class="cta"><a href="./">Login</a></div>
            </div>
        <?php
            else:
        ?>
            <div class="module form-module">
                <div class="form">
                    <h2>Login to your account</h2>
                    <?php if (isset($_POST['username']) && isset($_POST['password'])): ?>
                        <div class="error">Invalid login</div>
                    <?php endif; ?>
                    <form method="POST">
                        <input type="text" name="username" placeholder="Username"/>
                        <input type="password" name="password" placeholder="Password"/>
                        <button>Login</button>
                    </form>
                </div>
                <div class="cta"><a href="?forgot">Forgot your password?</a></div>
            </div>
        <?php
            endif;
        ?>
    </body>
</html>
