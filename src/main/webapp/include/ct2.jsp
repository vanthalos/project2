<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script>
//대분류
$("#proudctCategoryList1").on({
	click : function(){
		var thisidName = "proudctCategoryList";
		var idName = "proudctCategoryProductListGoods";
		var id = [];
		var thisId = [];
		var list = ["tvMedia","daily","computer","free","camera"]
		
		for(var i=0; i<=8; i++){
			id[i] = idName + (i+1);
			thisId[i] = thisidName + (i+1); 
		}
		
		if($("#proudctCategoryList1").hasClass("tvMedia") === true) {
			var t = ["TV","미니빔/사운드바/블루레이","장식장/TV액세서리","디지털액자","","","",""];
			var a = ["TV","miniSoundbarBlue","tvAccessory","digitalFrame","","","",""];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("10")
		}else if($("#proudctCategoryList1").hasClass("living") === true) {
			var t = ["전기밥솥","식기세척기/살균건조기","전자레인지/오븐","가스/전기레인지/후드","믹서/쥬서/원액기","커피머신","전기포트","토스터기","전기그릴/팬","식품조리기","정수기"];
			var a = ["riceCooker","dishwasherSterilizer","microwaveOven","gasElectricrangeHood","mixerJuicerDilutedLiquidMachine","coffeeMachine","electricPot","toaster","grillsPan","foodCooker","WaterPurifier"];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("10")
		}else if($("#proudctCategoryList1").hasClass("computer") === true) {
			var t = ["노트북","데스크탑","모니터","태블릿PC","프린터","타블렛","Apple","전시/리퍼 컴퓨터","","",""];
			var a = ["notebook","destTop","monitor","tabletPc","printer","tablet","Apple","exhibitionReaper","","",""];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("10")
			
		}else if($("#proudctCategoryList1").hasClass("free") === true) {
			var t = ["자급제(언락)","SKT","KT","LGU+","리퍼폰","","","","","",""];
			var a = ["unlock","freeSKT","freeKT","freeLGU","reaperPhone","","","","","",""];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("10")
			
		}else if($("#proudctCategoryList1").hasClass("camera") === true) {
			var t = ["DLSR","미러리스","디지털카메라","액션캠/캠코더","렌즈","즉석카메라/포토프린터","웹캠/IP카메라/CCTV","사진앨범/출력","배경지/소품","조명","삼각대"];
			var a = ["DLSR","mirrorLess","digitalCamera","actionCamCoder","lens","InstantCameraPhotoPrinter","WebcamIPcameraCCTV","PhotoAlbumOutput","BackgroundPaperProps","Lighting","Tripod"];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("10")
		}
		else {
			alert("실패");
		}
	}
});

