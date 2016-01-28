<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>考试中心</title>
<link rel="stylesheet" href="<%=path%>/css/correction.css"
	type="text/css" />
<script src="<%=path%>/js/jquery.js" type="text/javascript"></script>
<script src="<%=path%>/js/exam.js" type="text/javascript"></script>
<script src="<%=path%>/js/personalIndex.js" type="text/javascript"></script>
</head>
<body>
	<div id="all">

		<!--头部大层开始-->
		<div id="top">

			<!--左部开始-->
			<div id="top_left">

				<!--logo开始-->
				<div id="logo">
					<a href="personIndex.jsp" title="index"><img
						src="images/info_input_logo.jpg" /></a>
				</div>
				<!--logo结束-->

				<!--文字开始-->
				<div id="text">自我检测</div>
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
						<div class="bt_left">
							<h2>
								<span class="chinese">考试须知/</span><span class="english">attention</span>
							</h2>
						</div>
					</div>
					<div class="nr">
						<div>测试总共5道题，每道题20分！</div>
					</div>
				</div>
				<!--会员信息结束-->

			</div>
			<!--左部结束-->

			<!--右部开始-->
			<div id="main_right">

				<div class="bt">
					<div class="bt_left">
						<h2>
							<span class="chinese">考题展示/</span><span class="english">Questions</span>
						</h2>
					</div>
				</div>
				<div id="selection">
					<div>
						<div id="firstType_content">
							<div class="s1">学院：</div>
							<div class="s2">
								<select id="firstType" name='cid1'
									onchange="initST(1,this.value);">
									<option value='0' selected="selected">请选择学院</option>
									<c:forEach items="${college}" var="item">
										<option value="${item.collegeName}">${item.collegeName}</option>
									</c:forEach>
								</select>
							</div>
						</div>
						<div id="secondType_content">
							<div class="s1">专业：</div>
							<div class="s2">
								 <select id="secondType" name='cid2'
									onchange="initST(2,this.value);">
									<option selected="selected">请选择专业</option>
								</select>
							</div>
						</div>
						<div id="thirdType_content">
							<div class="s1">教师：</div>
							<div class="s2">
								<select id="thirdType" name='cid3'>
								</select>
							</div>
						</div>
					</div>
				</div>
				<div class="dotDivide">
					<input id="start" name="imageField" type="image"
						src="images/start.gif" width="60" height="20" class="np" />
				</div>
				<div id="content">请选择您要测试题目的类型</div>
				<!--提交按钮开始-->
				<div class="preAndnext">
					<div class="pre">
						<input id="pre" name="pre" type="image"
							src="images/question_pre.jpg" />
					</div>
					<div class="next">
						<input id="next" name="next" type="image"
							src="images/question_next.jpg" />
					</div>
				</div>
				<!--提交按钮结束-->

			</div>
			<!--右部结束-->

		</div>
		<!--主体内容大层结束-->


	</div>
</body>
</html>