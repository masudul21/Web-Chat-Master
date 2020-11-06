<?php

$errors = array();
include('database_connection.php');
session_start();


if(isset($_SESSION['user_id']))
{
	header('location:index.php');
}

if(isset($_POST['login']))
{
	$query = "
		SELECT * FROM login 
  		WHERE username = :username
	";
	$statement = $connect->prepare($query);
	$statement->execute(
		array(
			':username' => $_POST["username"]
		)
	);	
	$count = $statement->rowCount();
	if($count > 0)
	{
		$result = $statement->fetchAll();
		foreach($result as $row)
		{
			if(password_verify($_POST["password"], $row["password"]))
			{
				$_SESSION['user_id'] = $row['user_id'];
				$_SESSION['username'] = $row['username'];
				$sub_query = "
				INSERT INTO login_details 
	     		(user_id) 
	     		VALUES ('".$row['user_id']."')
				";
				$statement = $connect->prepare($sub_query);
				$statement->execute();
				$_SESSION['login_details_id'] = $connect->lastInsertId();
				header('location:index.php');
			}
			else
			{
				array_push($errors, "Password Does Not Matched!");
			}
		}
	}
	else
	{
		array_push($errors, "Wrong!Please enter a valid Username");
	}
}
?>

<!DOCTYPE html>
<html>
<head>
  <title>WEB CHAT</title>
  <link rel="stylesheet" type="text/css" href="style.css">
</head>
<br>
<body style="background-image: url(web_chat.jpg); background-repeat:no-repeat;background-attachment: fixed;background-position: center;background-size: cover;">
  <div class="header">
  	<h2>Login</h2>
  </div>
	 
  <?php include('errors.php'); ?>
  <form method="post">
  	<div class="input-group">
  		<label>Username</label>
  		<input type="text" name="username" >
  	</div>
  	<div class="input-group">
  		<label>Password</label>
  		<input type="password" name="password">
  	</div>
  	<div align="center" class="input-group">
  		<button type="submit" class="btn" name="login">Login</button>
  	</div>
  	<p align="center">
  		Not a member? Please <a href="register.php"> Register</a>
  	</p>
  </form>
</body>
</html>