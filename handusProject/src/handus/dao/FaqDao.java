package handus.dao;

import java.util.List;

import handus.model.FAQ;

public interface FaqDao {

	public int insertFaq(FAQ faq);
	public int deleteFaq(int faq_idNum);
	public int updateFaq(FAQ faq);
	public FAQ selectFaq(int faq_idNum);
	public List<FAQ> selectAll();
}
