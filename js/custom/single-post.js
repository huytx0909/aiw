var id = localStorage.getItem("id")
var postAuthor
var postContent

console.log(id)

//get news by id
var url = 'http://localhost/aiw/php/newsAPI.php?IDnews='.concat(id)

request = new Request(url)

fetch(request).then(response => response.json())
.then(singleNewsJson => getSingleNews(singleNewsJson))

function getSingleNews(singleNewsJson) {
    id = singleNewsJson.id
    title = singleNewsJson.title
    date = singleNewsJson.date
    postAuthor = singleNewsJson.author
    postContent = singleNewsJson.content
    comments = singleNewsJson.commentArr
    tags = singleNewsJson.tag
    displaySingleNews(title, date, postAuthor, postContent)
    displayComments(comments)
    displayTags(tags)
}

function displaySingleNews(title, date, author, content) {
    document.getElementById("article-title").textContent = title
    document.getElementById("article-date").textContent = date
    document.getElementById("article-author").textContent = "By ".concat(author)
    document.getElementById("article-detail").textContent = content
    image = document.getElementById("content-imange")
    image.src = 'img/bg-img/'.concat(6 + Math.floor(Math.random() * 18)).concat('.jpg')
}

function displayComments(comments) {
    comments.forEach(comment => {
        li = document.createElement("li")
        li.className = "single_comment_area"

        commentContent = document.createElement("div")
        commentContent.className = "comment-content d-flex"
        li.appendChild(commentContent)

        //author
        author = document.createElement("div")
        author.className = "comment-author"
        commentContent.appendChild(author)
        //image
        image = document.createElement("img")
        image.src = "img/bg-img/32.jpg"
        author.appendChild(image)
        //meta
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

        // editBtn
        editAnchor = document.createElement("a")
        editAnchor.href="javascript: void(0)"
        editAnchor.onclick = function () {
            getEditCommentDetails(comment.id, id, comment.content, comment.name)
        }
        
        
        editIcon = document.createElement("i")
        editIcon.className = "fa fa-pencil-square-o"
        editAnchor.appendChild(editIcon)
    
        // Delete 
        deleteAnchor = document.createElement("a")
        deleteAnchor.href="javascript: void(0)"
        deleteAnchor.onclick = function() {
            confirmDeleteComment(comment.id)
        }
        deleteIcon = document.createElement("i")
        deleteIcon.className = "fa fa-trash ml-3"
        deleteAnchor.appendChild(deleteIcon)


        dflex.appendChild(authorName)
        dflex.appendChild(date)
        dflex.appendChild(editAnchor)
        dflex.appendChild(deleteAnchor)

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
        tagDisplay.textContent = tag.name.concat("  |  ")
        tagDisplay.href = "http://localhost/aiw/category.html?tag=".concat(tag.name)
        document.getElementById("comment-tags").append(tagDisplay)
    });
}


//Edit news
function getEditNewsDetails() {
bootbox.confirm({ 
    title: "Edit article",
    size: "large",
    message: "Author:<input  class='ml-3' style='width: 30vw; height : 20vh' value='".concat(postAuthor).concat("' type='text' id='new-author' /><br/>\
    Content:<input class='mt-3 ml-3' style='width: 30vw; height : 60vh' value='".concat(postContent).concat("' type='text' id='new-content' />")),
    callback: function(result){
        if (result) {
        newAuthor = document.getElementById('new-author').value
        newContent = document.getElementById('new-content').value
        editNews(newAuthor, newContent)    
        }
    }
})
}

function editNews(newAuthor, newContent) {
    url = 'http://localhost/aiw/php/updateNews.php'
    var news = {
        id : id, 
        author : newAuthor, 
        content : newContent
    }
    
    fetch(url, {
        method : 'PUT',
        headers: {
            'content-type' : 'application/json'
        },
        body : JSON.stringify(news)
    })
    .then(function(data) {
        console.log('request success', data)
    })

    document.getElementById("article-author").textContent = "By ".concat(newAuthor)
    document.getElementById("article-detail").textContent = newContent
}

//Delete News

function confirmDelete() {
    bootbox.confirm({
        title : "Confirm delete?",
        size: "large",
        message: "Are you sure you want to delete this article? <br> \
        This action cannot be undone!",
        callback: function(result){
            if (result) {
            deleteArticle(id)   
            }
        }
    })
}

function deleteArticle(id) {
    url = 'http://localhost/aiw/php/deleteNews.php'
    var idObject = {
        id : id
    }
    fetch(url, {
        method : "DELETE",
        headers : {
            'content-type' : 'application/json'
        },
        body: JSON.stringify(idObject)
    }).then(function(data){
        console.log('request success', data)
        history.back(-1)
    })
}

//=================Comments=====================

//post comments 

function postComment() {
    url = "http://localhost/aiw/php/createComment.php"

    commenter = document.getElementById("name").value
    message = document.getElementById("message").value
    
    var commentDetails = {
        poster : commenter,
        comment_content : message, 
        id_news : id
    }

    if (commenter == null || message == null) {
        alert("invalid input, please check again")
    } else {
        fetch(url, {
            method : "POST",
            headers: {
                'content-type' : 'application/json'
            },
            body : JSON.stringify(commentDetails)
        }).then(function(data) {
            console.log("success posting comment", data)
        }).then(function() {
            console.log("error posting comment")
        })
    }
}

// edit comment

function getEditCommentDetails(commentId, id, oldContent, commenter) {
    bootbox.prompt({
        title : "Fix your comment",
        value : oldContent,
        callback: function(result){ 
            if (result) {
                console.log(result); 
                editComment(commentId, id, commenter, result)   
            }
    }, 
    });
}  

function editComment(commentId, newsId, commenter, content) {
    var url = "http://localhost/aiw/php/updateComment.php"

    var commentDetails = {
        id : commentId, 
        poster : commenter, 
        comment_content : content, 
        id_news : newsId
    }

    if (commenter == null) {
        alert("invalid input, please check again")
    } else {
        fetch(url, {
            method : "PUT",
            headers: {
                'content-type' : 'application/json'
            },
            body : JSON.stringify(commentDetails)
        }).then(function(data) {
            console.log("success editing comment", data)
        })
    }
    window.location = 'http://localhost/aiw/single-post.html'
}

function confirmDeleteComment(commentId) {
    bootbox.confirm({
        title : "Confirm delete?",
        size: "small",
        message: "Are you sure you want to delete this comment?",
        callback: function(result){
            if (result) {
            deleteComment(commentId)   
            }
        }
    })
}

function deleteComment(commentId) {
    var url = "http://localhost/aiw/php/deleteComment.php"

    var commentDetails = {
        id : commentId
    }

        fetch(url, {
            method : "PUT",
            headers: {
                'content-type' : 'application/json'
            },
            body : JSON.stringify(commentDetails)
        }).then(function(data) {
            console.log("success editing comment", data)
        })
    window.location = 'http://localhost/aiw/single-post.html'
}