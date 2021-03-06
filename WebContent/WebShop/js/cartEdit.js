

	
//doFirst--------------------------------
$(function() {
	
	updateData();

//	function createCarList(itemKey,itemValue){ 
//	var itemId = itemKey;
//	var itemName = itemValue.split('|')[1];
//	var itemImage = itemValue.split('|')[2];
//	var itemPrice = parseInt(itemValue.split('|')[3]);
//	var itemQty   = parseInt(itemValue.split('|')[4]);
//	var itemTotal = itemPrice * itemQty;
//	
//	//建立每個品項的清單區域 ==tr:
//	$('.table tbody').eq(0).append(" <tr id=" + itemId + "><td>"
//		+ " <div class=media> <a class='thumbnail pull-left' href=#>"
//		+ " <img class=media-object src="+ itemImage + ">"
//		+ "	</a><div class=media-body>"
//		+ "            <h4 class=media-heading><a href=# class=name>"+ itemName +"</a></h4>"
//		+ "            <h5 class=media-heading> by <a href=#>包裝</a></h5>"
//		+ "            <span>Status: </span><span class=text-success><strong>In Stock</strong></span>"           	
//		+ " </div></div></td>"	
//		+ " <td class=price>" + itemPrice + "</td>"
//		+ " <td class=countTd><button class=minus onclick=changeAmount($(this));>－</button>" 
//		+ "	<input class=count type=text size=1 value=" + itemQty +">"
//		+ "	<button class=plus  onclick=changeAmount($(this));>＋</button>"
//		+ " </td> <td class=total>" + itemTotal + "</td>"
//		+ " <td class=remove>"
//		+ "	<button type=button class='btn btn-danger' onclick=setDel($(this));>"
//		+ "	<span class='glyphicon glyphicon-remove'></span> Remove</button>"
//		+ " </td></tr>");
//	}
	
	$("[data-toggle='tooltip']").tooltip();
	
	$('#shop_insert_order').click(function(){
		if(confirm("您確定要完成購買嗎")){
			location.href='../_21_ShoppingOrder/Order';
		}else{
			return;
		}
	});
	

});

//判斷是點擊+還是-,如果數量是1點擊-時一樣設定數量為1,並同時更新總金額及數量----
function changeAmount(obj) {
	var td = obj.parent(), btn = obj.attr('class'), c = td.find('.count'), v = parseInt(c.val());
	btn.indexOf('minus') == 0 ? v -= 1 : btn.indexOf('plus') == 0 && (v += 1);
	v <= 1 ? c.val(1) : c.val(v);

	var tr = td.parent(), p = tr.find('.price').text(), t = tr.find('.total');
	v <= 1 ? t.text(p) : t.text(p * v);

	var thisID = obj.parents('tr').attr('id');
	var newQty = v;
	
	$.ajax({
		 url: '../_05_Stock/getProductStock.do',
        type:'POST',
        data : "productId=" + thisID,
        dataType:'json',
        success: function(quantity){    	
        	if( v > quantity){
        		alert("目前庫存只剩" + quantity + "個");
        		c.val(quantity);
        		updateData();
        		return;
        	}
        	
        	$.ajax({	
                url: '../_20_ShoppingCart/UpdateProductServlet.do',
                type:'POST',
                data:"cmd=MOD" + "&productId=" + thisID + "&newQty=" + newQty,
            });

        	updateData();
        }
    });
}

//刪除該項產品-----------------------------
function setDel(obj) {
	if (confirm("確定刪除此項商品 ?")) {
		var thisID = obj.parents('tr').attr('id');
		$.ajax({	
	        url: '../_20_ShoppingCart/UpdateProductServlet.do',
	        type:'POST',
	        data:"cmd=DEL" + "&productId=" + thisID ,
	    });
		//再清除該列元素
		obj.parents('tr').remove();
	
	updateData();
	}
}

//畫面載入時先讀取資訊-----------------------------
function updateData(){
	//畫面載入時計算單項物品的總金額	
	for(i=0; i< $('.price').size();i++){
		var p = $('.price').eq(i).text();
		var c = $('.count').eq(i).val();
		var total = p * c;
		$('.total').eq(i).text(total);
	}
	//畫面載入時計算物品總金額
	var subtotal = 0;
	$('.total').each(function() {
		var t = parseInt($(this).text());
		subtotal += t;
	});
	$('.subtotal').text(subtotal);
	
	//畫面載入時計算物品總數量
	var amount = 0;
	$('.count').each(function() {
		var c = parseInt($(this).val());
		amount += c;
	});
	$('.amount').text(amount)
	
	//如果沒有商品顯示以下內容
	if( $('.price').size()==0){
		var txt1=$("<tr class=alertMsg><td></td></tr>").text("目前您的購物車是空的").css("color","red");
		var txt2=$("<a href=shop_index.jsp></a>").text("您可以前往我們的商城 ，選購您想要的商品。");
		$('tbody').eq(0).append(txt1,txt2);
		
		$( "#shop_insert_order" ).prop("disabled", true);
	}
}
