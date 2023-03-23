package CharityDonation.Service;

import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import CharityDonation.Dao.AccountDAO;
import CharityDonation.Entity.Account;

@Service
public class AccountDetailsService implements UserDetailsService{
	
	private final AccountDAO accountDAO;
	
	public AccountDetailsService(AccountDAO accountDAO) {
		this.accountDAO = accountDAO;
	}
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		Account account = accountDAO.getDataAccountByEmail( username);
		if(account == null || account.getStatus().equals("Inactive")) {
			throw new UsernameNotFoundException("User not found.");
		}
		return new AccountDetails(account);
	}

	
}
