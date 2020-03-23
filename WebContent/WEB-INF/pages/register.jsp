<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%pageContext.setAttribute("ctp", request.getContextPath()); %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${ctp }/js/jquery-3.4.1.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>注册</title>
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
							<li><a href="gologin">登陆</a></li>
						</ul>				
					</div>
					<canvas id="demo-canvas"></canvas>
					<div class="logo_box">
						<h3>注册</h3><hr/>
						<form action="${ctp }/userRegister" modelAttribute="user" name="f" method="post">
							<div class="input_outer">
								<input name="name" id="logname" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入用户名">
								<p></p>
							</div>
							<div class="input_outer">
								<input name="id" id="logid" class="text" style="color: #FFFFFF !important" type="text" placeholder="请输入账户">
							</div>
							<div class="input_outer">
								<input name="password" id="logpass" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请输入密码">
							</div>
							<div class="input_outer">
								<input name="logpass2" id="logpass2" class="text" style="color: #FFFFFF !important; position:absolute; z-index:100;"value="" type="password" placeholder="请再次输入密码">
							</div>
							<div class="mb2"><a id="logsubmit" class="act-but submit" href="javascript:;" style="color: #FFFFFF" onclick="f.submit()">注册</a></div>
							<p id="nameerror">用户名不能为空</p>
							<p id="iderror">账号长度不能小于6位</p>
							<p id="passerror">密码长度不能小于6位</p>
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
<script type="text/javascript">
$("#logname").focus(function(){
	$("#nameerror").text("");
});
$("#logname").blur(function(){
	if($("#logname").val().length<1)
		$("#nameerror").text("用户名不能为空");
});
$("#logid").blur(function(){//检测账号id栏是否正确
	if($("#logid").val().length<6){
		$("#iderror").text("账号长度不能小于6位,现在长度："+$("#logid").val().length);
	};
	var data={
			url:"${ctp}/usercount",
			data:{id:$("#logid").val()},
			type:"GET",
			success:function(result){
				if(result > 0)
					$("#iderror").text("账号已存在");
			}
	};
	$.ajax(data)
});
$("#logid").focus(function(){
	$("#iderror").text("");
});
$("#logpass").blur(function(){
	if($("#logpass").val().length<6)
		$("#passerror").text("密码长度不能小于6位");
	else if($("#logpass").val()!=$("#logpass2").val())
		$("#passerror").text("密码不相同");
});
$("#logpass2").blur(function(){
	if($("#logpass").val().length<6)
		$("#passerror").text("密码长度不能小于6位");
	if($("#logpass").val()!=$("#logpass2").val())
		$("#passerror").text("密码不相同");
});
$("#logpass").focus(function(){
	$("#passerror").text("");
});
$("#logpass2").focus(function(){
	$("#passerror").text("");
});
$("#logsubmit").click(function(){
	//alert($("#nameerror").text().length+" "+$("#passerror").text().length+" "+$("#iderror").text().length);
	if($("#nameerror").text().length>0||$("#passerror").text().length>0||$("#iderror").text().length>0){
		alert($("#nameerror").text()+"\n"+$("#passerror").text()+"\n"+$("#iderror").text());
	}
})
</script>
</html>