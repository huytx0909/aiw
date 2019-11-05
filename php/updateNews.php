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

if(!empty($data->id) && !empty($data->title) && !empty($data->short_intro) && !empty($data->author) && !empty($data->content) && !empty($data->id_category) && !empty($data->date_created))
{
		$id = $data->id;
	$title = $data->title;
	$intro = $data->short_intro;
	$author = $data->author;
	$content = $data->content;
	$IDcategory = $data->id_category;
	$date_created = $data->date_created;

	$news_sql = "UPDATE news SET title = '$title', short_intro = '$intro', author = '$author', content = '$content', id_category = '$IDcategory', date_created = '$date_created' WHERE id = '$id'";
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