package com.axweb.controller;

import java.io.File;
import java.io.IOException;
import java.net.*;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.UrlResource;
import org.springframework.jdbc.datasource.WebSphereDataSourceAdapter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.axweb.bean.User;
import com.axweb.bean.Video;
import com.axweb.service.VideoService;
import com.axweb.util.ImageUtil;

@Controller
public class VideoController {
	@Autowired
	VideoService videoservice;
	
	@ResponseBody
	@RequestMapping("uploadvideo")
	public Boolean uploadvideo(Video video,
			@RequestParam("img")MultipartFile imgfile,
			@RequestParam("video")MultipartFile videofile,
			@RequestParam("userid")String uid,
			HttpSession session) throws MalformedURLException {
		
		
		User user=(User)session.getAttribute("user");
		if(user.getId()!=Integer.parseInt(uid))
			return false;
		//封面存储
		//String path="/var/Images";  改为服务器时记得要修改两个路径http://axweb.xyz:8080/Images/
		String imgpath="G:\\haha";
		String imgname=imgfile.getOriginalFilename();
		String uuid=UUID.randomUUID().toString().replace("-", "");
		imgname=uuid+"_"+imgname;
		video.setImgpath(imgpath+imgname);
		//视频存储
		String videopath="G:\\haha";
		String videoname=videofile.getOriginalFilename();
		videoname=uuid+"_"+videoname;
		video.setPath(videopath+videoname);
		video.setVid(uuid.substring(10));
		video.setUid(Integer.parseInt(uid));
		System.out.println(video);
		try {
			imgfile.transferTo(new File(imgpath,imgname));
			videofile.transferTo(new File(videopath,videoname));
			videoservice.addvideo(video);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		try {
			ImageUtil imageutil = new ImageUtil();
			imageutil.randomGrabberFFmpegImage(videopath+"\\"+videoname, videopath, "b"+imgname);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}
	
}
