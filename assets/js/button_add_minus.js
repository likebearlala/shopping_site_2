

function minusNUM(num){
	let input = Number(document.getElementsByClassName("number")[num].value);
	if(input != 1){
		document.getElementsByClassName('number')[num].value=input-1;
	}
	var td=document.getElementsByTagName("td");
	let amount;
	let total=0;
	for(var i= 0;i<((td.length-3)/5);i++){
	   let text=Number(td[1+(i*5)].innerHTML);
	   let test=Number(document.getElementsByClassName("number")[i].value);
	   amount=text*test;
		td[3+(i*5)].innerHTML=amount;
		total+=amount;
	}
	document.getElementById("total").innerHTML=total;
}
function addNUM(num){
	let input = Number(document.getElementsByClassName("number")[num].value);
		document.getElementsByClassName('number')[num].value=input+1;
		var td=document.getElementsByTagName("td");
		let amount;
		let total=0;
		for(var i= 0;i<((td.length-3)/5);i++){
		   let text=Number(td[1+(i*5)].innerHTML);
		   let test=Number(document.getElementsByClassName("number")[i].value);
		   amount=text*test;
			td[3+(i*5)].innerHTML=amount;
			total+=amount;
		}
		document.getElementById("total").innerHTML=total;
}


