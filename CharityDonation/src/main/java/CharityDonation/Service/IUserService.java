package CharityDonation.Service;

import java.util.List;

import org.springframework.stereotype.Service;

import CharityDonation.Entity.Account;
import CharityDonation.Entity.Categories;
import CharityDonation.Entity.Donation;
import CharityDonation.Entity.Foundation;
import CharityDonation.Entity.Fund;

@Service
public interface IUserService {
	public List<Foundation> getDataFoundationActive();

	public List<Foundation> getDataFoundationPaginationActive(int start, int end);
	
	public List<Fund> getDataFundByFoundationActive(int foundationId) ;
	
	public List<Categories> getDataCategoriesActive();
	
	public List<Categories> getDataCategoriesPaginationActive(int start, int end);
	
	public List<Fund> getDataFundActive();
	
	public List<Fund> getDataFundsPaginationActive(int start, int end);
	
	public List<Fund> getDataFundByCategoriesActive(int categoryId) ;
	
	public Integer getCurrentMoneyByFund(int fundId) ;
	
	public void createDonation(Donation donation, int accountId, int fundId);
	
	public List<Donation> searchDonationByAccount(String accountName);
	
	public void updateUser(Account user);
	
	public List<Fund> userSearchFunds(String fundName, int categoryId, int foundationId);
	
	public List<Fund> userSearchFundsPagination(String fundName, int categoryId, int foundationId, int start, int end);
}
