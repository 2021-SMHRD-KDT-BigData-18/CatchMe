package kr.smhrd.web;

import org.springframework.web.bind.annotation.RequestMapping;

@org.springframework.stereotype.Controller
public class Controller {
	
	@RequestMapping("/")
	public String Loginpage() {
		return "Login_WEB";
	}
	
	@RequestMapping("/info")
	public String Infopage() {
		return "Info_WEB";
	}

	@RequestMapping("/main")
	public String Mainpage() {
		return "Main_WEB";
	}
	 
	@RequestMapping("/reco")
	public String Recordpage() {
		return "DriveRecord_WEB";
	}
}
