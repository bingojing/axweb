<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	pageContext.setAttribute("ctp", request.getContextPath());
	pageContext.setAttribute("usersession", session.getAttribute("user"));
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>axweb</title>
<link rel="stylesheet" href="${ctp }/css/jquery.autoMenu.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/reset.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/base.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/common.css">
<link rel="stylesheet" type="text/css" href="${ctp }/css/index.css">
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript" src="${ctp }/js/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="${ctp }/js/jquery.autoMenu.js"></script>
<script src="${ctp }/js/jquery.autoMenu.js" type=“text/javascript”></script>
<style type="text/css">
.fixed {
      position: fixed;
      top: 0px;
      right: 20px;
    }

</style>
</head>
<body>
	<header>
		<div class="navtop">
			<div class="inner">
				<ul class="navleft">
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
					<li><a href=""></a></li>
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
				<div class="logo">
				<h1>哔哩哔哩 (゜-゜)つロ 干杯_-bilibili</h1>
				</div>
				<div class="search">
					<a href="" class="sl">排行榜</a>
					<a href="" class="sr"></a>
					<input type="text" value="合肥董豪的富豪生活">
				</div>				
			</div>
		</div>
	</header>
	<nav class="inner">
		<ul class="lf">
			<li><a href="">首页</a></li>
			<c:forEach items="${tags }" var="tag">
				<li style="background:url(../${ctp}/images/icons.png) -660px -1166px no-repeat;">
					<a href="">${tag.name }</a>
				</li>
			</c:forEach>
		</ul>
		<ul class="lr">
			<li><a href="">专栏</a></li>
			<li><a href="">广场</a></li>
			<li><a href="">直播</a></li>
			<li><a href="">小黑屋</a></li>
			<li><a href="" title="だんご大家族"><img src=""></a></li>
		</ul>
	</nav>
	<c:forEach items="${tags }" var="tag">
		<div class="animation inner">
			<div class="anleft">
				<div class="anlefttop">
					<h3><a href="">${tag.name }</a></h3>
					<a href="">有新动态</a>
					<a href="">最新投稿</a>
					<a href="">更多</a>
					<a href=""><span></span>4328条新动态</a>
				</div>
				<ul class="anleftbtm">
						<c:forEach items="${tag.videos}" var="video">
							<li>
								<a href="goindex">
									<video width="160px" height="100px" controls="controls" poster="${video.imgpath}" preload="none" muted>
										<source src="${video.path }"></source>
									</video>
									<p>${video.title }</p>
									<p><i></i>${video.click }<i></i>${video.comment }</p>
								</a>
							</li>
						</c:forEach>
				</ul>
			</div>
			<!-- 左边部分完成 -->
			<div class="anright">
				<div class="anrighttop">
					<h2>排行</h2>
					<a href="">全部</a>
					<a href="">原创</a>
					<a href="">三日</a>
				</div>
				<ol class="anrightbtm">
					<c:forEach items="${tag.videosorder }" var="video">
						<li>
							<img src="${video.imgpath }" alt="p" width="77px" height="50px">
							<p>${video.title }</p>
							<p>喜欢数：${video.like }</p>
						</li>
					</c:forEach>
				</ol>			
			</div>
		</div>
	</c:forEach>
<div class="autoMenu w" id="autoMenu" data-autoMenu > </div>
</body>
<script>
  $(function () {
    $(window).scroll(function () {
      if ($(window).scrollTop()>=240){
        //console.log($(window).scrollTop())
        $(".autoMenu").addClass("autoMenu fixed");
      }else {
        $(".autoMenu").removeClass("fixed");
      }
      var idx=$(".active").index();
      $("#autoMenu li").eq(1).addClass("current")

    })})
</script>
</html>