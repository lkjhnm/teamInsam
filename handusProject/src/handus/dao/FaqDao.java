package handus.dao;

import java.util.List;

import handus.model.FAQ;

public interface FaqDao {

	public int insertFaq(FAQ faq);
	public int deleteFaq(int idNum);
	public int updateFaq(FAQ faq);
	public FAQ selectFaq(int idNum);
	public List<FAQ> selectAll();
	public List<FAQ> selectListByFaq(int category);
}
