package CharityDonation.Service;

import org.springframework.stereotype.Service;

import CharityDonation.Dto.PaginationDto;

@Service
public interface IPaginationService {
	public PaginationDto getDataPagination(int totalData, int currentPage, int pageSize);
}
