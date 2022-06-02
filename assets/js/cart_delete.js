// 購物車刪除功能

function deleteTR(td) {
    var table = td.parentNode;
    var tr = td.parentNode;
    table.removeChild(tr);
}