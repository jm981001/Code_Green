// #quan 자리에 수량 표시하는 태그 id 적으면됨 
//<input type="text" id="quan" value="1" placeholder="1">


//$(".up").on("click", function() {
//	let quantity = $("#quan").val();
//	$("#quan").val(++quantity);
//});
//$(".down").on("click", function() {
//	let quantity = $("#quan").val();
//	if (quantity > 1) { 
//		$("#quan").val(--quantity);
//	}
//});


/* 수량버튼 */
$(".up").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".down").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});


/* 수량 수정 버튼 */
//$(".quantity_modify_btn").on("click", function(){
//	let cart_idx = $(this).data("cart_idx");
//	let cart_amount = $(this).parent("td").find("input").val();
//	$(".update_cart_idx").val(cart_idx);
//	$(".update_item_amount").val(cart_amount);
//	$(".quantity_update_form").submit();
//	
//});


//<script src="/Code_Green/resources/js/quantity.js"></script>
//
//</body>위에 붙여넣기