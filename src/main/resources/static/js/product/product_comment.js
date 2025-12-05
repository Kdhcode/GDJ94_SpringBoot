console.log("dsffsdfsdf");

const list = document.getElementById("list");

let num = list.getAttribute("data-product-num");
const commentAdd = document.getElementById("commentAdd");

commentAdd.addEventListener("click",()=>{
	console.log("aaaaaaaaaaaaaaa")
})

fetch(`./commentList?productNum=${num}`)
	.then(r => r.text())
	.then(r => {
		list.innerHTML=r;		
	})
	.catch(e => console.log(e))

;