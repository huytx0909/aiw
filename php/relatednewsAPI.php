<?php

header("Content-Type:application/json");
 include('../dbase/dbase.php');


if (isset($_GET['IDnews']) && $_GET['IDnews'] != "") {

$IDnews = $_GET['IDnews'];

$news_query = mysqli_query($db, "SELECT * FROM news WHERE id = '$IDnews'");
$singleNews = mysqli_fetch_assoc($news_query);
$categoryID = $singleNews['id_category'];

$categoryNews_query = mysqli_query($db, "SELECT * FROM news WHERE id_category = '$categoryID' and id != '$IDnews' LIMIT 4");

 if(mysqli_num_rows($categoryNews_query) > 0){


$relatednews = array();

 while($categoryNews = mysqli_fetch_assoc($categoryNews_query)) {
 

  $new =array(
                "id" =>  $categoryNews["id"],
                "title" => $categoryNews["title"],
                "date" => $categoryNews["date_created"],
                "author" => $categoryNews["author"],
                 "intro" => $categoryNews["short_intro"],
            );
            array_push($relatednews,$new);
        }

 getRelatedNews($relatednews);

 } else {
   $mess = "no related news";
   getRelatedNews($mess);

 }


  mysqli_close($db);

}

function getRelatedNews($relatednews){
 $getRelatedNews['relatedNews'] = $relatednews;
 
 $json_response = json_encode($getRelatedNews);
 echo $json_response;
}





?>