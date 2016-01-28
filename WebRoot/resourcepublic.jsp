<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>资源发布</title>
<link href="<%=path %>/css/resourcepublic.css" type="text/css" rel="stylesheet" />
<script src="<%=path %>/js/infoinput.js" type="text/javascript"></script>
<script src="<%=path %>/js/jquery.js" type="text/javascript"></script>
<script language="javascript">
window.onload=function(){
	$("#selects1").val(0);
};
var firstTypeValue='0';
function submit_verifyA()
{
	var array1=[[2,30],[600,20000],[0,0],[0,0],[0,0]];
	var array2=[[0,null]];
	if(submit_verify(2,2,0,0,array1,array2)==1)
	{
		return true;
	}
	else
	{
		return false;
	}
}
$(document).ready(function(){
	  //实现二级联动开始
	  $("#selects1").change(function(){
	  	  setSelectHint(1);
		  firstTypeValue=$("#selects1").val();
		  if(firstTypeValue!='0')
		  {
			  $("#secondType_content").show();
			  $("#thirdType_content").hide();
			  $.post("./ResourceSelection",{firstType:firstTypeValue},function(data,status){
			  	if(data!=null)
			  	{
 				  $("#selects2").html("<option value='0'>--请选择--</option>"+data);
			  	}
			  });
		  }
		  else
		  {
		  	  $("#secondType_content").hide();
		  	  firstTypeValue='0';
		  	  $("#selectHint_out_null_2").hide();
		  	  $("#selectHint_out_right_2").hide();
		  }
	  });
	  $("#selects2").change(function(){
	  	  setSelectHint(2);
	  });
	  //实现二级联动结束
});
</script>
</head>

<body onbeforeunload=check()>
	<div id="all">
	
		<div id="tip"><img src="images/tip.jpg" alt="tip" /></div>
		<!--头部大层开始-->
		<div id="top">
		
			<!--左部开始-->
			<div id="top_left">
			
				<!--logo开始-->
				<div id="logo"><a href="jsp/indexpage.jsp" title="index"><img src="images/info_input_logo.jpg" alt="扯蛋教辅系统logo" /></a></div>
				<!--logo结束-->
				
				<!--文字开始-->
				<div id="text">资源发布</div>
				<!--文字结束-->
				<%--<%out.print(session.getAttribute("username")); %>--%>
				
				<div id="login">欢迎&nbsp;<c:out value="${sessionScope.username}"></c:out></div>
			
			</div>
			<!--左部结束-->
			
		</div>
		<!--头部大层结束-->
		
		<!--主体内容大层开始-->
		<div id="main">
			<form action="./ResourcePublic" method="post" onSubmit="return submit_verifyA();">
				<ul>
					<li>
						<div class="title">资源标题：</div>
						<div class="input" style="width:255px;height:30px;">
							<input type="text" name="title" id="input1" style="width:255px;height:30px;font-size:15px;line-height:30px;" onBlur="setInputHint_blur(1,2,30);" onFocus="setInputHint_focus(1)"/>
						</div>
						<div class="hint" id="inputHint_in1" style="display:none;background:url(images/info_input_icon2.jpg) no-repeat left center;color:#357DAD;">2-30字，请填写完整的资源名称</div>
						<div class="hint" id="inputHint_out_null_1" style="display:none;background:url(images/info_input_icon3.jpg) no-repeat left center;color:#C66C2E;">忘记填写资源名称啦</div>
						<div class="hint" id="inputHint_out_length_1" style="display:none;background:url(images/info_input_icon3.jpg) no-repeat left center;color:#C66C2E;">资源名称不足2个字哦</div>
						<div class="hint" id="inputHint_out_right_1" style="display:none;background:url(images/info_input_icon4.jpg) no-repeat left center;color:#C66C2E;"></div>
					</li>
					<li id="firstType_content">
						<div class="title">所属学院：</div>
						<div class="input" style="width:255px;height:30px;">
							<select name="college" id="selects1" style="width:255px;height:25px;font-size:15px;line-height:25px;" onBlur="setSelectHint(1);">
								<option value="0" selected="selected">--请选择--</option>
								<%--<%
	          	 				ArrayList<String[]> al1 = (ArrayList<String[]>)session.getAttribute("college");
	          	 				for(String[] s : al1)
	          	 				{
	          	 					out.println("<option value='"+s[0]+"'>"+s[1]+"</option>");
	          	 				}
	          	 			 %>--%>
	          	 			 
	          	 			 
	          	 			 <c:forEach items="${sessionScope.college}" var="c">
	          	 			 <option value='<c:out value="${c[0] }"></c:out>'><c:out value="${c[1] }"></c:out></option>
	          	 			 </c:forEach>
							</select>
						</div>
						<div class="hint" id="selectHint_out_null_1" style="display:none;background:url(images/info_input_icon3.jpg) no-repeat left center;color:#C66C2E;">忘记选择资源所属学院啦</div>
						<div class="hint" id="selectHint_out_right_1" style="display:none;background:url(images/info_input_icon4.jpg) no-repeat left center;color:#C66C2E;"></div>
					</li>
					<li id="secondType_content" style="display: none;">
						<div class="title">所属专业：</div>
						<div class="input" style="width:200px;height:30px;">
							<select name="subject" id="selects2" style="width:200px;height:25px;font-size:15px;line-height:25px;" onBlur="setSelectHint(2);">
							</select>
						</div>
						<div class="hint" id="selectHint_out_null_2" style="display:none;background:url(images/info_input_icon3.jpg) no-repeat left center;color:#C66C2E;">忘记选择资源所属专业啦</div>
						<div class="hint" id="selectHint_out_right_2" style="display:none;background:url(images/info_input_icon4.jpg) no-repeat left center;color:#C66C2E;"></div>
					</li>
					<li style="height:300px;">
						<div class="title">资源内容：</div>
						<div class="input" style="width:500px;height:300px;">
							<textarea name="content" id="input2" style="width:500px;height:300px;font-size:15px;line-height:20px;" onBlur="setInputHint_blur(2,600,20000);" onFocus="setInputHint_focus(2);"></textarea>
						</div>
						<div class="hint" id="inputHint_in2" style="width:210px;display:none;background:url(images/info_input_icon2.jpg) no-repeat left center;color:#357DAD;">资源内容需要600-20000字哦</div>
						<div class="hint" id="inputHint_out_null_2" style="width:210px;display:none;background:url(images/info_input_icon3.jpg) no-repeat left center;color:#C66C2E;">忘记填写资源内容啦</div>
						<div class="hint" id="inputHint_out_length_2" style="width:210px;display:none;background:url(images/info_input_icon3.jpg) no-repeat left center;color:#C66C2E;">资源内容不足600个字哦</div>
						<div class="hint" id="inputHint_out_right_2" style="width:210px;display:none;background:url(images/info_input_icon4.jpg) no-repeat left center;color:#C66C2E;"></div>
					</li>
				</ul>
				
				<!--提交按钮开始-->
				<div style="width:140px;height:40px;float:left;margin-left:200px;margin-right:0px;padding:0px;"><input type="submit" id="submit" value="" style="width:140px;height:40px; cursor:pointer;margin:0px;padding:0px;border:0px;" /></div>
				<!--提交按钮结束-->
				
			</form>
		</div>
		<!--主体内容大层结束-->
		
	</div>
</body>
</html>
