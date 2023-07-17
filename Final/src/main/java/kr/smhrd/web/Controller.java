package kr.smhrd.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
	public String join(Model model, User dto) {
		int join = mapper.join(dto);
		String nextView = null;
		if (join > 0) {
			String successMessage = "회원가입에 성공하였습니다.";
			model.addAttribute("successMessage", successMessage);
		} else {
			String failMessage = "회원가입에 실패하였습니다.";
			model.addAttribute("failMessage", failMessage);
		}
		return "redirect:/";
	}

	// 로그인
	@RequestMapping("/login")
	public String login(User dto, Model model) {
		User user_data = mapper.login(dto);
		String nextView = null;
		if (user_data == null) {
			model.addAttribute("loginFail", "로그인정보를 확인해주세요");
			nextView = "Login_WEB";
		} else {
			model.addAttribute("user_data", user_data);
			nextView = "redirect:/main";
		}
		return nextView;
	}

	// 로그아웃
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/home";
	}
	
	@RequestMapping("/cv")
	public String cv() {
		return "opencv";
	}

}
