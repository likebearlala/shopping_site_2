
function minusNUM(num){
	let input = Number(document.getElementsByClassName("number")[num].value);
	if(input != 1){
		document.getElementsByClassName('number')[num].value=input-1;
	}
}
function addNUM(num){
	let input = Number(document.getElementsByClassName("number")[num].value);
		document.getElementsByClassName('number')[num].value=input+1;
}


