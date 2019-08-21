package handus.faq.dao;

import java.util.List;

import handus.faq.model.FAQ;

public interface FaqDao {

	public int insertFaq(FAQ faq);
	public int deleteFaq(int idNum);
	public int updateFaq(FAQ faq);
	public FAQ selectFaq(int idNum);
	public List<FAQ> selectAll();
	
}
