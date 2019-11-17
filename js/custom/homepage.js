const SPOTLIGHT_NEWS_LENGTH = 3
// id: id in db
// postId: id of webpage post

//Get all news 
var url = 'http://localhost/aiw/php/newsAPI.php?news'

var request = new Request(url)
fetch(request).then(response => response.json())
.then(function(allNewsJson) {
    getSpotlightNews(allNewsJson)
    getNormalNews(allNewsJson)
})

function getSpotlightNews(allNewsJson) {
        var data = allNewsJson["all_news"]
        var postId = 1
        for (var i = 0; i < SPOTLIGHT_NEWS_LENGTH; i++) {
            id = data[i]["id"]
            date = data[i]["date"]
            title = data[i]["title"]
            url = data[i]["url"]
            displaySpotlightNews(date, title, postId, url, id)
            postId++
        }
}

function displaySpotlightNews(date, title, postId, url, id) {
    document.getElementById("hero-date-".concat(postId)).textContent = date
    postTitle = document.getElementById("hero-title-".concat(postId))
    postTitle.textContent = title
    postTitle.onclick = function() {
        localStorage.setItem("id", id)
        window.location = "http://localhost/aiw/single-post.html"
    }    
}

function getNormalNews(allNewsJson) {
    var data = allNewsJson["all_news"]
    for (var i = SPOTLIGHT_NEWS_LENGTH; i < data.length; i++) {
       id = data[i]["id"]
       date = data[i]["date"]
       title = data[i]["title"]
       author = data[i]["author"]
       url = data[i]["url"]
       displayNormalNews(date, title, author, url, id)
    }
}

function displayNormalNews(date, title, author, url, id) {
    //outer div
    div = document.createElement("div")
    div.className = "col-12 col-sm-6 col-lg-4"
    document.getElementById("top-news-row").appendChild(div)

    div1 = document.createElement("div")
    div1.className= "single-blog-post style-2 mb-5"
    div.appendChild(div1)

    div2 = document.createElement("div")
    div2.className =  "blog-thumbnail"
    div1.appendChild(div2)

    //image
    image = document.createElement("img")
    image.src = 'img/bg-img/'.concat(6 + Math.floor(Math.random() * 18)).concat('.jpg')
    div2.appendChild(image)

    //content
    content = document.createElement("div")
    content.className = "blog-content"

    contentDate = document.createElement("span")
    contentDate.className = "post-date"
    contentDate.textContent = date
    
    contentTitle = document.createElement("a")
    contentTitle.className = "post-title"
    contentTitle.href = "#"
    contentTitle.onclick = function() {
        localStorage.setItem("id", id)
        window.location = "http://localhost/aiw/single-post.html"
    }    
    contentTitle.textContent = title

    contentAuthor = document.createElement("a")
    contentAuthor.className = "post-author"
    contentAuthor.href = "#"
    contentAuthor.textContent = author

    content.appendChild(contentDate)
    content.appendChild(contentTitle)
    content.appendChild(contentAuthor)
    div2.appendChild(content)
}

//Get all categories


//Create Article
var createNewsUrl = 'http://localhost/aiw/php/createNews.php'

function createNews() {
    inputAuthor = document.getElementById("author").value
    inputTitle = document.getElementById("title").value
    inputIntro = document.getElementById("intro").value
    inputContent = document.getElementById("content").value
    inputCategory = document.getElementById("category-choice").value

    var news = {
        title : inputTitle,
        short_intro : inputIntro,
        content : inputContent,
        author : inputAuthor, 
        id_category : inputCategory.substring(0,1), 
    }

    fetch(createNewsUrl, {  
        method: 'POST',  
        headers: {  
          'content-type': 'application/json'  
        },  
         body: JSON.stringify(news)
    })
    .then(function (data) {  
      console.log('Request success: ', data);  
    })  
    .catch(function (error) {  
      console.log('Request failure: ', error);  
    });
}
