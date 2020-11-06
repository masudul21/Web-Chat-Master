
<?php

$errors = array();

include('database_connection.php');
session_start();

if(isset($_SESSION['user_id']))
{
 header('location:index.php');
}
if(isset($_POST["register"]))
{
 $username = trim($_POST["username"]);
 $password = trim($_POST["password"]);
 $check_query = "
 SELECT * FROM login 
 WHERE username = :username
 ";
 $statement = $connect->prepare($check_query);
 $check_data = array(':username'  => $username);
 if($statement->execute($check_data)) 
 {
  if($statement->rowCount() > 0)
  {
    array_push($errors, "Username already exist");
  }
  else
  {
   if(empty($username))
   {
    array_push($errors, "Username is required");
   }
   if(empty($password))
   {
    array_push($errors, "Password is required");
   }
    if($password != $_POST['confirm_password'])
    {
      array_push($errors, "Password  did not match");
    }
   
   if (count($errors) == 0)
   {
    $data = array(
     ':username'  => $username,
     ':password'  => password_hash($password, PASSWORD_DEFAULT)
    );
 
    $query = "INSERT INTO login 
    (username, password) 
    VALUES (:username, :password)";
    $statement = $connect->prepare($query);
    if($statement->execute($data))
    {
      array_push($errors, "Registration Completed");
      header('location:login.php');
    }
   }
  }
 }
}
?>
<!DOCTYPE html>
<html>
<head>
  <title>WEB CHAT</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body style="background-image: url(web_chat.jpg); background-repeat:no-repeat;background-attachment: fixed;background-position: center;background-size: cover;">
  <div class="header">
    <h2>Register</h2>
  </div>
  <?php include('errors.php'); ?>
  <form method="post">
    <div class="input-group">
      <label>Username</label>
      <input type="text" name="username">
    </div>
    <div class="input-group">
      <label>Password</label>
      <input type="password" name="password">
    </div>
    <div class="input-group">
      <label>Confirm password</label>
      <input type="password" name="confirm_password">
    </div>
    
    <div align="center" class="input-group">
      <button type="submit" class="btn" name="register">Register</button>
    </div>
    <p align="center">
      Already a member? <a href="login.php">Login</a>
    </p>
  </form>
</body>
</html>

