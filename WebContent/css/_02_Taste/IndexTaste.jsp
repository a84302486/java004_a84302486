<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	<div>
	<table id="navBar">
		<tr class="abgne_tab">
			<td>
				<ul class="tabs">
					<li><a href="#taste1">資料表 </a></li>
					<li><a href="#taste2">資料表 </a></li>
				</ul>
			</td>

			<td id="toolBar">
				<button class="select"
					onclick="getAction('../_02_Taste/SelectTaste.jsp','showDAOJsp');"></button>
				<button class="insert"
					onclick="getAction('../_02_Taste/InsertTaste.jsp','showDAOJsp');"></button>
				<button class="delete"></button>
<!-- 					onclick="setDeleteData();" -->
				<button class="update"
					onclick="getAction('../_02_Taste/UpdateTaste.jsp','showDAOJsp');"></button>
				<button class="export" onclick=""></button>
				<button class="import"
					onclick="getAction('../_02_Taste/ImportTaste.jsp','showDAOJsp');"></button>
				<button class="printer" onclick=""></button>
			<td>
		</tr>
	</table>
	<div class="tab_container">
		<div id="taste1" class="tab_content">
			<section class="container-fuild" id='showDAOJsp'>
				<h4>請選擇功能</h4>
			</section>
			<section class="container-fuild" id='showResult'></section>
		</div>
		<div id="taste2" class="tab_content">
		測試文字		
		</div>
	</div>
</div>
