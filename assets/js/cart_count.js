
        // $(document).ready(function(){
        //     $(".amount").load(function(){
        //       document.write("NT$" + $(".number").val());
        //     });
        //   });
        var price =  document.getElementsByClassName('.price').textContent;
        var number = document.getElementsByClassName('.number').textContent;
        var amount = price * number;
        amount = document.getElementsByClassName('.show_amount').textContent;
        var total=0;
        total += amount ;
        alert(number);


            $(".delete").click(function () {
              $(this).parent().parent().remove();
            });
 
        
