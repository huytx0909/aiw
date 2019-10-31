const urlParams = new URLSearchParams(window.location.search);
const category = urlParams.get('category');

document.getElementById("category-name").textContent = category.concat(" news")

//GetArticlesByCategory
articlesByCategoryUrl = "http://localhost/aiw/php/newsAPI.php?category=".concat(category)
articlesRequest = new Request(articlesByCategoryUrl)

fetch(articlesRequest).then(response => response.json())
.then(articlesJson => getArticlesInfo(articlesJson))

function getArticlesInfo(articlesJson) {
    var categoryNews = articlesJson["category_news"]
    categoryNews.forEach(news => {
        id = news.id
        date = news.date
        title = news.title
        author = news.author
        intro = news.intro 
        displayArticles(id, date, title, author, intro)
    });
}

function displayArticles(id, date, title, author, intro) {
    //outer div
    div = document.createElement("div")
    div.className = "single-blog-post d-flex flex-wrap style-5 mb-30"
    document.getElementById("normal-news-row").appendChild(div)

    div1 = document.createElement("div")
    div1.className = "blog-thumbnail"
    div.appendChild(div1)

    a = document.createElement("a")
    a.href = "#"
    div1.appendChild(a)

    //image 
    image = document.createElement("img")
    image.src = "img/bg-img/28.jpg"
    a.appendChild(image)

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

    contentIntro = document.createElement("p")
    contentIntro.textContent = intro

    content.appendChild(contentDate)
    content.appendChild(contentTitle)
    content.appendChild(contentAuthor)
    content.appendChild(contentIntro)
    div.appendChild(content)



}