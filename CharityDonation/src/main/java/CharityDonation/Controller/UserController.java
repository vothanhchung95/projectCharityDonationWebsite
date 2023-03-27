package CharityDonation.Controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import CharityDonation.Entity.Account;
import CharityDonation.Entity.Donation;
import CharityDonation.Entity.Fund;
import CharityDonation.Service.AccountServiceImpl;
import CharityDonation.Service.AdminServiceImpl;
import CharityDonation.Service.EmailService;
import CharityDonation.Service.PaginationServiceImpl;
import CharityDonation.Service.UserService;

@Validated
@Controller
public class UserController {
	@Autowired
	AdminServiceImpl adminServiceImpl;
	@Autowired
	PaginationServiceImpl paginationService;
	@Autowired
	AccountServiceImpl accountServiceImpl;
	@Autowired
	EmailService emailService;
	@Autowired
	UserService userService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;
	
	@RequestMapping(value = "/user")
	public ModelAndView user(Authentication authentication) {
		Account user = accountServiceImpl.getDataAccountByEmail(authentication.getName());
		ModelAndView mv = new ModelAndView();
		List<Donation> donations = userService.searchDonationByAccount(user.getUsername());
		mv.addObject("user", user);
		mv.addObject("donations", donations);
		mv.setViewName("user/user");
		return mv;
	}

	@RequestMapping(value = "/user/change_password")
	public ModelAndView changePassword(Authentication authentication) {
		Account user = accountServiceImpl.getDataAccountByEmail(authentication.getName());
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", user);

		mv.setViewName("user/change_password");
		return mv;
	}

	@RequestMapping(value = "/user/updatepassword")
	public String updatePasswordUser(@RequestParam(value = "password") String password,
			@RequestParam(value = "newPassword") String newPassword,@RequestParam(value = "confirmPassword") String confirmPassword,
			Authentication authentication, Model model,
			RedirectAttributes redirectAttributes) {
		Account user = accountServiceImpl.getDataAccountByEmail(authentication.getName());
		if (!passwordEncoder.matches(password, user.getPassword())) {
			model.addAttribute("wrongPassword", "Mật khẩu không đúng");
			redirectAttributes.addFlashAttribute("wrongPassword", "Mật khẩu không đúng");
			return "redirect:change_password";
		}

		if (newPassword.length() < 8) {
			model.addAttribute("invalidPassword", "Mật khẩu có độ dài tối thiểu 8 ký tự");
			redirectAttributes.addFlashAttribute("invalidPassword", "Mật khẩu có độ dài tối thiểu 8 ký tự");
			return "redirect:change_password";
		}
		
		if(!newPassword.equals(confirmPassword) ) {
			model.addAttribute("confirmFail", "Mật khẩu xác nhận không chính xác, vui lòng nhập đúng mật khẩu mới để xác nhận");
			redirectAttributes.addFlashAttribute("confirmFail", "Mật khẩu xác nhận không chính xác, vui lòng nhập đúng mật khẩu mới để xác nhận");
			return "redirect:change_password";
		}
		model.addAttribute("message", "Thay đổi mật khẩu thành công");
		redirectAttributes.addFlashAttribute("message", "Thay đổi mật khẩu thành công");
		String updatepassword = passwordEncoder.encode(newPassword);
		accountServiceImpl.updateAccountPassword(user.getId(), updatepassword);
		return "redirect:/home";
	}

	@RequestMapping(value = "/forget_password")
	public String forgetPassword() {
		return "user/forget_password";
	}

	@RequestMapping(value = "/update_forget_password")
	public String updateForgetPassword(@RequestParam(value = "email") String email, Model model,
			RedirectAttributes redirectAttributes) {
		try {
			Account account = accountServiceImpl.getDataAccountByEmail(email);
			String newPassword = accountServiceImpl.newRandomPassword();

			String subject = "Mật khẩu mới tài khoản: " + account.getEmail();
			String text = "Mật khẩu đăng nhập mới của bạn là: " + newPassword;
			emailService.sendEmail("ff7a8c9a2c-0643d2@inbox.mailtrap.io", subject, text);
			String password = passwordEncoder.encode(newPassword);
			accountServiceImpl.updateAccountPassword(account.getId(), password);
			model.addAttribute("message", "Mật khẩu mới đã được gửi tới email của bạn");
			redirectAttributes.addFlashAttribute("message", "Mật khẩu mới đã được gửi tới email của bạn");
			return "user/login";
		} catch (EmptyResultDataAccessException e) {
			return "redirect:forget_password?error";
		}
	}

	@PostMapping(value = "/user/donation")
	public String createDonation(HttpServletRequest request, @RequestParam(value = "amount") Integer amount,
			@RequestParam(value = "message") String message, @RequestParam(value = "fundId") int id, Model model,
			RedirectAttributes redirectAttributes, Authentication authentication) {
		String referer = request.getHeader("Referer");
		Donation donation = new Donation();
		if(amount == null || amount == 0 ) {
			model.addAttribute("message", "Quyên góp không thành công, số tiền không được để trống và phải lớn hơn 0");
			redirectAttributes.addFlashAttribute("message", "Quyên góp không thành công, số tiền không được để trống và phải lớn hơn 0");
			return "redirect:" + referer;
		}
		donation.setAmount(amount);
		donation.setMessage(message);
		int fundId = id;		
		Fund fund = adminServiceImpl.getDataFundById(fundId);
		if(fund.getStatus().equals("Finish")) {
			model.addAttribute("message", "Quỹ quyên góp đã hoàn thành. Xin cảm ơn các nhà hảo tâm đã đồng hành");
			redirectAttributes.addFlashAttribute("message", "Quỹ quyên góp đã hoàn thành. Xin cảm ơn các nhà hảo tâm đã đồng hành");
			return "redirect:" + referer;
		}
		Account account = accountServiceImpl.getDataAccountByEmail(authentication.getName());
		int accountId = account.getId();
		
		userService.createDonation(donation, accountId, fundId);
		int currentAmount = userService.getCurrentMoneyByFund(fundId);
		if(currentAmount >= fund.getExpectedAmount()) {
			adminServiceImpl.finishFund(fundId);
		}
		model.addAttribute("message", "Cảm ơn bạn đã đồng hành quyên góp cùng chúng tôi cho các hoàn cảnh khó khăn");
		redirectAttributes.addFlashAttribute("message", "Cảm ơn bạn đã đồng hành quyên góp cùng chúng tôi cho các hoàn cảnh khó khăn");
		
		return "redirect:" + referer;
	}
	
	@PostMapping(value = "/user/update_user")
	public String updateUser(@ModelAttribute(value = "user") Account user, BindingResult bindingResult, RedirectAttributes redirectAttributes,
			HttpServletRequest request, Model model, Authentication authentication) {
		String referer = request.getHeader("Referer");
		
		if(user.getUsername().length() < 5) {
			model.addAttribute("error", "Họ và tên có độ dài tối thiểu 5 ký tự");
			redirectAttributes.addFlashAttribute("error", "Họ và tên có độ dài tối thiểu 5 ký tự");
			return "redirect:" + referer;
		}
		Account account = accountServiceImpl.getDataAccountByEmail(authentication.getName());
		account.setUsername(user.getUsername());
		account.setPhone(user.getPhone());
		account.setAddress(user.getAddress());
		userService.updateUser(account);
		return "redirect:" + referer;
	}
}
