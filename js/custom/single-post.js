//get news by id
var url = 'http://localhost/aiw/php/newsAPI.php?IDnews='.concat(localStorage.getItem("id"))

request = new Request(url)

fetch(request).then(response => response.json())
.then(singleNewsJson => getSingleNews(singleNewsJson))

function getSingleNews(singleNewsJson) {
    title = singleNewsJson.title
    date = singleNewsJson.date
    author = singleNewsJson.author
    content = singleNewsJson.content
    displaySingleNews(title, date, author, content)
}

function displaySingleNews(title, date, author, content) {
    document.getElementById("article-title").textContent = title
    document.getElementById("article-date").textContent = date
    document.getElementById("article-author").textContent = "By ".concat(author)
    document.getElementById("article-detail").textContent = content
}