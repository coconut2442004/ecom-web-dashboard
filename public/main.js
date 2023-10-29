// menu item color
const colors = ["#6ab04c", "#eb4d4b", "#22a6b3", "#f6b93b", "#474787"];
const menuItems = document.querySelectorAll(".menu_item");
const menuIcons = document.querySelectorAll(".menu_icon");
const menuInfors = document.querySelectorAll(".menu_info");
const hasChilds = document.querySelectorAll(".has_child");

menuIcons.forEach((element, index) => {
    element.style.backgroundColor = colors[index];
});

menuInfors.forEach((element, index) => {
    element.addEventListener("mouseover", event => {
        element.style.color = colors[index];
    });

    element.addEventListener("mouseout", event => {
        element.style.color = 'var(--text)';
    });
})

hasChilds.forEach((element, index) => {
    element.addEventListener("click", event => {
        element.classList.toggle("active");
        const childElement = element.children[1];
        if (element.classList.contains("active")) {
            let totalHeight = 0;
            for (let i = 0; i < childElement.children.length; i++) {
                totalHeight += childElement.children[i].clientHeight;
            }
            childElement.style.height = totalHeight + 'px';
        } else {
            childElement.style.height = 0 + 'px';
        }
    })
})