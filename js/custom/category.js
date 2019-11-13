const urlParams = new URLSearchParams(window.location.search);
const category = urlParams.get('category');
const tag = urlParams.get('tag')

if (category != null) {
    document.getElementById("collection-choice").textContent = "CATEGORY"
    document.getElementById("category-name").textContent = category.concat(" news")    
    //GetArticlesByCategory
    articlesByCategoryUrl = "http://localhost/aiw/php/newsAPI.php?category=".concat(category)
    articlesRequest = new Request(articlesByCategoryUrl)

    fetch(articlesRequest).then(response => response.json())
    .then(articlesJson => getArticlesInfo(articlesJson))
} else {
    document.getElementById("collection-choice").textContent = "TAG"
    document.getElementById("category-name").textContent = tag.concat(" news")    
    //GetArticlesByTag
    articlesByTagUrl = "http://localhost/aiw/php/newsAPI.php?tag=".concat(tag)
    articlesRequest = new Request(articlesByTagUrl)

    fetch(articlesRequest).then(response => response.json())
    .then(articlesJson => getArticlesInfo(articlesJson))
}

function getArticlesInfo(articlesJson) {
    var selection 
    if (articlesJson["category_news"] != null) {
        console.log("is category")
        selection = "category_news"
    } else {
        console.log("is tag")
        selection = "news_with_tag"
    }
    var categoryNews = articlesJson[selection]
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
    image.src = 'img/bg-img/'.concat(6 + Math.floor(Math.random() * 18)).concat('.jpg')
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