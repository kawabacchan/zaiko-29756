function sort() {
  const sortByCode = document.getElementById("sort-by-code")
  const sortByCategory = document.getElementById("sort-by-category")
  const sortCreationList =document.getElementById("sort-creation-list")
  const sortByCodeDisplay = document.getElementById("sort-by-code-display")
  const sortByCategoryDisplay = document.getElementById("sort-by-category-display")
  const sortCreationListDisplay = document.getElementById("sort-creation-list-display")

  sortByCode.setAttribute("style", "background-color: lightblue;");
  sortByCodeDisplay.setAttribute("style", "display: block;");

  sortByCategory.addEventListener('click', function(){
    this.setAttribute("style", "background-color: lightblue;");
    sortByCategoryDisplay.setAttribute("style", "display: block;");
    sortByCode.setAttribute("style", "background-color: white;");
    sortByCodeDisplay.setAttribute("style", "display: none;");
    sortCreationList.setAttribute("style", "background-color: white;");
    sortCreationListDisplay.setAttribute("style", "display: none;");
  })

  sortByCode.addEventListener('click', function(){
    this.setAttribute("style", "background-color: lightblue;");
    sortByCodeDisplay.setAttribute("style", "display: block;");
    sortByCategory.setAttribute("style", "background-color: white;");
    sortByCategoryDisplay.setAttribute("style", "display: none;");
    sortCreationList.setAttribute("style", "background-color: white;");
    sortCreationListDisplay.setAttribute("style", "display: none;");
  })

  sortCreationList.addEventListener('click', function(){
    this.setAttribute("style", "background-color: lightblue;");
    sortCreationListDisplay.setAttribute("style", "display: block;");
    sortByCategory.setAttribute("style", "background-color: white;");
    sortByCategoryDisplay.setAttribute("style", "display: none;");
    sortByCode.setAttribute("style", "background-color: white;");
    sortByCodeDisplay.setAttribute("style", "display: none;");
  })

}
window.addEventListener('load', sort)