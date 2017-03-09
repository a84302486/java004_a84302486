<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link href="https://fonts.googleapis.com/css?family=Montserrat" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet" type="text/css">
	<link rel="stylesheet" href="css/bootstrap.min.css">
	<link rel="stylesheet" href="css/cartEdit.css">
	<title>registered</title>
</head>
<body>
 <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="shop_index.html">購物平台</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse " id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">麵類<span class="caret"></span></a>
                         <ul class="dropdown-menu" role="menu">
                            <li><a href="#">牛肉類</a></li>
                            <li class="divider"></li>
                            <li><a href="#">豬肉類</a></li>
                            <li class="divider"></li>
                            <li><a href="#">雞肉類</a></li>
                          </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">飯類<span class="caret"></a>
                         <ul class="dropdown-menu" role="menu">
                            <li><a href="#">牛肉類</a></li>
                            <li class="divider"></li>
                            <li><a href="#">豬肉類</a></li>
                            <li class="divider"></li>
                            <li><a href="#">雞肉類</a></li>
                          </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#"class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">零嘴類<span class="caret"></a>
                        <ul class="dropdown-menu" role="menu">
                            <li><a href="#">牛肉類</a></li>
                            <li class="divider"></li>
                            <li><a href="#">豬肉類</a></li>
                            <li class="divider"></li>
                            <li><a href="#">雞肉類</a></li>
                          </ul>
                    </li>
                </ul>
                <ul class="nav navbar-nav navbar-right">
                    <li>
                        <a href="#">會員管理</a>
                    </li>
                    <li>
                        <a href="register.html">註冊</a>
                    </li>
                    <li>
                        <a href="login.html">登入</a>
                    </li>
                    <li>
                        <a href="cartEdit.html">購物車</a>
                    </li>
					<li>
                        <a href="index.html">觀光工廠</a>
                    </li>
                 </ul>   
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>
	
	  <br>
	  <br>
	  <div class="container">
	  <h2 id="header">購物車</h2>           
	  <table class="table">
		<thead>
		  <tr>
			<th>商品描述</th>
			<th> </th>
			<th>單價</th>
			<th>數量</th>
			<th>小計</th>
			<th>刪除</th>
		  </tr>
		</thead>
		<tbody>
		  <tr>
			<td colspan="2">
			<div class="media">
                <a class="thumbnail pull-left" href="#"> 
					<img class="media-object" src="images/beaf.jpg">
				</a>
                <div class="media-body">
                    <h4 class="media-heading"><a href="#" class="name">牛小排</a></h4>
                    <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                </div>
            </div>
			</td>
			<td class="price">333</td>
			<td>
				<button class="minus" onclick="changeAmount($(this));">－</button> 
				<input class="count" value="1" type="text" size="1" >
				<button class="plus"  onclick="changeAmount($(this));">＋</button>
			</td>
			<td class="total"></td>
			<td class="col-md-1">
                <button type="button" class="btn btn-danger" id="delete" onclick="setDel($(this));">
                    <span class="glyphicon glyphicon-remove"></span> Remove
                </button>
			</td>
		  </tr>
		  <tr>
			<td colspan="2">
			<div class="media">
                <a class="thumbnail pull-left" href="#"> 
					<img class="media-object" src="images/food.jpg">
				</a>
                <div class="media-body">
                    <h4 class="media-heading"><a href="#" class="name">豬肉</a></h4>
                    <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                </div>
            </div>
			</td>
			<td class="price">222</td>
			<td>
				<button class="minus" onclick="changeAmount($(this));">－</button> 
				<input class="count" value="1" type="text" size="1" >
				<button class="plus"  onclick="changeAmount($(this));">＋</button>
			</td>
			<td class="total"></td>
			<td class="col-md-1">
                <button type="button" class="btn btn-danger" id="delete" onclick="setDel($(this));">
                    <span class="glyphicon glyphicon-remove"></span> Remove
                </button>
			</td>
		  </tr>
		  <tr>
			<td colspan="2">
			<div class="media">
                <a class="thumbnail pull-left" href="#"> 
					<img class="media-object" src="images/chicken.jpg">
				</a>
                <div class="media-body">
                    <h4 class="media-heading"><a href="#" class="name">去骨雞腿</a></h4>
                    <h5 class="media-heading"> by <a href="#">Brand name</a></h5>
                    <span>Status: </span><span class="text-success"><strong>In Stock</strong></span>
                </div>
            </div>
			</td>
			<td class="price">256</td>
			<td>
				<button class="minus" onclick="changeAmount($(this));">－</button> 
				<input class="count" value="1" type="text" size="1" >
				<button class="plus"  onclick="changeAmount($(this));">＋</button>
			</td>
			<td class="total"></td>
	
			<td class="col-md-1">
                <button type="button" class="btn btn-danger" id="delete" onclick="setDel($(this));">
                    <span class="glyphicon glyphicon-remove"></span> Remove
                </button>
			</td>
			
<<<<<<< HEAD
		</tbody>
=======
		  </tr>
		  
		</tbody>
		<hr>
		<footer>
			
>>>>>>> 0bdbfa299c22b5c4c71a35dea05bbf2c00039be1
		  <tr class="footer">
				<td colspan="5" style="text-align:right;">商品數量 :</td>
				<td style="text-align:right;" class="amount"></td>
				<td>件</td>
		  </tr>
		  <tr class="footer">
				<td colspan="5" style="text-align:right;">商品金額 :</td>
				<td style="text-align:right;" class="subtotal"></td>
				<td>元</td>
		  </tr>
		  <tr class="footer">
				<td colspan="5" style="text-align:right;">運費小計 :</td>
				<td style="text-align:right;" class="shipment">0</td>
				<td>元</td>
		  </tr>
		  <tr class="footer">
				<td colspan="5" style="text-align:right;">購物總計 :</td>
				<td style="text-align:right;" class="subtotal"></td>
				<td>元</td>
		  </tr>
		  <tr class="footer">
<<<<<<< HEAD
				<td colspan="6" style="text-align:right;" id="billing">
					<button type="button">確認結帳</button>
				</td>
		  </tr>
		  
=======
                        <td colspan="4"></td>
           
                        <td colspan="3" style="text-align:center;">
                        <button type="button" class="btn btn-default">
                            <span class="glyphicon glyphicon-shopping-cart"></span> 繼續購物
                        </button>
						&nbsp;
                        <button type="button" class="btn btn-success">
                            確定結帳 <span class="glyphicon glyphicon-play"></span>
                        </button></td>
                    </tr>
		  
		<footer>
>>>>>>> 0bdbfa299c22b5c4c71a35dea05bbf2c00039be1
	  </table>  
	</div>
		
<script src="jQuery/jquery-2.2.4.min.js" type="text/JavaScript"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/cartEdit.js"></script>
	
</body>
</html>