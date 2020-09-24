function sort() {

  const sortByCategory = document.getElementById("sort-by-category")
  const sortByCode = document.getElementById("sort-by-code")
  const sortByCodeDisplay = document.getElementById("sort-by-code-display")
  const sortByCategoryDisplay = document.getElementById("sort-by-category-display")

  sortByCode.setAttribute("style", "background-color: lightblue;");
  sortByCategoryDisplay.setAttribute("style", "display: none;");

  sortByCategory.addEventListener('click', function(){
    this.setAttribute("style", "background-color: lightblue;");
    sortByCode.setAttribute("style", "background-color: white;");
    sortByCodeDisplay.setAttribute("style", "display: none;");
    sortByCategoryDisplay.setAttribute("style", "display: block;");
  })

  sortByCode.addEventListener('click', function(){
    this.setAttribute("style", "background-color: lightblue;");
    sortByCategory.setAttribute("style", "background-color: white;");
    sortByCategoryDisplay.setAttribute("style", "display: none;");
    sortByCodeDisplay.setAttribute("style", "display: block;");
  })
}
window.addEventListener('load', sort)