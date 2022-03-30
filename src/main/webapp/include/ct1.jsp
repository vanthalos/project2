<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <script>
//카테고리

$("#essentialAppliance").on({
	
	mouseover: function(){
		
		if($("#linvingLifeHelathAppliance").hasClass("cheked") === true){
			
		}else if($("#computer").hasClass("cheked") === true){
			
		}else if($("#phoneSmartwatch").hasClass("cheked") === true){
			
		}else if($("#digital").hasClass("cheked") === true){
			
		}else{
			var idName = "proudctCategoryList";
			var id = [];
			var t = ["TV/영상가전","냉장고","김치냉장고","세탁기","의류건조기","의류관리기","세탁기/건조기"];
			var a = ["tvMedia","refrigerator","refrigeratorKimchi","washer","clothesDryer","clothesManager","washerDryer"];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
			}
		}
	},
	mouseleave: function(){
		
	},
	click : function(){
		
		$(this).off('mouseleave');
		$(this).on('mouseover');
		$(this).attr("class","cheked");
		
		// 클릭시 다른 영역 클래스 cheked 삭제
		$("#linvingLifeHelathAppliance").attr("class","");
		$("#computer").attr("class","");
		$("#phoneSmartwatch").attr("class","");
		$("#digital").attr("class","");
		
		$("#category1").val("10");
		
		var idName = "proudctCategoryList";
		var id = [];
		var t = ["TV/영상가전","냉장고","김치냉장고","세탁기","의류건조기","의류관리기","세탁기/건조기"];
		var a = ["tvMedia","refrigerator","refrigeratorKimchi","washer","clothesDryer","clothesManager","washerDryer"];
		
		for(var i=0; i<=8; i++){
			id[i] = idName + (i+1);
			$("#"+id[i]).text(t[i]);
			$("#"+id[i]).attr("class",a[i]);
		}
		
		
	}
});

$("#linvingLifeHelathAppliance").on({
	
	mouseover: function(){
		
		if($("#essentialAppliance").hasClass("cheked") === true){
			
		}else if($("#computer").hasClass("cheked") === true){
			
		}else if($("#phoneSmartwatch").hasClass("cheked") === true){
			
		}else if($("#digital").hasClass("cheked") === true){
			
		}else{
			var idName = "proudctCategoryList";
			var id = [];
			var t = ["주방가전","생활가전","이미용가전","건강가전","","",""];
			var a = ["living","life","beauty","helath","","",""];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
			}
			
		}
	},
	mouseleave: function(){
		
	},
	click : function(){
		$(this).off('mouseleave');
		$(this).on('mouseover');
		$(this).attr("class","cheked");
		$("#category1").val("20");
		
		$("#essentialAppliance").attr("class","");
		$("#computer").attr("class","");
		$("#phoneSmartwatch").attr("class","");
		$("#digital").attr("class","");
		
		var idName = "proudctCategoryList";
		var id = [];
		var t = ["주방가전","생활가전","이미용가전","건강가전","","",""];
		var a = ["living","life","beauty","helath","","",""];
		
		for(var i=0; i<=8; i++){
			id[i] = idName + (i+1);
			$("#"+id[i]).text(t[i]);
			$("#"+id[i]).attr("class",a[i]);
		}
	}
});

