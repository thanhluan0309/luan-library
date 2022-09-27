package stackjava.com.springmvcController;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import stackjava.com.DAO.userdao;
import stackjava.com.Entity.user;
import stackjava.com.Service.LoginImpl;

@Controller
public class LoginController {
	@Autowired
	LoginImpl loginImpl;
	
	@RequestMapping(value="/login")
	public String Login(ModelMap model,HttpServletRequest request) throws SQLException {
		List<user> list = loginImpl.getDataUser();
		System.out.print("list"+list);
		model.addAttribute("item",loginImpl.getDataUser());
		String submit = request.getParameter("submit");
		System.out.print("submit "+ submit);
		if(submit == null) {
			return "Login";
		}
		return "home";
	}
}
