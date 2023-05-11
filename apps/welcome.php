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
        PDO::ATTR_EMULATE_PREPARES   => false
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
<title>The Logfather Swag Shop</title>
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
        <h1>Logfather Swag Shop</h1>
        <p class="h5">You need more logfather in your life</p>
        <br>
        <p class="lead">This is a <s>probably vulnerable</s> highly secure online store where you can acquire all of the finest goods sold by someone who knew someone who knew the logfather, which basically counts as official merch.
        </p>
        <p>
         You need more logfather in your life.  Give us your money.
        </p>
  </div>
  <br>
  
  <div class="container border">
  
   <p class="font-weight-bold">Select a Category to see items on sale.<br>
   <small>Some items may not be sanitized.</small>
   </p>
   <p>  
   <form action="welcome.php" method="POST">
    <select name="catid">
       <option value="1000">Clothing</option>
       <option value="1001">Hats</option>
       <option value="1002">Myspace Links</option>
       <option value="1003">Secondhand Food</option>
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

