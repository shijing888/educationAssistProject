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
<title>SEU专业教辅系统</title>
<link rel="stylesheet" href="<%=path%>/css/personalIndex.css"
	type="text/css" />
<script src="<%=path%>/js/jquery.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=path%>/js/personalIndex.js"></script>
</head>
<body>
	<div id="all">

		<!--头部大层开始-->
		<div id="all_top">
			<img src="images/top_banner.jpg" alt="教辅系统" />
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
								<span class="chinese">用户信息/</span><span class="english">User</span>
							</h2>
						</div>
					</div>
					<div class="nr">
						<c:if test="${userIdentify==1}">
							<div>教工编号：${userNumber}</div>
							<div>您可以使用如下功能：</div>
							<div style='float:right;margin-left:0px;margin-right:30px;'>
								<a href='resourcepublic.jsp'>发布新的资源</a>
							</div>
						</c:if>
						<c:if test="${userIdentify==2}">
							<div>学生编号：${userNumber}</div>

							<div>您可以使用如下功能：</div>
							<div style='float:right;margin-left:0px;margin-right:30px;'>
								<a href='personalIndex_selfCheck'>自我检测</a>
							</div>
							<div style='float:right;margin-left:0px;margin-right:30px;'>
								<a href='correction.jsp'>错题回顾</a>
							</div>
						</c:if>
					</div>
				</div>
				<!--会员信息结束-->

				<!--热门资源开始-->
				<div id="left_hotresource" class="contentBox">
					<div class="bt">
						<div class="bt_left">
							<h2>
								<span class="chinese">热门资源/</span><span class="english">Resources</span>
							</h2>
						</div>
					</div>
					<div class="nr">
						<ul>
							<c:forEach items="${resource}" var="item">
								<li><a href="">${item.title }</a><i>/点击量:${item.yesterdayClicknum}</i></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<!--热门资源结束-->

			</div>
			<!--左部结束-->

			<!--右部开始-->
			<div id="main_right">

				<!--教学资源开始-->
				<div id="right_teachResources" class="contentBox">
					<div class="bt">
						<div class="bt_left">
							<h2>
								<span class="chinese">资源检索/</span><span class="english">Resources</span>
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
							<div id="secondType_content" >
								<div class="s1">专业：</div>
								<div class="s2">
									<select id="secondType" name='cid2'
										onchange="initST(2,this.value);">
										<!--  <option selected="selected">请选择专业</option>
										<c:if test="${flag==1 }">
										<c:forEach items="${subjectOrTeacher}" var="item">
											<option value="${item}">${item}</option>
										</c:forEach></c:if> -->
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
						<input id="search" name="imageField" type="image"
							src="images/search.gif" class="np" />
					</div>
					<div class="nr" id="resource_list">请输入筛选条件</div>

					<!--翻页开始-->
					<div id="fy">
						<span id="pre">上一页</span> <span id="next">下一页</span>
					</div>
					<!--翻页结束-->

				</div>
				<!--教学资源结束-->

			</div>
			<!--右部结束-->

		</div>
		<!--主体内容大层结束-->
	</div>
</body>
</html>
