<?php
header("Content-Type:application/json");
 include('../dbase/dbase.php');


//getCommentbyIDnews
//localhost/aiw-master/php/commentAPI.php?IDnews=1

if (isset($_GET['IDnews']) && $_GET['IDnews'] != "") {
 $IDnews = $_GET['IDnews'];
 $commentArr = array();
$comment_query = mysqli_query($db, "SELECT * FROM `comment` WHERE id_news = '$IDnews' ORDER BY time_created DESC");

 if(mysqli_num_rows($comment_query) > 0) {

while ($comment = mysqli_fetch_assoc($comment_query)) {

	$comment1=array(
                "id" =>  $comment["id"],
                "name" => $comment["name"],
                "content" => $comment["comment_content"],
                "time_created" => $comment["time_created"]      
      
            );
            array_push($commentArr,$comment1);
}



 getCommentByIDnews($commentArr);
 }  else {
 	$mess ="No Comments.";
 	getCommentByIDnews($mess);
 }



}


 
function getCommentByIDnews($commentArr){
 
  $getCommentByIDnews['commentArr'] = $commentArr;

 $json_response = json_encode($getCommentByIDnews);
 echo $json_response;
}







//get comment by IDcomment
//localhost/aiw-master/php/commentAPI.php?ID=1


if (isset($_GET['ID']) && $_GET['ID'] != "") {
 $IDcomment = $_GET['ID'];
$comment_query = mysqli_query($db, "SELECT * FROM `comment` WHERE id = '$IDcomment' ");

 if(mysqli_num_rows($comment_query) > 0) {

$comment = mysqli_fetch_assoc($comment_query);

	
                $id =  $comment["id"],
              $poster = $comment["poster"],
                $content = $comment["comment_content"],
                $time_created = $comment["time_created"]      
      
         




 getCommentByID($id, $poster, $content, $time_created);
 }  else {
 	$mess ="No Comments.";
 	getCommentByID($mess,"","","");
 }



}


function getCommentByID($id, $poster, $content, $time_created){

 $getCommentByID['id'] = $id;
 $getCommentByID['poster'] = $poster;
 $getCommentByID['content'] = $content;
 $getCommentByID['time_created'] = $time_created; 

 $json_response = json_encode($getCommentByID);
 echo $json_response;
}





?>