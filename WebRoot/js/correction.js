var pageNum = 1;
var date;
var errorData;
var dataLength;
$(document).ready(
		function() {
			// 实现信息列表展示开始
			$("#search").click(
					function() {
						date = $("#date").val();
						pageNum = 1;
						$.post("personalIndex_getErrors", {
							date : date
						}, function(data, status) {
							errorData=data;
							dataLength = data.length;
							content();
						}, "json");
					});
			$("#pre").click(
					function() {
						pageNum -=1;
						if (pageNum == 0) {
							pageNum = 1;
							alert("已经是第一题了");
						} else {
							content();
						}
					});
			$("#next").click(function() {
				pageNum +=1; 
				if (pageNum == dataLength+1) {
					pageNum -=1 ;
					$("#content").html(content);
					alert("已经是最后一题了");
				} else {
					content();
				}
			});
			function content(){
				$("#content").empty();
				var content = "<ul>" + errorData[pageNum - 1].questionTitle;
				content += "<li>" + errorData[pageNum - 1].questionA + "</li>";
				content += "<li>" + errorData[pageNum - 1].questionB + "</li>";
				content += "<li>" + errorData[pageNum - 1].questionC + "</li>";
				content += "<li>" + errorData[pageNum - 1].questionD + "</li>";
				content += "<li><i style='color:red;'>答案是：("
						+ errorData[pageNum - 1].questionAnswer + ")</i></li>";
				content += "</ul>";
				$("#content").html(content);
			}
		});