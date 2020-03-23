package com.axweb.controller;

import java.util.Collection;
import java.util.Iterator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.axweb.bean.Tags;
import com.axweb.bean.Video;
import com.axweb.service.TagService;
import com.axweb.service.VideoService;

@Controller
public class UtilsController {
	@Autowired
	TagService tagservice;
	@Autowired
	VideoService videoservice;
	
	@RequestMapping("goindex")
	public String goindex(Model model) {
		Collection<Tags> tags = tagservice.getalltags();
		for(Tags tag:tags) {
			Collection<Video> videos = videoservice.getvideorandombytag(tag.getId());
			tag.setVideos(videos);
			Collection<Video> videosorder = videoservice.getvideoorderbytag(tag.getId());
			tag.setVideosorder(videosorder);
		}
		model.addAttribute("tags", tags);
		return "index";
	}
	
	@RequestMapping("gologin")
	public String gologin() {
		return "login";
	}
	
	@RequestMapping("goregister")
	public String goregister() {
		return "register";
	}
	
	@RequestMapping("postvideo")
	public String gopostvideo(Model model) {
		model.addAttribute("tags", tagservice.getalltags());
		return "postvideo";
	}
}
