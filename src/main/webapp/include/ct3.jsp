<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script>
//상품
$("#proudctCategoryProductListGoods1").on({
	click : function(){
		var a = "proudctCategoryProductListGoods";
		var b = [];
		for(var i=1; i<=8; i++){
			b[i] = a + i;
		}
		
		if($("#proudctCategoryProductListGoods1").hasClass("TV") === true) {
			for(var i=1; i<=8; i++){
				b[i] = a + i;
				$("#"+b[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category3").val("10");
			
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			
		}else if($("#"+a+"1").hasClass("doubleRefrigerator") === true) {
			for(var i=1; i<=8; i++){
				b[i] = a + i;
				$("#"+b[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			$("#category3").val("10");
			
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			
		}
		
		else {
			alert("실패");
		}
	}
});
$("#proudctCategoryProductListGoods2").on({
	click : function(){
		if($("#proudctCategoryProductListGoods2").hasClass("miniSoundbarBlue") === true) {
			var a = "proudctCategoryProductListGoods";
			var b = [];
			
			for(var i=1; i<=8; i++){
				b[i] = a + i;
				$("#"+b[i]).css("background-color","white");
			}
			
			$("#category3").val("20");
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			$(this).css("background-color","orange");
			
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryProductListGoods3").on({
	click : function(){
		if($("#proudctCategoryProductListGoods3").hasClass("tvAccessory") === true) {
			$("#category3").val("30");
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			
			var a = "proudctCategoryProductListGoods";
			var b = [];
			
			for(var i=1; i<=8; i++){
				b[i] = a + i;
				$("#"+b[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			
			
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryProductListGoods4").on({
	click : function(){
		if($("#proudctCategoryProductListGoods4").hasClass("digitalFrame") === true) {
			$("#category3").val("40");
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			
			var a = "proudctCategoryProductListGoods";
			var b = [];
			
			for(var i=1; i<=8; i++){
				b[i] = a + i;
				$("#"+b[i]).css("background-color","white");
			}
			
			$(this).css("background-color","orange");
			
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryProductListGoods5").on({
	click : function(){
		if($("#proudctCategoryProductListGoods5").hasClass("TV") === true) {
			$("#category3").val("50");
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			$(this).css("background-color","orange");
			
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryProductListGoods6").on({
	click : function(){
		if($("#proudctCategoryProductListGoods6").hasClass("TV") === true) {
			$("#category3").val("60");
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			$(this).css("background-color","orange");
			
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryProductListGoods7").on({
	click : function(){
		if($("#proudctCategoryProductListGoods7").hasClass("TV") === true) {
			$("#category3").val("70");
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			$(this).css("background-color","orange");
			
		}else {
			alert("실패");
		}
	}
});
$("#proudctCategoryProductListGoods8").on({
	click : function(){
		if($("#proudctCategoryProductListGoods8").hasClass("TV") === true) {
			$("#category3").val("80");
			$("#categoryNum").val(category1.value + category2.value + category3.value);
			$(this).css("background-color","orange");
			
		}else {
			alert("실패");
		}
	}
});
</script>