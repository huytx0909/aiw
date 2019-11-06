//GetAllCategories
categoriesUrl = "http://localhost/aiw/php/categoryAPI.php?category"
categoriesRequest = new Request(categoriesUrl)

fetch(categoriesRequest).then(response => response.json())
.then(function(categoriesJson) {
    displayCategories(categoriesJson)
    fillCategorySelection(categoriesJson)
}) 

function displayCategories(categoriesJson) {
    categoryNavbar = document.getElementById("category-navbar")
    categories = categoriesJson["all_categories"]
    categories.forEach(category => {
        li = document.createElement("li")
        a = document.createElement("a")
        categoryName = category["category_name"]
        a.href = "http://localhost/aiw/category.html?category=".concat(categoryName)
        a.textContent = categoryName
        li.appendChild(a)

        categoryNavbar.appendChild(li)
    });
}

function fillCategorySelection(categoriesJson) {
    categorySelect = document.getElementById("category-choice")
    categories = categoriesJson["all_categories"]
    categories.forEach(category => {
        option = document.createElement("option")
        option.textContent = category["id"].concat("-").concat(category["category_name"])
        categorySelect.appendChild(option)
    })
}

