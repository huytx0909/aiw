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

if(!empty($data->title) && !empty($data->short_intro) && !empty($data->author) && !empty($data->content) && !empty($data->id_category) && !empty($data->date_created))
{
	$title = $data->title;
	$intro = $data->short_intro;
	$author = $data->author;
	$content = $data->content;
	$IDcategory = $data->id_category;
	$date_created = $data->date_created;

	$news_sql = "INSERT INTO news(title, short_intro, author, content, id_category, date_created) VALUES('$title', '$intro', '$author', '$content', '$IDcategory', '$date_created')";
	$news_query = mysqli_query($db, $news_sql);
	if($news_query) {

		 // set response code - 201 created
        http_response_code(201);
 
        // tell the user
        echo json_encode(array("message" => "News was created."));

	} else {

		// set response code - 503 service unavailable
        http_response_code(503);
 
        // tell the user
        echo json_encode(array("message" => "Unable to create news."));

	}
	} else {

		 // set response code - 400 bad request
    http_response_code(400);
 
    // tell the user
    echo json_encode(array("message" => "Unable to create news. Data is incomplete."));
	}

?>