package handus.faq.service;

import java.util.List;

import handus.model.FAQ;

public interface FaqService {
	public boolean writeFaq(FAQ faq);
	public boolean modifyFaq(FAQ faq);
	public boolean removeFaq(int faq_idNum);
	public FAQ getFaq(int faq_idNum);
	public List<FAQ> getAllFaq();
}
