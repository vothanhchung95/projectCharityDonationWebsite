package CharityDonation.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import CharityDonation.Entity.Account;

@Service
public interface IAccountService {
	@Autowired
	public String newRandomPassword();
	public Account getDataAccountByEmail(String email);
	public void updateAccountPassword(int id, String password);
}
