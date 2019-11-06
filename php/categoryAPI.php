<?php
header("Content-Type:application/json");
 include('../dbase/dbase.php');


//getAllCategories
if (isset($_GET['category'])) {
  $result = mysqli_query($db,"SELECT * FROM `category`");
  if(mysqli_num_rows($result)>0){
 
 $categories = array();
 while($row = mysqli_fetch_assoc($result)) {
 
   $category =array(
                 "id" =>  $row["id"],
                 "category_name" => $row["category_name"],
             );
             array_push($categories,$category);
         }
 
         getAllCategories($categories);
 
  mysqli_close($db);
 
  } else {
    $mess ="No news found";
    getAllCategories($mess);
  }
 } 
  
 function getAllCategories($categories){
  $getAllCategories['all_categories'] = $categories;
 
 
  $json_response = json_encode($getAllCategories);
  echo $json_response;
 }
?>