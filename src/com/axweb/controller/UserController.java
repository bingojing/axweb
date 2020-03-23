package com.axweb.controller;

import java.io.IOException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.axweb.bean.User;
import com.axweb.service.UserService;

@Controller
public class UserController {
	@Autowired
	UserService userService;
	@RequestMapping("/getuser")
	public String getUser(@RequestParam(value="id",defaultValue="1")Integer id,Model model) {
		User user = userService.getUser(id);
		model.addAttribute("user", user);
		return "list";
	}
	
	@RequestMapping("/userlogin")
	public String userlogin(@RequestParam(value="logname")Integer id,@RequestParam(value="logpass")String password,HttpSession httpSession) {
		User user = userService.getUser(id);
		System.out.println(user);
		if(user.getPassword().equals(password)) {
			user.setPassword(null);
			httpSession.setAttribute("user", user);
			return "redirect:/goindex";
		}
		return "login";
	}
	@RequestMapping("/downlogin")
	public String downlogin(HttpSession httpSession) {
		httpSession.removeAttribute("user");
		return "login";
	}
	@ResponseBody
	@RequestMapping("/usercount")
	public Integer usercount(@RequestParam(value="id")String strid) {
		Integer id = Integer.parseInt(strid);
		System.out.println(userService.countUser(id));
		return userService.countUser(id);
	}
	
	@RequestMapping("/userRegister")
	public String userRegister(User user,HttpServletResponse response) throws IOException {
		Boolean flag = userService.addUser(user);
		System.out.println(user);
		if(flag) {
			response.getWriter().print("<script>alert('注册成功')</script>");
			return "redirect:/gologin";
		}else {
			response.getWriter().print("<script>alert('注册失败')</script>");
			return "redirect:/goregister";
		}
	}
}
