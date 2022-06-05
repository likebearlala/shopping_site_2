
        // $(document).ready(function(){
        //     $(".amount").load(function(){
        //       document.write("NT$" + $(".number").val());
        //     });
        //   });
        // var price =  document.getElementsByClassName('.price').textContent;
        // var number = document.getElementsByClassName('.number').textContent;
        // var amount = price * number;
        // amount = document.getElementsByClassName('.show_amount').textContent;
        // var total=0;
        // total += amount ;
        // alert(number);
        // window.onload = function(){

        // }
       
        
        // var input = document.getElementsByClassName(".number");
        // for (var k = 0; k < input.length; k++) {
        //   input[k].onclick = function() {
        //     bt = this;
        //     //获取小计节点
        //     at = this.parentElement.parentElement.nextElementSibling;
        //     //获取单价节点
        //     pt = this.parentElement.parentElement.previousElementSibling;
        //     //获取数量值
        //     node = bt.parentNode.childNodes[1];
        //     console.log(node);
        //     num = node.innerText;
        //     num = parseInt(num);
        //     num++;
        //     node.innerText = num;
        //     //获取单价
        //     price = pt.innerText;
        //     price = price.substring(0, price.length - 1);
        //     //计算小计值
        //     at.innerText = price * num + "元";
        //     //计算总计值
        //     getAmount();
        //   }
        // }

  //       function getAmount() {
  //         //获取选中的选择框
  //         ns = document.getElementsByClassName("i_acity");
  //         //初始化总价
  //         sum = 0;
  //         //选中框
  //         document.getElementById("price_num").innerText = sum;
  //         for (y = 0; y < ns.length; y++) {
  //           //小计
  //           amount_info = ns[y].parentElement.parentElement.lastElementChild.previousElementSibling;
  //           num = parseInt(amount_info.innerText);
  //           sum += num;
  //           document.getElementById("price_num").innerText = sum;
  //         }
  //       }

//   var add = document.querySelectorAll(".button-num-add");  
//   var minus = document.querySelectorAll(".button-num-minus");  
//     for (var i = 0; i < add.length; i++) {  
//         add[i].onclick = function () {  
//             var num = Number(this.previousElementSibling.value);  
//             num++;  
//             this.previousElementSibling.value = num;  
//             var price = this.previousElementSibling.previousElementSibling.previousElementSibling.firstElementChild.innerHTML;  
//             this.nextElementSibling.firstElementChild.innerHTML = price * num;  
//         }  
//     }  
//     for (var i = 0; i < minus.length; i++) {  
//         minus[i].onclick = function () {  
//             var num = Number(this.nextElementSibling.value);  
//             num--;  
//             this.nextElementSibling.value = num;  
//             var price = this.previousElementSibling.firstElementChild.innerHTML;  
//             this.nextElementSibling.nextElementSibling.nextElementSibling.firstElementChild.innerHTML = price * num;  
//         }  
//     }