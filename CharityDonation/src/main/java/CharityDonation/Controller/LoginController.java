package CharityDonation.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import CharityDonation.Entity.Account;
import CharityDonation.Service.AccountServiceImpl;

@Controller
public class LoginController {
	@Autowired
	AccountServiceImpl accountServiceImpl;
	AuthenticationManager authenticationManager;
	
	
	@GetMapping(value = "/login")
	public ModelAndView showLogin() {
		ModelAndView mv = new ModelAndView();
		Account account = new Account();
		mv.addObject("account", account);
		mv.setViewName("user/login");
		return mv;
	}
	

	

}
