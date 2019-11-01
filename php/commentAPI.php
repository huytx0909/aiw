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





//post comment
//localhost/aiw-master/php/commentAPI.php?IDnews=1

if(isset($_GET['IDnews']) && !empty($_GET['IDnews']) && isset($_POST['postComment'])){
  if(!empty($_POST['content']) && !empty($_POST['poster'])) {
   $content = $_POST['content'];
   $poster = $_POST['poster'];
   $IDnews = $_GET['IDnews'];

   $post_query = mysqli_query($db,"INSERT INTO comment(poster, comment_content, id_news) VALUES('$poster', '$content', '$IDnews')");

   //header location ra trang của single news đó.
  }
   else {
 	$mess ="please input your name and comment";
	echo json_encode($mess); 
		} 
} 




//edit comment
//localhost/aiw-master/php/commentAPI.php?IDcomment=1

if(isset($_GET['IDcomment']) && !empty($_GET['IDcomment']) && isset($_POST['editComment'])){
  if(!empty($_POST['content'])) {
   $content = $_POST['content'];
      $IDcomment = $_GET['IDcomment'];


   $edit_query = mysqli_query($db,"UPDATE `comment` SET comment_content = '$content' WHERE id = '$IDcomment'");

   //header location ra trang của single news đó.
  }
   else {
 	$mess ="please input your comment";
	echo json_encode($mess); 
		} 
} 




//delete comment
//localhost/aiw-master/php/commentAPI.php?IDcomment=1

if(isset($_GET['IDcomment']) && !empty($_GET['IDcomment']) && isset($_POST['deleteComment'])){
  $IDcomment = $_GET['IDcomment'];


   $edit_query = mysqli_query($db,"DELETE FROM `comment` WHERE id = '$IDcomment'");

   //header location ra trang của single news đó.

} 



//get comment by IDcomment
//localhost/aiw-master/php/commentAPI.php?ID=1


if (isset($_GET['ID']) && $_GET['ID'] != "") {
 $IDcomment = $_GET['ID'];
$comment_query = mysqli_query($db, "SELECT * FROM `comment` WHERE id = '$IDcomment' ");

 if(mysqli_num_rows($comment_query) > 0) {

$comment = mysqli_fetch_assoc($comment_query);

	
                $id =  $comment["id"],
              $name = $comment["name"],
                $content = $comment["comment_content"],
                $time_created = $comment["time_created"]      
      
         




 getCommentByID($id, $name, $content, $time_created);
 }  else {
 	$mess ="No Comments.";
 	getCommentByID($mess,"","","");
 }



}


function getCommentByID($id, $name, $content, $time_created){

 $getCommentByID['id'] = $id;
 $getCommentByID['name'] = $title;
 $getCommentByID['content'] = $date;
 $getCommentByID['time_created'] = $author; 

 $json_response = json_encode($getCommentByID);
 echo $json_response;
}





?>