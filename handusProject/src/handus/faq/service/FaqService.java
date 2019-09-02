package handus.faq.service;

import java.util.List;

import handus.model.FAQ;

public interface FaqService {
	public boolean writeFaq(FAQ faq);
	public boolean modifyFaq(FAQ faq);
	public boolean removeFaq(int idNum);
	public FAQ getFaq(int idNum);
	public List<FAQ> getAllFaq();
	public List<FAQ> getListByFaq(int category);
}
