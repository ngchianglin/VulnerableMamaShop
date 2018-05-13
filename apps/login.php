<?php

$validate=false;
$result;

if(isset($_SERVER['REQUEST_METHOD'])  &&  strcasecmp("post", $_SERVER['REQUEST_METHOD'] ) == 0)
{
   
   if(!isset($_POST['email']) && !isset($_POST['password']) )
   {
       die("Invalid User ID and Password !");
   }
  
       
   $email = $_POST['email'];
   $password = $_POST['password'];
       
   $host = "localhost";
   $db ="appdb";
   $user ="appuser";
   $pass="appsecret123";
   $charset = 'utf8';
   
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $opt = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false
    ];
    
    $pdo = null;
    
    try
    {
       $pdo = new PDO($dsn, $user, $pass, $opt); 
       $stmt = $pdo->prepare('SELECT * FROM users where email=? and password=?');
       $stmt->execute([$email, $password]);
       $result = $stmt->fetch();
       
       if($result)
       {
           $validate=true; 
       }
     
       
    }
    catch(PDOException $e)
    {
       echo $e->getMessage();
    }
       

}

header('Content-Type: text/html; charset=UTF-8');

?>



<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" type="text/css" href="bootstrap.min.css">
<title>Vulnerable Mama Shop - 易受攻击的妈妈商店</title>
</head>
<body>

<nav class="navbar navbar-dark navbar-expand-sm bg-dark">
      <div>
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="welcome.php">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="login.php">Login</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="about.html">About</a>
          </li>
         </ul>
      </div>
</nav>  
  
<div class="container mt-1">

<?php 

if($validate === false )
{

?>    

<h3>Customer Login Here<br>
<small>用户登录</small>
</h3>
 
<form action="login.php" method="POST" class="w-50">
  <div class="form-group">
    <label>Email address</label>
    <input type="email" class="form-control" name="email" placeholder="Enter email">
  </div>
  <div class="form-group">
    <label>Password</label>
    <input type="password" class="form-control" name="password" placeholder="Password">
  </div>
  <button type="submit" class="btn btn-primary">Login</button>
</form> 
 
 
<?php
}
else
{    
?>

 <p class="display-4 text-center">
 
 <?php 
 echo "Welcome " . $result['firstname'] . " " . $result['lastname'] ; 
 ?>
 
 </p>

<?php
}
?>
   
</div>

   
</body>
</html>

