<?php

$stmt = false;

if(isset($_SERVER['REQUEST_METHOD'])  &&  strcasecmp("post", $_SERVER['REQUEST_METHOD'] ) == 0)
{

   if(!isset($_POST['catid']) )
   {
       die("Invalid category selected !");
   }
   
   $catid = $_POST['catid'];
   //echo "catid is " . $catid . "\n";
   

   $query ="select products.name as item, category.category_name as category , products.description as description from products inner join category where products.catid = category.catid  AND category.catid = " . $catid; 
   
   $host = "localhost";
   $db ="appdb";
   $user ="appuser";
   $pass="appsecret123";
   $charset = 'utf8';
   
    $dsn = "mysql:host=$host;dbname=$db;charset=$charset";
    $opt = [
        PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
        PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
        PDO::ATTR_EMULATE_PREPARES   => false,
    ];
    
    $pdo = null;
    
    try
    {
       $pdo = new PDO($dsn, $user, $pass, $opt); 
       $stmt = $pdo->query($query);
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
<title>Vulnerable Mama Shop</title>
</head>
<body>

  <nav class="navbar navbar-dark navbar-expand-sm bg-dark">
      <div>
        <ul class="navbar-nav">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home</a>
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
  

  
  <div class="container-fluid">
        <h1>Vulnerable Mama Shop</h1>
        <p>This is a vulnerable online Neighbourhood Mama Shop that can be used for practicing SQL injection. There are several items 
        available for sale here. Check it out and have fun !</p> 
  </div>
  <br>
  
  <div class="container border">
  
   <p class="font-weight-bold">Select a Category to see items on sale. </p>
   <p>  
   <form action="welcome.php" method="POST">
    <select name="catid">
       <option value="1000">Drinks</option>
       <option value="1001">Snacks</option>
       <option value="1002">Fruits</option>
       <option value="1003">Lunch boxes</option>
    </select>
    
    <input type="submit" value="Submit">
   </form>
   </p>
  <?php

  if($stmt!== False)
  {
  ?>
  
  <table class="table table-striped">
    <thead>
    <tr>
    <th>Item</th>
    <th>Category</th>
    <th>Description</th>
    </tr>
    </thead>
  <tbody>
   <?php
      while($result = $stmt->fetch())
      {
         echo "<tr>";
         echo "<td>" .$result['item']  . "</td><td>" . $result['category'] . "</td><td>" . $result['description'] . "</td>";
         echo "</tr>\n";
      }
   
   ?>
  
  </tbody>
  </table>
  
  <?php
     }
  ?>  
 </div>     
   
  
</body>
</html>
