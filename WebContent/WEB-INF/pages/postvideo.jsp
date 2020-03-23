<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
pageContext.setAttribute("ctp", request.getContextPath()); 
pageContext.setAttribute("usersession", session.getAttribute("user"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script type="text/javascript" src="${ctp }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${ctp }/js/jquery.form.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>投稿</title>
<link rel="stylesheet" type="text/css" href="${ctp }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/index.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/postcomponent.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/fontawsome/css/font-awesome.css">
</head>
<body>
	<div class="navtop">
		<ul class="navleft">
			<li></li>
			<li><a href="goindex">主页</a></li>
		</ul>
		<ul class="navright">
					<c:if test="${usersession.id!=null }">
						<li><a href="${ctp }/postvideo">投&nbsp;稿</a></li>
						<li><a href="">历史</a></li>
						<li>
							<a href="" class="akari">
								<img alt="text" class="imag" src="${usersession.headpic }">
							</a>
							<div class="hb">
								<p><center>${usersession.name }</center></p><hr/>
								<div class="counts">
									<a href="" class="count-item">
										<div class="item-key">关注</div>
 										<div class="item_value">${usersession.attention }</div>
									</a>
									<a href="" class="count-item">
										<div class="item-key">粉丝</div>
										<div class="item_value">${usersession.fans }</div>
									</a>
								</div>
								<div class="links">
									<a href="" class="link-item">个人中心</a>
									<a href="" class="link-item">投稿管理</a>
								</div>
								<a href="${ctp }/downlogin" class="submit">切换用户</a>
							</div>
						</li>
					</c:if>
					<c:if test="${usersession.id==null }">
						<li><a href="">投&nbsp;稿</a></li>
						<li><a href="">历史</a></li>
						<li>
							<a href="" class="akari"></a>
							<div class="hb">
								<p>登录后你可以：</p>
								<div class="pic"></div>
								<a href="${ctp }/gologin" class="submit">登录</a>
								<p>首次使用？<a href="${ctp }/goregister">点我去注册</a></p>
							</div>
						</li>
					</c:if>
				</ul>				
	</div>
	<div id="post-box">
		<h3>上传视频</h3>
		<form id="postform"  enctype="multipart/form-data" method="post">
			<input type="hidden" id="userid" name="userid" value="${sessionScope.user.id}"/>
			<div class="item">
				<i class="fa fa-folder" aria-hidden="true"></i>
				<input name="title" id="title" type="text" placeholder="标题"/>
			</div>
			<div class="item">
				<i class="fa fa-bars" aria-hidden="true"></i>
				<select name="tag" id="tag">
					<option selected disabled style="display:none">类别</option>
					<c:forEach items="${tags }" var="tag">
						<option value="${tag.id }">${tag.name }</option>
					</c:forEach>
				</select>
			</div>
			<div class="item">
				<i class="fa fa-tag" aria-hidden="true"></i>
				<input type="text" id="type" name="type" placeholder="标签"/>
			</div>
			<div class="item">
				<i class="fa fa-file-image-o" aria-hidden="true"></i>
				<input type="file" id="img" name="img" accept="image/*">
			</div>
			<div class="item">
				<i class="fa fa-file-video-o" aria-hidden="true"></i>
				<input type="file" id="video" name="video" accept="video/*">
			</div>
			<div class="item">
				<progress id="progressBar" value="0" max="100"></progress>
				<span id="percentage"></span>
				<p id="uploader-per"></p>
			</div>
			<button id="videopost">提交</button>
		</form>
	</div>
</body>
<script type="text/javascript">
$("#videopost").click(function(){
	//上传文件格式判断
	var imgpath=$("#img").val();
	var extStart=imgpath.lastIndexOf(".");
	var ext=imgpath.substring(extStart,imgpath.length).toUpperCase();
	var videopath=$("#video").val();
	var extStart2=videopath.lastIndexOf(".");
	var ext2=videopath.substring(extStart2,videopath.length).toUpperCase();
	if($("#userid").val().length<1)
		alert('请登陆')
	else{
		if($("#title").val().length<1)
			alert('请输入标题')
		else{
			if($("#tag").length<1)
				alert('请选择视频类别')
			else{
				if($("#type").val().length<1)
					alert('请输入视频标签')
				else{
					if($("#img").val().length<1)
						alert('请选择封面')
					else{
						if(ext!=".BMP"&&ext!=".PNG"&&ext!=".GIF"&&ext!=".JPG"&&ext!=".JPEG"){
							alert("封面格式错误");
						}
						else{
							if($("#video").val().length<1)
								alert('请选择视频')
							else{
								if(ext2!=".AVI"&&ext2!=".WMV"&&ext2!=".OGM"&&ext2!=".ASX"&&ext2!=".MPG"&&ext2!=".WEBM"&&ext2!=".MP4"&&ext2!=".OGV"&&ext2!=".MPEG"&&ext2!=".MOV"&&ext2!=".M4V"){
									alert("视频格式错误"+ext2);
								}
								else{
									$("#postform").ajaxSubmit({
										url:'${ctp }/uploadvideo',
										type:'post',
										xhr: function() {        //ajax进度条，直接拿过去就可以用
							                var xhr = $.ajaxSettings.xhr();
							                if (xhr.upload) {
							                    xhr.upload.addEventListener("progress", function (e) {
							                        var loaded = e.loaded; //已经上传大小情况
							                        var tot = e.total; //附件总大小
							                        var per = Math.floor(100 * loaded / tot); //已经上传的百分比
							
							                        $('#progressBar').css('width',per+'%');   //这里指的是进度条的宽度等于完成的百分比
							                        //$.fn.progressInit.draw(per+ '%'); //绘制经度条
							                        $("#uploader-per").text(per+'%');
							                    }, false);
							                    return xhr;
							                }
							            },
										success:function(result){
											if(result == true){
												alert("上传成功")
												$("#postform")[0].reset();
												$('#progressBar').css('width',0+'%');   //这里指的是进度条的宽度等于完成的百分比
								                 //$.fn.progressInit.draw(per+ '%'); //绘制经度条
								                 $("#uploader-per").text("");
											}
											else{
												 $('#progressBar').css('width',0+'%');   //这里指的是进度条的宽度等于完成的百分比
								                 //$.fn.progressInit.draw(per+ '%'); //绘制经度条
								                 $("#uploader-per").text("");
												alert("上传失败")
											}
										},
										error:function(){
											 $('#progressBar').css('width',0+'%');   //这里指的是进度条的宽度等于完成的百分比
							                 //$.fn.progressInit.draw(per+ '%'); //绘制经度条
							                 $("#uploader-per").text("");
											alert("上传失败")
										}
									})
								}
							}
						}
					}
				}
			}
		}
	}
	return false;
})
</script>
</html>