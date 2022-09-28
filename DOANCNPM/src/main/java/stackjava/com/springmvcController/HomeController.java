package stackjava.com.springmvcController;

import java.awt.PageAttributes.MediaType;
import java.lang.ProcessBuilder.Redirect;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import stackjava.com.DAO.roomdao;
import stackjava.com.DAO.userdao;
import stackjava.com.Entity.message;
import stackjava.com.Entity.participants;
import stackjava.com.Entity.room;
import stackjava.com.Entity.user;
import stackjava.com.Service.LoginImpl;
import stackjava.com.Service.messageImpl;
import stackjava.com.Service.participantsImpl;
import stackjava.com.Service.roomImpl;



@Controller
public class HomeController {

	
	
	@Autowired
	LoginImpl loginImpl;
	
	@Autowired
	participantsImpl partImpl;
	
	@Autowired
	roomImpl roomimpl;
	
	@Autowired
	messageImpl messimpl;
	
	@RequestMapping(value = "/index", method = RequestMethod.GET)
	public String index() {
		return "index";
	}
	
	@RequestMapping(value = "/home")
	public String home(HttpServletRequest request,ModelMap model) {
	
		List<user> list = loginImpl.getDataUser(); 
		model.addAttribute("listuser",loginImpl.getDataUser());
		return "home";
	}
	
	@RequestMapping(value ="/home",method = RequestMethod.POST)
	public String checkAndCreateRoom(HttpServletRequest request,Model model) throws SQLException {
		int UserIdPart =Integer.parseInt(request.getParameter("UserIdPart"));
		int UserId =Integer.parseInt(request.getParameter("UserIdx"));
		
		String usernamePart = request.getParameter("usernamePart");
		String usernameLogin = request.getParameter("usernameLogin");
		
		System.out.print("Useridpart"+UserIdPart+"userid"+UserId);
		model.addAttribute("listuser",loginImpl.getDataUser());
		if(partImpl.checKPariticipants_BY_userID_userIdpart(UserId, UserIdPart)==true) {
			System.out.print("Da co"+UserId+","+UserIdPart);
			model.addAttribute("thongbao", "co");
			participants pget = partImpl.getParticipantsBy_UserId_userParts(UserId, UserIdPart);
			
			message mget = messimpl.getmeMessageBy_userId_RoomId(UserId, pget.getRoomId());
			model.addAttribute("chat",mget);
			
		}else
		{	
			room rset = new room();
			rset.setName(usernameLogin+"-"+usernamePart);
			room rget = roomimpl.createRoom(rset);
			model.addAttribute("roomid", rget.getId());
			
			participants pset = new participants();
			pset.setRoomId(rget.getId());
			pset.setUserId(UserId);
			pset.setUserId_part(UserIdPart);
			participants pget = partImpl.createParticipantsBy_RoomId_UserId_userParts(pset);
			
			message mset = new message();
			mset.setUserId(UserId);
			mset.setRoomId(rget.getId());
			message mget=messimpl.createMessage(mset);
			
			model.addAttribute("chat",mget);
		}
		return "home";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	@RequestMapping(value = "/edit",method=RequestMethod.GET)
	public String edit(ModelMap model, HttpServletRequest request) {
		model.addAttribute("user",new user());
		return "student";
	}
	@RequestMapping(value = "/edit",method = RequestMethod.POST)
	public String addedit(@ModelAttribute("user")user user,ModelMap model, HttpServletRequest request) {
		model.addAttribute("user",user);
		return "student";
	}

}
