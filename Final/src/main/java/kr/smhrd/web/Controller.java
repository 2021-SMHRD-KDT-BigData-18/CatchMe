package kr.smhrd.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.smhrd.entity.User;
import kr.smhrd.mapper.Mapper;

@org.springframework.stereotype.Controller
public class Controller {
	@Autowired
	private Mapper mapper;
	@RequestMapping("/")
	public String Loginpage() {
		return "Login_WEB";
	}
	
	@RequestMapping("/regi")
	public String Registerpage() {
		return "Regi_WEB";
	}

	@RequestMapping("/main")
	public String Mainpage() {
		return "Main_WEB";
	}
	 
	@RequestMapping("/reco")
	public String Recordpage() {
		return "DriveRecord_WEB";
	}
	// 쉼터알려주기 테스트용
	@RequestMapping("/location")
	public String getLocation() {
		return "location";
	}
	// 회원가입
		@RequestMapping("/join")
		public String join(User dto) {
			String join = mapper.join(dto);
			 if (join != null) {
			        return "home";
			    } else {
			        return "home"; // 실패하면 어디로 가쥐 
			    }
		}
		
		// 로그인
		@RequestMapping("/login")
		public String login(User dto,Model model) {
			String user_data = mapper.login(dto);
			if(user_data==null) {
				return "home";
			}else {
				model.addAttribute("user_data",user_data);
				return "redirect:/main";
			}
		}
		
		// 로그아웃
		@RequestMapping("/logout")
		public String logout(HttpSession session) {
		    session.invalidate();
		    return "redirect:/home";
		}

}
