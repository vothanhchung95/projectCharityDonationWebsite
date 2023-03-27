package CharityDonation.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import CharityDonation.Dao.AccountDAO;
import CharityDonation.Dao.CategoriesDAO;
import CharityDonation.Dao.DonationDAO;
import CharityDonation.Dao.FoundationDAO;
import CharityDonation.Dao.FundDao;
import CharityDonation.Entity.Account;
import CharityDonation.Entity.Categories;
import CharityDonation.Entity.Donation;
import CharityDonation.Entity.Foundation;
import CharityDonation.Entity.Fund;

@Service
public class UserService implements IUserService {
	@Autowired
	FoundationDAO foundationDAO;
	@Autowired
	CategoriesDAO categoriesDAO;
	@Autowired
	FundDao fundDao;
	@Autowired
	DonationDAO donationDAO;
	@Autowired
	AccountDAO accountDAO;

	@Override
	public List<Foundation> getDataFoundationActive() {
		return foundationDAO.getDataFoundationActive();
	}

	@Override
	public List<Foundation> getDataFoundationPaginationActive(int start, int end) {
		return foundationDAO.getDataFoundationPaginationActive(start, end);
	}

	@Override
	public List<Fund> getDataFundByFoundationActive(int foundationId) {
		return fundDao.getDataFundByFoundationActive(foundationId);
	}

	@Override
	public List<Categories> getDataCategoriesActive() {
		return categoriesDAO.getDataCategoriesActive();
	}

	@Override
	public List<Categories> getDataCategoriesPaginationActive(int start, int end) {
		return categoriesDAO.getDataCategoriesPaginationActive(start, end);
	}

	@Override
	public List<Fund> getDataFundActive() {
		return fundDao.getDataFundActive();
	}

	@Override
	public List<Fund> getDataFundsPaginationActive(int start, int end) {
		return fundDao.getDataFundsPaginationActive(start, end);
	}

	@Override
	public List<Fund> getDataFundByCategoriesActive(int categoryId) {
		return fundDao.getDataFundByCategoriesActive(categoryId);
	}

	@Override
	public Integer getCurrentMoneyByFund(int fundId) {
		return donationDAO.getCurrentMoneyByFund(fundId);
	}

	@Override
	public void createDonation(Donation donation, int accountId, int fundId) {
		donationDAO.createDonation(donation, accountId, fundId);
	}

	@Override
	public List<Donation> searchDonationByAccount(String accountName) {
		return donationDAO.searchDonationByAccount(accountName);
	}

	@Override
	public void updateUser(Account user) {
		accountDAO.updateUser(user);
	}

	@Override
	public List<Fund> userSearchFunds(String fundName, int categoryId, int foundationId) {
		return fundDao.userSearchFunds(fundName, categoryId, foundationId);
	}

	@Override
	public List<Fund> userSearchFundsPagination(String fundName, int categoryId, int foundationId, int start, int end) {
		return fundDao.userSearchFundsPagination(fundName, categoryId, foundationId, start, end);
	}

}
