var pageNum = 1;
var teacher;
var checkData;
var dataLength;
$(document).ready(
		function() {
			// 实现信息列表展示开始
			$("#start").click(
					function() {
						teacher = $("#thirdType").val();
						pageNum = 1;
						$.post("personalIndex_getItem", {teacher:teacher},
						  function(data, status) {
							checkData=data;
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
				var content = "<ul>" + checkData[pageNum - 1].questionTitle;
				content += "<li>" + checkData[pageNum - 1].questionA + "</li>";
				content += "<li>" + checkData[pageNum - 1].questionB + "</li>";
				content += "<li>" + checkData[pageNum - 1].questionC + "</li>";
				content += "<li>" + checkData[pageNum - 1].questionD + "</li>";
				content += "<li><i>请填写答案:<input type='text' id='answer'>"
						+"</i></li>";
				content +="<li><input type='submit' id='contentSubmit'></li>";
				content += "</ul>";
				$("#content").html(content);
				$("#ContentSubmit").click(function(){
					var ans=$("#answer").val();
					if(ans==checkData[pageNum-1].questionAnswer)
						alert("恭喜您答对了！请点击下一题继续。");
					else{
						alert("您打错了！请点击下一题继续");
						var ques=checkData[pageNum-1].questionId;
						$.post("personalIndex_addError",{questionId:ques});
					}
					
				});
			}
		});