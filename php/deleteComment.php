<?php

// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 include('../dbase/dbase.php');

// get posted data
$data = json_decode(file_get_contents("php://input"));

if(!empty($data->id))
{
		$id = $data->id;
	

	$comment_sql = "DELETE FROM comment WHERE id = '$id'";
	$comment_query = mysqli_query($db, $comment_sql);
	if($comment_query) {

		 // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "Comment was deleted."));

	} else {

		// set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to deleted Comment."));

	}
	} else {

		 // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to deleted Comment. Data is incomplete."));
	}

?>