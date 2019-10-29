const SPOTLIGHT_NEWS_LENGTH = 3

//Get all news 
var url = 'http://localhost/aiw/php/newsAPI.php?news'

var request = new Request(url);
fetch(request).then(response => response.json())
.then(function(allNewsJson) {
    getSpotlightNews(allNewsJson)
    getNormalNews(allNewsJson)
})

function getSpotlightNews(allNewsJson) {
        var data = allNewsJson["all_news"]
        var articleId = 1
        for (var i = 0; i < SPOTLIGHT_NEWS_LENGTH; i++) {
            date = data[i]["date"]
            title = data[i]["title"]
            displaySpotlightNews(date, title, articleId)
            articleId++
        }
}

function displaySpotlightNews(date, title, articleId) {
    document.getElementById("hero-date-".concat(articleId)).textContent = date
    document.getElementById("hero-title-".concat(articleId)).textContent = title
    console.log(date, title)
}

function getNormalNews(allNewsJson) {
    var data = allNewsJson["all_news"]
    for (var i = SPOTLIGHT_NEWS_LENGTH; i < data.length; i++) {
        // create a template of normal news
        var temp = document.getElementsByTagName("template")[0]
        var clone = temp.content.cloneNode(true)

        var normalNewsClass = document.getElementById("top-news-row")
        console.log(temp.content)
        normalNewsClass.appendChild(clone)
    }
}
