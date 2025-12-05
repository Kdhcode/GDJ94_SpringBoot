console.log("dsffsdfsdf");

const list = document.getElementById("list");

let num = list.getAttribute("data-product-num");



fetch(`./commentList?productNum=${num}`)
	.then(r => r.json())
	.then(r => {
		r.forEach(dto =>{
			const tr = document.createElement("tr");
			list.append(tr)		
			
			let usertd = document.createElement("td");
			usertd.innerText =dto.username;
			
			let contentstd = document.createElement("td");
			contentstd.innerText =dto.boardContents;
			
			let datetd = document.createElement("td");
			datetd.innerText =dto.boardDate;
			tr.append(usertd, contentstd, datetd);		
		})
		console.log(r)
		
	})
	.catch(e => console.log(e))

;