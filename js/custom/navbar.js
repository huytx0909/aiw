//GetAllCategories
categoriesUrl = "http://localhost/aiw/php/newsAPI.php?categories"
categoriesRequest = new Request(categoriesUrl)

fetch(categoriesRequest).then(response => response.json())
.then(categoriesJson => displayCategories(categoriesJson))

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