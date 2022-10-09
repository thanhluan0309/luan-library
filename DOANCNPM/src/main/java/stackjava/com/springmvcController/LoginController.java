package stackjava.com.springmvcController;


import java.lang.reflect.Method;
import java.sql.SQLException;
import java.util.List;

import javax.security.auth.login.LoginException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import stackjava.com.Entity.user;
import stackjava.com.Service.LoginImpl;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;

import org.springframework.web.bind.annotation.RequestParam;


import stackjava.com.Service.loginDAOimpl;


@Controller
public class LoginController {
	@Autowired
	LoginImpl loginImpl;
	@Autowired
	loginDAOimpl loginDAOimpl;

	@GetMapping(value = "/login")
	public String getlogin() {
		System.out.print("Check ");
		return "Login";
	}
	@RequestMapping(value = "/doLogin",method = RequestMethod.POST)
	public String checklogin( ModelMap model, @RequestParam("username") String username, @RequestParam("password") String password, HttpSession session) {
//		boolean validate = loginDAOimpl.validateUser(username, password);
//		System.out.print("Check validate"+validate);
//		if(validate == true) {
//			System.out.print("Do Login success");
//			session.setAttribute("username", username);
//			return "redirect:home";
//		}
//		return "Login";
		System.out.print("Do Login success");
		return "redirect:home";
	}
	@GetMapping(value="/register")
	public String getRegister() {
		return "Register";
	}
	@PostMapping(value = "/doRegister")
	public String checkRegister( @RequestParam("username") String username, @RequestParam("password") String password) {
		if(username != null && password !=null) {
			loginDAOimpl.userRegistration(username, password);
			return "Login";
		}
		return "Register";
	}
	@RequestMapping("/logout")
	public String logOut() {
		try {
			loginDAOimpl.logout();
		} catch (LoginException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "Login";
	}

}
