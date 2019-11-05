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
	

	$news_sql = "DELETE FROM news WHERE id = '$id'";
	$news_query = mysqli_query($db, $news_sql);
	if($news_query) {

		 // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "News was deleted."));

	} else {

		// set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to deleted news."));

	}
	} else {

		 // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to deleted news. Data is incomplete."));
	}

?>