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
    comments = singleNewsJson.commentArr
    tags = singleNewsJson.tag
    displaySingleNews(title, date, author, content)
    displayComments(comments)
    displayTags(tags)
}

function displaySingleNews(title, date, author, content) {
    document.getElementById("article-title").textContent = title
    document.getElementById("article-date").textContent = date
    document.getElementById("article-author").textContent = "By ".concat(author)
    document.getElementById("article-detail").textContent = content
}

function displayComments(comments) {
    comments.forEach(comment => {
        li = document.createElement("li")
        li.className = "single_comment_area"

        commentContent = document.createElement("div")
        commentContent.className = "comment-content d-flex"
        li.appendChild(commentContent)

        author = document.createElement("div")
        author.className = "comment-author"
        commentContent.appendChild(author)
        
        image = document.createElement("img")
        image.src = "img/bg-img/32.jpg"
        author.appendChild(image)

        meta = document.createElement("div")
        meta.className = "comment-meta"
        commentContent.appendChild(meta)

        dflex = document.createElement("div")
        dflex.className = "d-flex"
        meta.appendChild(dflex)

        authorName = document.createElement("a")
        authorName.className = "post-author"
        authorName.textContent = comment.name

        date = document.createElement("a")
        date.className  = "post-date"
        date.textContent = comment.time_created

        dflex.appendChild(authorName)
        dflex.appendChild(date)

        content = document.createElement("p")
        content.textContent = comment.content
        meta.appendChild(content)

        //append to comment list
        document.getElementById("comment-list").appendChild(li)
    });
}

function displayTags(tags) {
    tags.forEach(tag => {
        tagDisplay = document.createElement("a")
        tagDisplay.textContent = tag.name.concat("| ")
        tagDisplay.href = "http://localhost/aiw/category.html?tag=".concat(tag.name)
        document.getElementById("comment-tags").append(tagDisplay)
    });
}
