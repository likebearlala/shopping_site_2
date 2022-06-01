// 購物車刪除功能

function plus(add) {
    var nex = add.previousElementSibling;
    nex.value = Number(nex.value) + 1;
    var s = parseInt(add.parentNode.previousElementSibling.innerHTML);
    var num = s * Number(nex.value);
    nex.parentNode.nextElementSibling.innerHTML = num;
}

function minus(reduce) {
    var pre = reduce.nextElementSibling;
    if (pre.value >= 1) {
        pre.value = Number(pre.value) - 1;
        var s = parseInt(reduce.parentNode.previousElementSibling.innerHTML);
        var num = s * Number(pre.value);
        pre.parentNode.nextElementSibling.innerHTML = num;
    }
}

function deltr(td) {
    var table = td.parentNode.parentNode;
    var tr = td.parentNode;
    table.removeChild(tr);
}