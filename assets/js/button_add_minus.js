

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



// for(var num=0;num<=)
// function debug(num){
// 	let input = Number(document.getElementsByClassName("number")[num].value);
// 	if( input >0){
// 		if(Number.isInteger(input)){
// 			alert(input);
// 			return;
// 		}else{
// 			alert("請輸入正整數值");
// 			window.location.assign("../../pages/shopping_cart.html");
// 		}
// 	}
// 	else{
// 		alert("請勿輸入非正數值");
// 		window.location.assign("../../pages/shopping_cart.html");
// 	}
// }
