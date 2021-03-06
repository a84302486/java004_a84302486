
//點擊Tab時切換畫面至被點擊的頁籤-----------------------------
$(document).on("click",".drop-down-menu", function() {	

	$("#navBar").ready(function(){
	var _showTab = 0;
	$(this).each(function() {
		// 目前的頁籤區塊
		var $tab = $(this);
		var $defaultLi = $('ul.tabs li', $tab).eq(_showTab).addClass('active');
		$($defaultLi.find('a').attr('href')).siblings().hide();
		// 當 li 頁籤被點擊時...
		// 若要改成滑鼠移到 li 頁籤就切換時, 把 click 改成 mouseover
		$('ul.tabs li', $tab).click(function() {
			// 找出 li 中的超連結 href(#id)
			var $this = $(this), _clickTab = $this.find('a').attr('href');
			// 把目前點擊到的 li 頁籤加上 .active, 並把兄弟元素中有 .active 的都移除 class
			$this.addClass('active').siblings('.active').removeClass('active');
			// 淡入相對應的內容並隱藏兄弟元素
			$(_clickTab).stop(false, true).fadeIn().siblings().hide();
			return false;
		}).find('a').focus(function() {
			this.blur();
			});
		});
	});	
});

//Insert:新增該Form文字與圖片資料,並由Servelet回傳是否成功的json字串,再顯示至畫面-----
$("#loadPageDiv").on("click", "#upLoadPic", function() {
	$('#form1').ajaxForm({
		type : 'POST',
		dataType : 'json',
		cache : false ,
		resetForm: true,
		success : function(responseText) {
			$('#insertResult').text(responseText);
			getQueryData("ALL","productId","");
		},
		error : function(responseText) {
			alert("發生錯誤,請連絡管理人員");
		},		
	});
});


// Insert:新增該筆資料,並由Servelet回傳是否成功的json字串,再顯示至畫面----------------

// function getInsertData(servelet) {
// var xhr = new XMLHttpRequest();
// xhr.open("POST", servelet, true);
// xhr.setRequestHeader("Content-type", "multipart/form-data");
//											
// xhr.send(setQueryString());
// xhr.onreadystatechange = function() {
// if (xhr.readyState == 4 && xhr.status == 200) {
// var data = JSON.parse(xhr.responseText);
// var result = document.getElementById("insertResult");
// result.innerHTML = data;
// getQueryData('SelectProduct.do');
// }
// }
// }

// Insert跟Update時使用的方法,會取出Form內每個name的value值----------------
function setQueryString() {
	queryString = "";
	var frm = document.forms[0];
	var numberElements = frm.elements.length;
	for (var i = 0; i < numberElements; i++) {
		if (i < numberElements - 1) {
			// alert(frm.elements[i].name);
			// alert(frm.elements[i].value);
			queryString += frm.elements[i].name + "="
					+ encodeURIComponent(frm.elements[i].value) + "&";
		} else {
			queryString += frm.elements[i].name + "="
					+ encodeURIComponent(frm.elements[i].value);
		}
	}
	return queryString;
}

// 載入頁面替換Section內容----------------------------------------------
function getAction(action, tagId) {
	var showResult = document.getElementById(tagId);
	var xhr = new XMLHttpRequest(); // 步驟一: 新建XMLHttpRequest物件
	if (xhr != null) { // 步驟二: 經由AJAX提出HTTP請求
		xhr.onreadystatechange = function() {
			if (xhr.readyState == 4 && xhr.status == 200) { // 步驟三: 處理伺服器送回的回應資料
				showResult.innerHTML = xhr.responseText;
			}
		}
		xhr.open("POST", action, false);
		xhr.send();

	} else {
		showResult.innerHTML = "<h1>您的瀏覽器不支援Ajax</h1>";
	}
}

// Select讀取透過Servelet取出的Json資料,替換Section內容------------------------------
$("#loadPageDiv").on("click", "input[type='button']", function() {
	
	var cmd =null, type = null, val= null;
	var $this = $(this).attr("id");

	if($this == "productIdBtn" ){
		cmd = "ALL";
		type = "productId";
		val = $("input[name='productId']").val();
	}else if($this == "productNameBtn"){
		cmd = "Name";
		type = "productName";
		val = $("input[name='productName']").val();
	}
//	else{
//		cmd = "ALL";
//		type = "productId";
//		val = "";
//	}
	getQueryData(cmd,type,val);	
});

