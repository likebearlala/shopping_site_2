// 購物車刪除功能

$(document).ready(function () {
    $(".delete").click(function () {
      $(this).parent().parent().remove();
    });
  });



