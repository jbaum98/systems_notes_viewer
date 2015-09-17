---
---
article = document.getElementsByClassName("post-content")[0]
renderMathInElement article,
  delimiters: [
    {left: "$", right: "$", display: false}
    {left: "$$", right: "$$", display: true}
  ]
