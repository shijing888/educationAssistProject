<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.*" pageEncoding="utf-8"%>
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

<meta http-equiv="Content-Type" content="text/html; charset=GBK" />
<title>用户登陆-SEU教辅系统</title>
<link rel="stylesheet" href="<%=path%>/css/login.css" type="text/css" />
<script src="<%=path%>/js/login_verify.js" type="text/javascript"></script>
</head>

<body>
	<div id="all">
		<!--头部大层开始-->
		<div id="top">
			<!--左部开始-->
			<div id="top_left">
				<!--logo开始-->
				<div id="logo">
					<img src="<%=path%>/images/info_input_logo.jpg" alt="教辅系统logo" />
				</div>
				<!--logo结束-->

				<!--文字开始-->
				<div id="text">用户登陆</div>
				<!--文字结束-->

			</div>
			<!--左部结束-->

		</div>
		<!--头部大层结束-->

		<!--主体大层开始-->
		<div id="main">
			<!--主体左部开始-->
			<div id="main_left">
				<img src="<%=path%>/images/login_picshow.jpg" alt="登陆界面展示图片" />
			</div>
			<!--主体左部结束-->

			<!--主体右部开始-->
			<div id="main_right">

				<!--登陆表单开始-->
				<div id="input">
					<form action="login" method="post"
						onsubmit="return login_verify();">

						<!--账户名输入开始-->
						<div class="input">

							<!--标题开始-->
							<div class="title">用户名</div>
							<!--标题结束-->

							<!--输入框开始-->
							<div class="input_box">
								<input type="text" name="username" id="input_name" />
							</div>
							<!--输入框结束-->

						</div>
						<!--账户名输入结束-->

						<!--密码输入开始-->
						<div class="input">

							<!--标题开始-->
							<div class="title">密码</div>
							<!--标题结束-->
							<!--输入框开始-->
							<div class="input_box">
								<input type="password" name="password" id="input_password" />
							</div>
							<!--输入框结束-->

						</div>
						<!--密码输入结束-->

						<!--用户身份选择开始-->
						<div id="user_selection">
							<div class="user_selection">
								教师<input type="radio"  name="userIdentify"
									value="1" />
							</div>
							<div class="user_selection">
								学生<input type="radio" checked="checked" name="userIdentify" value="2" />
							</div>
							<div class="user_selection">
								管理员<input type="radio" name="userIdentify" value="3" />
							</div>
						</div>
						<!--用户身份选择结束-->

						<!--提交按钮开始-->
						<div class="submit">
							<input type="submit" id="submit" value=""
								onclick="login_verify()" /> <a href="jsp/changePsw.jsp">
							</a>
						</div>
						<!--提交按钮结束-->

					</form>
				</div>
				<!--登陆表单结束-->

			</div>
			<!--主体右部结束-->

		</div>
		<!--主体大层结束-->

	</div>
</body>
</html>