$("#computer").on({
	
	mouseover: function(){
		
		if($("#essentialAppliance").hasClass("cheked") === true){
			
		}else if($("#linvingLifeHelathAppliance").hasClass("cheked") === true){
			
		}else if($("#phoneSmartwatch").hasClass("cheked") === true){
			
		}else if($("#digital").hasClass("cheked") === true){
			
		}else{
			var idName = "proudctCategoryList";
			var id = [];
			var t = ["컴퓨터","PC액세서리","PC부품","프린트/잉크/토너","","",""];
			var a = ["computer","pcAccessory","pcPart","printInkToner","","",""];
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
			}
		}
	},
	mouseleave: function(){
		
	},
	click : function(){
		$(this).off('mouseleave');
		$(this).on('mouseover');
		$(this).attr("class","cheked");
		$("#category1").val("30");
		
		$("#essentialAppliance").attr("class","");
		$("#linvingLifeHelathAppliance").attr("class","");
		$("#phoneSmartwatch").attr("class","");
		$("#digital").attr("class","");
		
		var idName = "proudctCategoryList";
		var id = [];
		var t = ["컴퓨터","PC액세서리","PC부품","프린트/잉크/토너","","",""];
		var a = ["computer","pcAccessory","pcPart","printInkToner","","",""];
		
		for(var i=0; i<=8; i++){
			id[i] = idName + (i+1);
			$("#"+id[i]).text(t[i]);
			$("#"+id[i]).attr("class",a[i]);
		}
	}
});

$("#phoneSmartwatch").on({
	
	mouseover: function(){
		
		if($("#essentialAppliance").hasClass("cheked") === true){
			
		}else if($("#linvingLifeHelathAppliance").hasClass("cheked") === true){
			
		}else if($("#computer").hasClass("cheked") === true){
			
		}else if($("#digital").hasClass("cheked") === true){
			
		}else{
			
			var idName = "proudctCategoryList";
			var id = [];
			var t = ["자급제/무약정","SKT","KT","LGU+","알뜰폰","스마트워치/밴드/ACC","액세서리"];
			var a = ["free","SKT","KT","LGU","efficiency","smartwatchBendAcc","Acc"];
			
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
			}
		}
	},
	mouseleave: function(){
		
	},
	click : function(){
		$(this).off('mouseleave');
		$(this).on('mouseover');
		$(this).attr("class","cheked");
		$("#category1").val("40");
		
		$("#essentialAppliance").attr("class","");
		$("#linvingLifeHelathAppliance").attr("class","");
		$("#computer").attr("class","");
		$("#digital").attr("class","");
		
		var idName = "proudctCategoryList";
		var id = [];
		var t = ["자급제/무약정","SKT","KT","LGU+","알뜰폰","스마트워치/밴드/ACC","액세서리"];
		var a = ["free","SKT","KT","LGU","efficiency","smartwatchBendAcc","Acc"];
		
		
		for(var i=0; i<=8; i++){
			id[i] = idName + (i+1);
			$("#"+id[i]).text(t[i]);
			$("#"+id[i]).attr("class",a[i]);
		}
	}
});

$("#digital").on({
	
	mouseover: function(){
		
		if($("#essentialAppliance").hasClass("cheked") === true){
			
		}else if($("#linvingLifeHelathAppliance").hasClass("cheked") === true){
			
		}else if($("#computer").hasClass("cheked") === true){
			
		}else if($("#phoneSmartwatch").hasClass("cheked") === true){
			
		}else{
			
			var idName = "proudctCategoryList";
			var id = [];
			var t = ["카메라","게임","음향기기","IOT","","",""];
			var a = ["camera","game","audio","iot","","",""];
			
			
			for(var i=0; i<=8; i++){
				id[i] = idName + (i+1);
				$("#"+id[i]).text(t[i]);
				$("#"+id[i]).attr("class",a[i]);
			}
		}
	},
	mouseleave: function(){
		
	},
	click : function(){
		$(this).off('mouseleave');
		$(this).on('mouseover');
		$(this).attr("class","cheked");
		$("#category1").val("50");
		
		$("#essentialAppliance").attr("class","");
		$("#linvingLifeHelathAppliance").attr("class","");
		$("#computer").attr("class","");
		$("#phoneSmartwatch").attr("class","");
		
		var idName = "proudctCategoryList";
		var id = [];
		var t = ["카메라","게임","음향기기","IOT","","",""];
		var a = ["camera","game","audio","iot","","",""];
		
		
		for(var i=0; i<=8; i++){
			id[i] = idName + (i+1);
			$("#"+id[i]).text(t[i]);
			$("#"+id[i]).attr("class",a[i]);
		}
	}
});
</script>