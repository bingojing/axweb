<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%pageContext.setAttribute("ctp", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>登陆</title>
<link rel="stylesheet" type="text/css" href="${ctp }/css/loginnormalize.css" />
<link rel="stylesheet" type="text/css" href="${ctp }/css/logindemo.css" />
<link rel="stylesheet" type="text/css" href="${ctp }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/index.css">
<!--必要样式-->
<link rel="stylesheet" type="text/css" href="${ctp }/css/logincomponent.css" />
</head>
<body>
	<div class="container demo-1">
			<div class="content">
				<div id="large-header" class="large-header">
					<div class="navtop">
						<ul class="navleft">
							<li></li>
							<li><a href="goindex">主页</a></li>
						</ul>
						<ul class="navright">
							<li><a href="goregister">注册</a></li>
						</ul>				
					</div>
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>登陆</h3><hr/>
						<form action="userlogin" name="f" method="post">
							<div class="input_outer">
								<span class="u_user"></span>
								<input name="logname" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
							</div>
							<div class="input_outer">
								<span class="us_uer"></span>
								<input name="logpass" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>
							<div class="mb2"><a class="act-but submit" href="javascript:;" style="color: #FFFFFF" onclick="f.submit()">登录</a></div>
						</form>
					</div>
				</div>
			</div>
		</div><!-- /container -->
		<script src="${ctp }/js/loginTweenLite.min.js"></script>
		<script src="${ctp }/js/loginEasePack.min.js"></script>
		<script src="${ctp }/js/loginrAF.js"></script>
		<script src="${ctp }/js/logindemo-1.js"></script>
</body>
</html>