$("#proudctCategoryList2").on({
	click : function(){
		var thisidName = "proudctCategoryList";
		var idName = "proudctCategoryProductListGoods";
		var id = [];
		var thisId = [];
		var list = ["tvMedia","daily","computer","free","camera"]
		
		for(var i=0; i<=8; i++){
			id[i] = idName + (i+1);
			thisId[i] = thisidName + (i+1); 
		}
		
		if($("#proudctCategoryList2").hasClass("refrigerator") === true) {
			var t = ["양문형냉장고","일반냉장고","냉동고","세미빌트인","업소용냉장고","와인셀러","미니/차량용냉장고","냉장고 악세사리"];
			var a = ["doubleRefrigerator","regulerRefrigerator","freezer","semiBuiltInRefrigerator","commercialRefrigerator","wineSeller","miniCarRefrigerator","refrigeratorAcc"];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("20")
		}else if($("#proudctCategoryList2").hasClass("life") === true) {
			var t = ["청소기","다리미/보풀제거기","전해수기","스텐드/조명/전구","미싱","전화기","전자담배",""];
			var a = ["cleaner","ironingFluffingRemover","electrolyticWaterMachine","STANDLIGHTBULB","sewingMachine","telephone ","ElectronicCigarette",""];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("20")
		}else if($("#proudctCategoryList2").hasClass("pcAccessory") === true) {
			var t = ["키보드","마우스","스피커","저장장치","공유기/랜카드","케이블/젠더","노트북/태블릿 주변기기","받침대"];
			var a = ["keyboard","mouse","speaker","repository","routerlanCard","cableGender ","LaptopTabletPeripherals","prop"];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("20")
		}else if($("#proudctCategoryList2").hasClass("SKT") === true) {
			var t = ["삼성전자","Apple","LG전자","기타","","","",""];
			var a = ["SKTSamsung","SKTApple","SKTLg","SKTEtc",""," ","",""];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("20")
		}else if($("#proudctCategoryList2").hasClass("game") === true) {
			var t = ["Xbox콘솔","Xbox주변기기","Xbox PC 게임","Xbox 콘솔 게임","Xbox 구독 코드 상품","플레이스테이션 본체","플레이스테이션 주변기기","플레이스테이션 타이틀"];
			var a = ["XboxConsole","XboxPeripheral","XboxPcGame","XboxConsoleGame","XboxSubscribe","PlayStationBody","PlayStationPeripheral","PlayStationTitle"];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
				$("#"+thisId[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category2").val("20")
		}
		else {
			alert("실패");
		}
	}
});


$("#proudctCategoryList3").on({
	click : function(){
		if($("#proudctCategoryList3").hasClass("refrigeratorKimchi") === true) {
			$("#proudctCategoryProductListGoods1").text("TV");
			$("#proudctCategoryProductListGoods1").attr("class","TV");
			$("#proudctCategoryProductListGoods2").text("미니빔/사운드바/블루레이");
			$("#proudctCategoryProductListGoods3").text("장식장/TV액세서리");
			$("#proudctCategoryProductListGoods4").text("디지털액자");
			
			$(this).css("background-color","orange");
			$("#proudctCategoryList1").css("background-color","white");
			$("#proudctCategoryList2").css("background-color","white");
			$("#proudctCategoryList4").css("background-color","white");
			$("#proudctCategoryList5").css("background-color","white");
			$("#proudctCategoryList6").css("background-color","white");
			$("#proudctCategoryList7").css("background-color","white");
			$("#proudctCategoryList8").css("background-color","white");
			$("#category2").val("30")
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryList4").on({
	click : function(){
		if($("#proudctCategoryList4").hasClass("washer") === true) {
			$("#proudctCategoryProductListGoods1").text("TV");
			$("#proudctCategoryProductListGoods1").attr("class","TV");
			$("#proudctCategoryProductListGoods2").text("미니빔/사운드바/블루레이");
			$("#proudctCategoryProductListGoods3").text("장식장/TV액세서리");
			$("#proudctCategoryProductListGoods4").text("디지털액자");

			$(this).css("background-color","orange");
			$("#proudctCategoryList1").css("background-color","white");
			$("#proudctCategoryList2").css("background-color","white");
			$("#proudctCategoryList3").css("background-color","white");
			$("#proudctCategoryList5").css("background-color","white");
			$("#proudctCategoryList6").css("background-color","white");
			$("#proudctCategoryList7").css("background-color","white");
			$("#proudctCategoryList8").css("background-color","white");
			
			$("#category2").val("40")
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryList5").on({
	click : function(){
		if($("#proudctCategoryList5").hasClass("clothesDryer") === true) {
			$("#proudctCategoryProductListGoods1").text("TV");
			$("#proudctCategoryProductListGoods1").attr("class","TV");
			$("#proudctCategoryProductListGoods2").text("미니빔/사운드바/블루레이");
			$("#proudctCategoryProductListGoods3").text("장식장/TV액세서리");
			$("#proudctCategoryProductListGoods4").text("디지털액자");

			$(this).css("background-color","orange");
			$("#proudctCategoryList1").css("background-color","white");
			$("#proudctCategoryList2").css("background-color","white");
			$("#proudctCategoryList3").css("background-color","white");
			$("#proudctCategoryList4").css("background-color","white");
			$("#proudctCategoryList6").css("background-color","white");
			$("#proudctCategoryList7").css("background-color","white");
			$("#proudctCategoryList8").css("background-color","white");
			
			$("#category2").val("50")
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryList6").on({
	click : function(){
		if($("#proudctCategoryList6").hasClass("clothesManager") === true) {
			$("#proudctCategoryProductListGoods1").text("TV");
			$("#proudctCategoryProductListGoods1").attr("class","TV");
			$("#proudctCategoryProductListGoods2").text("미니빔/사운드바/블루레이");
			$("#proudctCategoryProductListGoods3").text("장식장/TV액세서리");
			$("#proudctCategoryProductListGoods4").text("디지털액자");
			
			$(this).css("background-color","orange");
			$("#proudctCategoryList1").css("background-color","white");
			$("#proudctCategoryList2").css("background-color","white");
			$("#proudctCategoryList3").css("background-color","white");
			$("#proudctCategoryList4").css("background-color","white");
			$("#proudctCategoryList5").css("background-color","white");
			$("#proudctCategoryList7").css("background-color","white");
			$("#proudctCategoryList8").css("background-color","white");
			
			$("#category2").val("60")
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryList7").on({
	click : function(){
		if($("#proudctCategoryList7").hasClass("washerDryer") === true) {
			$("#proudctCategoryProductListGoods1").text("TV");
			$("#proudctCategoryProductListGoods1").attr("class","TV");
			$("#proudctCategoryProductListGoods2").text("미니빔/사운드바/블루레이");
			$("#proudctCategoryProductListGoods3").text("장식장/TV액세서리");
			$("#proudctCategoryProductListGoods4").text("디지털액자");
			
			$(this).css("background-color","orange");
			$("#proudctCategoryList1").css("background-color","white");
			$("#proudctCategoryList2").css("background-color","white");
			$("#proudctCategoryList3").css("background-color","white");
			$("#proudctCategoryList4").css("background-color","white");
			$("#proudctCategoryList5").css("background-color","white");
			$("#proudctCategoryList6").css("background-color","white");
			$("#proudctCategoryList8").css("background-color","white");
			
			$("#category2").val("70")
		}else {
			alert("실패");
		}
	}
});




</script>