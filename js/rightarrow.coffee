---
---
texts = ["li", "p"]
query = ("article.post-content #{text}" for text in texts).join(", ")
els = document.querySelectorAll(query)

replArrows = (el) -> 
    el.innerHTML = el.innerHTML.replace(/\=&gt;/g, "\$\\Rightarrow\$")
    return

replArrows(el) for el in els
