<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	response.setCharacterEncoding("utf-8");
	String cropDo = request.getParameter("cropDo");
	String cropSi = request.getParameter("cropSi");
	String cropName = request.getParameter("cropName");
	String preProduction_test_score = request.getParameter("preProduction_test_score");
	String preProduction_amount = request.getParameter("preProduction_amount");
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css" href="mapcss.css">
<title>지도 생성하기</title>

</head>
</head>
<body>

	<!-- 지도가 실제로 그려지는 div-->
	<div id="map" style="width: 100%; height: 900px;"></div>


			
			 
			 
	<!-- 사이드바 그려지는 div-->
	<div id="sideBar" class="sidenav" style='padding-top: 30px;'>
		<div id="flaskDiv">
			<table id="flaskTable" class="sidelist" >
			<thead> <tr> <th> 항목 </th> <th> 내용 </th> </tr> </thead>
			<tbody>
				<tr>
					<th>작물명</th>
					<td id="sideCropName"></td>
				</tr>

				<tr>
					<th>예측생산양</th>
					<td id="sidePreProduction_amount"></td>
				</tr>

				<tr>
					<th>예측정확도</th>
					<td id="sidePreProduction_test_score"></td>
				</tr>
				</tbody>
			</table>
		</div>

		<div>
			<image src='img/background_tea.jpg' id="chart"></image>
		</div>

		<div id="climateDiv"></div>

		</table>
	</div>

	<div style="display: none;">
		<form action="http://127.0.0.1:5000" method="GET">
			<input type="text" id="cropDo" name="cropDo"> <input
				type="text" id="cropSi" name="cropSi"> <input type="text"
				id="cropName" name="cropName"> <input type="button"
				id="flaskSubmit" value="전송">
		</form>
	</div>
	<div></div>


	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=187f81a906ad2f0464d0446073be0004"></script>
	<!-- api 키 입력하는 부분은 head나 body 어디에 있어도 상관없지만, 반드시 실행코드보다 먼저 선언될 것 -->



	<script>
	
	//------------------------------------------------------------------------------------지도 그리기 위한 객체 생성 및 초기화
	var mapContainer = document.getElementById('map');//지도를 표시할 div 지정
	var mapOption = { //지도를 생성할 때 필요한 기본 옵션(이름 바꿔도 됨)
  					center: new kakao.maps.LatLng( 35.1, 126.8), //맨 처음 펼칠 지도의 중심좌표(위도, 경도)
  					level: 11// 지도의 확대 레벨
	};
	var map = new kakao.maps.Map(mapContainer, mapOption); //지도 = 지도를 그릴 객체 + 지도 옵션
	var polygonOverlay = new kakao.maps.CustomOverlay({}); //폴리곤 띄울 커스텀 오버레이
	var clickOverlay = new kakao.maps.CustomOverlay({}); //
	var infowindow = new kakao.maps.InfoWindow({removable: true});
	//------------------------------------------------------------------------------------지도 그리기 위한 객체 생성 및 초기화
	
	
	
	
	
	//------------------------------------------------------------------------------------geoJson 파일 불러오기
	$.getJSON("resources/TL_SCCO_SIG.json", function(geojson){ //경로에 있는 geojson파일을 불러오겠다.
		var data = geojson.features; //geojson 내부의 feature
		var coordinates = [];		 //반복문에서 위도 경도, 즉 좌표 정보를 담을 배열 
		var names = [];
		var name = '';				 //반복문에서 지역 이름을 담을 변수
	
		$.each(data, function(index, value){ //data = jeojson 파일, 반복문으로 데이터 꺼내옴
			coordinates = value.geometry.coordinates; //좌표 전부 담기
			name = value.properties.SIG_KOR_NM;		  //SIG_KOR_NM : 시군구 한국 이름
			names[index] = name;
			//console.log(names[index]);
			displayArea(coordinates, name);			  //아래에서 쓸 함수에 담기
		});
	});
	
	//이제 각 시도별 좌표를 얻었으니까 지도에 그림을 그려야겠죠?
	var polygons=[]; //지도에 그려지는 닫혀있는 꼬부랑 모양, 도시 경계를 따라 그려질 그림
	//polygons < 행정구역 전체 그려지는 지도
	//polygon < 지도 한칸 한칸
	//------------------------------------------------------------------------------------geoJson 파일 불러오기
	
	
	
	
	
	//------------------------------------------------------------------------------------본격적으로 그림 그리는 영역
	function displayArea(coordinates,name){
		var path = [];	//점과 점 사이 패스
		var points = [];//각 점들
	
		$.each(coordinates[0], function(index, coordinate){ //좌표목록에서 하나하나 꺼내서 배열에 담음
			var point = new Object();
				point.x = coordinate[1];
				point.y = coordinate[0];
				points.push(point); //정점 배열엔 정점들만
				path.push(new kakao.maps.LatLng(coordinate[1], coordinate[0])); //패스 배열은 두 좌표 사이 구해서
		});

		var polygon = new kakao.maps.Polygon({ //다각형 그리는 변수
			map : map,					//그림 그릴 지도
			path : path,				//그려질 다각형의 좌표배열
			strokeWeight : 2,			//선 두께
			strokeColor : '#0100FF',	//선 색깔
			strokeOpacity : 0.3,		//선 불투명도
			fillColor : '#00ff0000',	//투명채우기 색
			fillOpacity : 0.7			//채우기 불투명도
		});
		polygons.push(polygon); //다각형 배열엔 다각형들만
		
		//마우스 오버되면 폴리곤이 변화할 내용 적어주기
		var mouseOverOption = {
   			fillColor: '#B2CCFF', // 채우기 색깔입니다 
   			fillOpacity: 0.7 // 채우기 불투명도 입니다        
		};
		
		//마우스 아웃되면 폴리곤이 변화할 내용 적어주기
		var mouseOutOption = {
			fillColor : '#00ff0000', // 투명 채우기 색깔입니다 
	   		fillOpacity: 0.7 // 채우기 불투명도 입니다        
		};
		
		//폴리곤에 마우스오버 이벤트 등록하기
		kakao.maps.event.addListener(polygon, 'mouseover', function(mouseEvent){
			polygon.setOptions(mouseOverOption);
			polygonOverlay.setContent('<div class="area">' + name + '</div>'); 
			polygonOverlay.setPosition(mouseEvent.latLng);
			polygonOverlay.setMap(map);
		});
		
		//폴리곤에 마우스아웃 이벤트 등록하기
		kakao.maps.event.addListener(polygon, 'mouseout', function() {
			polygon.setOptions(mouseOutOption);
			polygonOverlay.setMap(map);
   		});
		
		//폴리곤에 마우스무브 이벤트 등록하기
		kakao.maps.event.addListener(polygon, 'mousemove', function(mouseEvent) {
			polygonOverlay.setPosition(mouseEvent.latLng); 
		});
	
		kakao.maps.event.addListener(polygon, 'click', function(mouseEvent) {
			//클릭하면 지도 레벨이 2단계 줄어듬(지역이 더 가까워짐)
			var level = map.getLevel()-1;
			map.setLevel(level, {anchor: centroid(points), animate: {duration: 350 }});
			//deletePolygon(polygons); //폴리곤 그렸던 거 전체 지움
			
			var content = "";
			content='<div class="wrap">' + 
            '    <div class="info">' + 
            '        <div class="title">' + name +
            '            <div class="close" onclick="closeOverlay()" title="닫기"></div>' + 
            '        </div>' + 
            '        <div class="body" style="display:flex; align-items:center; justify-content: center; margin-top : 6px">' + 
            '			<table style="border-spacing:20px; text-ailgn:center;"> <tr>'+
            '			<td> <image class=\'c_icon\' src = \'img/논벼.png\'></td>'+
            '			<td> <image class=\'c_icon\' src = \'img/포도.png\'></td>'+
            '			<td> <image class=\'c_icon\' src = \'img/양파.png\'></td>'+
            '			<td> <image class=\'c_icon\' src = \'img/양배추.png\'></td>'+
            '			<td> <image class=\'c_icon\' src = \'img/대파.png\'></td></tr>'+
            '        	<tr> <td> <button type="button" class="td_inner_btn" name="논벼" value="논벼" onclick="clickCrop(this.value)"/>논벼</button> </td>'+
            '        	<td> <button type="button" class="td_inner_btn" name="포도" value="포도" onclick="clickCrop(this.value)"/>포도</button> </td>'+
            '        	<td> <button type="button" class="td_inner_btn" name="양파" value="양파" onclick="clickCrop(this.value)"/>양파</button> </td>'+
            '        	<td> <button type="button" class="td_inner_btn" name="양배추" value="양배추" onclick="clickCrop(this.value)"/>양배추</button> </td>'+
            '        	<td> <button type="button" class="td_inner_btn" name="대파" value="대파" onclick="clickCrop(this.value)"/>대파</button> </td>'+
            '			</tr> </table>'+
            '</div>';
     				
			clickOverlay.setContent(content); 
			clickOverlay.setPosition(mouseEvent.latLng);
			clickOverlay.setMap(map);
			
			document.getElementById('cropDo').setAttribute("value","전라남도");
			document.getElementById('cropSi').setAttribute("value", name);
			
		});
	}
	function closeOverlay() {
		clickOverlay.setMap(null);   
		document.getElementById('cropDo').setAttribute("value","");
		document.getElementById('cropSi').setAttribute("value","");
		document.getElementById('cropName').setAttribute("value","");
		closeNav();
	}
	//------------------------------------------------------------------------------------본격적으로 그림 그리는 영역
	
	
	function clickCrop(c_name){
			c_name = c_name.split(" ")[0];
			document.getElementById('cropName').setAttribute("value",c_name);
			$("#flaskSubmit").trigger("click");
		
	}
	
	
	$("#flaskSubmit").click(function(){
		var cropSi = $('#cropSi').val();
		var cropName = $('#cropName').val();
		var postdata = {'cropDo': '전라남도' ,'cropSi': cropSi,'cropName':cropName };
			
		$.ajax({
			url : 'http://127.0.0.1:5000',
			type : 'GET',
			data : postdata,
			dataType : 'json',
			success : sideBarList,
			error : function(){alert("error");}
			});

		openNav();
		
	});
	
	function sideBarList(data){
		var cropDo = data.cropDo.toString();
		var cropSi = data.cropSi.toString();
		var cropName = data.cropName.toString();
		var preProduction_test_score = data.preProduction_test_score.toString();
		var preProduction_amount = data.preProduction_amount.toString();
		
		$("#sideCropDo").html(cropDo);
		$("#sideCropSi").html(cropSi);
		$("#sideCropName").html(cropName);
		$("#sidePreProduction_test_score").html(preProduction_test_score);
		$("#sidePreProduction_amount").html(preProduction_amount);
		
		cropClimateList(cropName, cropSi);
	};
	

	 function cropClimateList(c_name, c_city){
		$.ajax({
			url : "cropClimateList.do",
			type : "get",
			data : {'c_city': c_city,'c_name' : c_name},
			dataType : "json",
			success : cropClimateCall,
			error : function(){alert("error");}
		});
	 }
	 
	 function cropClimateCall(data){
	
		 var view="";
		 $.each(data, (index,obj) =>{
			 view += "<table id='climateTable' class=\"sidelist\">";
			 view += "<thead> <tr> <th> 항목 </th> <th> 내용 </th> </tr> </thead>"
		 	 view += "<tr scope=\"row\"><th>평균 기온</td>";
			 view += "<td id ="+obj.a_tem+">"+obj.a_tem+"</td></tr>";
			 view += "<tr scope=\"row\"><th>평균 최고기온 </td>";
			 view += "<td id ="+obj.ah_tem+">"+obj.ah_tem+"</td></tr>";
			 view += "<tr scope=\"row\"><th>평균 최저기온 </td>";
			 view += "<td id ="+obj.al_tem+">"+obj.al_tem+"</td></tr>";
			 view += "<tr scope=\"row\"><th>평균 강수량 </td>";
			 view += "<td id ="+obj.precipitation+">"+obj.precipitation+"</td></tr>";
			 view += "<tr scope=\"row\"><th>습도</td>";
			 view += "<td id ="+obj.a_humidity+">"+obj.a_humidity+"</td></tr>";
			 view += "<tr scope=\"row\"><th>일조량</td>";
			 view += "<td id ="+obj.insolation+">"+obj.insolation+"</td></tr>";
			 view += "<tr scope=\"row\"><th>평균 풍속</td>";
			 view += "<td id ="+obj.a_wind_spd+">"+obj.a_wind_spd+"</td></tr>";
			 view += "<tr scope=\"row\"><th>최대  풍속</td>";
			 view += "<td id ="+obj.h_wind_spd+">"+obj.h_wind_spd+"</td></tr>";
			 view += "</table>";
		 });
		$("#climateDiv").html(view);
	
		 
		 
	 }
	 
	
	function openNav() {
		document.getElementById("sideBar").style.width = "700px";
		}
	
	function closeNav(){
		document.getElementById("sideBar").style.width = "0px";
	}
	
	
	
	
	
	//------------------------------------------------------------------------------------클릭된 지도 중앙 부분 좌표 구하기
	//나도 몰라서 주석 못 달아용~ 퍼왔어요~
	function centroid( points ){
		var i , j , len, p1, p2, f, area, x, y;
		area = x= y= 0;
		for (i = 0, len= points.length, j=len-1 ; i < len; j=i++) {
			p1 = points[i];
			p2 = points[j];
			
			f = p1.y * p2.x - p2.y * p1.x;
			x += (p1.x + p2.x) * f;
			y += (p1.y + p2.y) * f;
			area += f*3;
		}
		return new kakao.maps.LatLng((x/area),(y/area));
	}
	//------------------------------------------------------------------------------------클릭된 지도 중앙 부분 좌표 구하기
	
	
	
	//------------------------------------------------------------------------------------전체 지도 싹 지우는 것
	//나도 몰라서 주석 못 달아용~ 퍼왔어요~
	function deletePolygon(polygons){
		for (var i = 0; i < polygons.length; i++) {
			polygons[i].setMap(null);
		}
		polygons=[];		
	}
	//------------------------------------------------------------------------------------전체 지도 싹 지우는 것
	
</script>
</body>
</html>