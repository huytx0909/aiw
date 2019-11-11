<?php

// required headers
header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
// header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");
 include('../dbase/dbase.php');

// get posted data
$data = json_decode(file_get_contents("php://input"));

if(!empty($data->id) && !empty($data->author) && !empty($data->content))
{
	$id = $data->id;
	$author = $data->author;
	$content = $data->content;
	$date_created = date("Y/m/d");

	$news_sql = "UPDATE news SET author = '$author', content = '$content', date_created = '$date_created' WHERE id = '$id'";
	$news_query = mysqli_query($db, $news_sql);
	if($news_query) {

		// set response code - 201 update
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "News was updated."));

	} else {

		// set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to update news."));

	}
	} else {

		 // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to update news. Data is incomplete."));
	}

?>