function getQueryData(cmd,type,val) {
	
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "SelectProduct.do", true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send("cmd=" + cmd + "&" + type + "=" + val);

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {

			var content = "<table>" + "<tr><td>上/下架</td>" + "<td>序號</td>"
					+ "<td>定價</td>" + "<td>名稱</td>" 
					+ "<td>成本</td>"
					+ "<td>生產地</td>" + "<td>保存期</td>" + "<td>類別</td>"
					+ "<td>圖檔名</td>" + "<td>圖片</td>" + "<td>選取</td></tr>";
			
			var data = JSON.parse(xhr.responseText);
			for (var i = 0; i < data.length; i++) {
				
				var checkStatus = null;
				var showChecked = null;
				var onShelfClass = null;
				if(data[i].status == false){
					checkStatus = "已下架";
					showChecked = "";
					onShelfClass = "";
				}else{
					checkStatus = "上架中";
					showChecked = " checked"
					onShelfClass = " on-shelf";
				}
					
			   content += "<tr>"
						+ "<td><span class=" + onShelfClass + ">" + checkStatus + "</span> "
						+ "<input type=checkbox name=productId value=" 
						+ data[i].productId + showChecked +"></td>" 
						+ "<td>" + data[i].productId + "</td>" 
						+ "<td>" + data[i].pgPrice + "</td>" 
						+ "<td>" + data[i].name + "</td>" 
						+ "<td>" + data[i].avgCost + "</td>" 
						+ "<td>" + data[i].oplace + "</td>" 
						+ "<td>" + data[i].slife + "</td>"
						+ "<td>" + data[i].suppierId + "</td>"
						+ "<td>" + data[i].fileName + "</td>"
						+ "<td> <img height=60 width=60 id=target " 
						+ "src=http://localhost:8080/java004/_01_Product/getImage?id=" 
						+ data[i].productId +  "></td>"
						+ "<td><input type=radio name=productId value="+ data[i].productId + ">"
						+ "</td></tr>";
			}
			content += "</table>";
			var result = document.getElementById("showResult");
			result.innerHTML = content;
		}
	}
}

// Delete:判斷讀取到的name並取出值,判斷是否刪除該筆資料,並由Servelet回傳是否成功的json字串,再顯示至畫面--------
$("#loadPageDiv").on("click",'#deleteProduct',function() {
			
			var $this = $('input:radio:checked').attr('name');						
			var selected = $("input:radio[name=" + $this + "]:checked").val();
			
			if (selected != null) { // 如果有被選取,不是空值
				if (confirm("確定要刪除" + selected + "嗎?")) {
					var xhr = new XMLHttpRequest();
					xhr.open("POST", "DeleteProduct.do" , true);// send要傳參數一定要用POST
					xhr.setRequestHeader("Content-type",
							"application/x-www-form-urlencoded");
					xhr.send($this + "=" + selected);
					xhr.onreadystatechange = function() {
						if (xhr.readyState == 4 && xhr.status == 200) {
							var data = JSON.parse(xhr.responseText);
							var result = document.getElementById("showDAOJsp");
							result.innerHTML = "<h3>" + data + "<h3>";
							getQueryData("ALL","productId","");
						}
					}		
				}	
			} else {
				alert("請選勾選要刪除的資料");
			}
		});

// Update:取出被點選的radio內的值,並傳到updata畫面內對應的input:value內
function getData() {
	var getName = $('input:radio:checked').attr('name');
	var selected = $("input:radio[name=" + getName + "]:checked").val();

	if (selected != null) { // 如果有被選取,不是空值		
		if (confirm("確定要選取" + selected + "嗎?")) {
			var TextArray = new Array();
			for (i = 0; i < $('.highlight > td').length; i++) {
				TextArray[i] = $(".highlight > td:eq(" + (i + 1) + ")").text();
			}
			for (i = 0; i <= $('#updateTable :input').length; i++) {
				$("#updateTable input:eq(" + i + ")").val(TextArray[i]);
			}
		}
	} else {
		alert("請選勾選要更新的資料");
	}
}

function getUpdateData(servelet) {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", servelet, true);
	xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	xhr.send(setQueryString());

	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var data = JSON.parse(xhr.responseText);
			var result = document.getElementById("updateResult");
			result.innerHTML = data;
			getQueryData("ALL","productId","");
		}
	}
}

// 被點選的Radio改變背景顏色-------------------------
$("#loadPageDiv").on("change",'input:radio',function() {
	if ($(this).is(':checked')) {// 判斷radio是否勾選
		$(this).parent().parent().addClass('highlight').siblings()
		.removeClass('highlight');// 被點擊的增加CSS樣式並移除其他radio的CSS樣式
		}
	});

// 被點選的Radio改變背景顏色-------------------------
$("#loadPageDiv").on("change",'input:checkbox',function() {
	var $this = $(this);
	var productId = $this.val();

	if ($(this).is(':checked')) {   // 判斷checkbox是否勾選
		$.ajax({
    		type: "POST",
    		url: "OnShelfControl.do",
    		data: "productId="+productId+"&onShelf=true",
		});
		$(this).prev().html("上架中");
		$(this).prev().addClass('on-shelf');
	}else{
		$.ajax({
    		type: "POST",
    		url: "OnShelfControl.do",
    		data: "productId="+productId+"&onShelf=false",
		});
		$(this).prev().html("已下架");
		$(this).prev().removeClass('on-shelf');
	}
});


