/**
 * 
 */
$.namespace("faq.list");
faq.list = {
		
		//탭버튼
		bindWebLog : function() {
			$("#AreaBtn .iconTab").children("li").each(function(idx) {
				if($(this).attr("data-cd") == "10") {
					$(this).bind("click", function() {
						common.wlog("customer_faq_top10");
					});
				} else if ($(this).attr("data-cd") == "40") {
					$(this).bind("click", function() {
						common.wlog("customer_faq_order");
					});
				} else if( $(this).attr("data-cd") == "90") {
					$(this).bind("click", function() {
						common.wlog("customer_faq_refund");
					})
				}
			});
		}
};
