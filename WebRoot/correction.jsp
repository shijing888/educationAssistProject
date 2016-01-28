<%@ page language="java" contentType="text/html; charset=UTF-8" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<link href="<%=path %>/css/correction.css" type="text/css" rel="stylesheet" />
<script src="<%=path %>/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path %>/js/correction.js"></script>
<script language="javascript" type="text/javascript" src="<%=path %>/js/My97DatePickerBeta/My97DatePicker/WdatePicker.js"></script>
<title>错题回顾</title>
</head>
<body>
	<div id="all">
		
		<!--头部大层开始-->
		<div id="top">
		
			<!--左部开始-->
			<div id="top_left">
			
				<!--logo开始-->
				<div id="logo"><a href="personIndex.jsp" title="index"><img src="images/info_input_logo.jpg"/></a></div>
				<!--logo结束-->
				
				<!--文字开始-->
				<div id="text">错题回顾</div>
				<!--文字结束-->
				<div id="login">欢迎&nbsp;&nbsp;${session.username }</div>
			
			</div>
			<!--左部结束-->
		</div>
		<!--头部大层结束-->
		
		<!--主体内容大层开始-->
		<div id="all_main">
		
			<!--左部开始-->
			<div id="main_left">
			
				<!--会员信息开始-->
		    	<div id="left_loginer" class="contentBox">
			  		<div class="bt">
		        		<div class="bt_left"><h2><span class="chinese">查看须知/</span><span class="english">attention</span></h2></div>
		      		</div>
		      		<div class="nr">
						<div>请您指定您要查看错题的所属日期，然后点击搜索！</div>
		      		</div>
				</div>
		   	 	<!--会员信息结束-->
			
			</div>
			<!--左部结束-->
			
			<!--右部开始-->
			<div id="main_right">
	    	
			   	<div class="bt">
					<div class="bt_left"><h2><span class="chinese">错题展示/</span><span class="english">Questions</span></h2></div>
		      	</div>
			  	<div id="selection">
			  		<div class="selectDate">
					所属日期:&nbsp;&nbsp;<input class="Wdate" type="text" name="birth" id="date" onClick="WdatePicker()" onblur="birth_default();" value="2016-01-25" />
					</div>	
				</div>
          			<div class="dotDivide"><input id="search" name="imageField" type="image" src="images/search.gif" width="60" height="20" border="0" class="np" /></div>
		      	<div id="content">
				        <i class="contentTip">请选择您要回顾的日期</i>
				</div>
				<!--提交按钮开始-->
				<div class="preAndnext">
				<div class="pre"><input id="pre" name="pre" type="image" src="images/question_pre.jpg"  /></div>
				<div class="next"><input id="next" name="next" type="image" src="images/question_next.jpg"  /></div>
				</div>
				<!--提交按钮结束-->

			</div>
			<!--右部结束-->

		</div>
		<!--主体内容大层结束-->
	</div>
</body>
</html>