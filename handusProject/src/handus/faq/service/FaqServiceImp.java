package handus.faq.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.faq.dao.FaqDao;
import handus.faq.model.FAQ;

@Service
public class FaqServiceImp implements FaqService{
	
	@Autowired
	private FaqDao dao;
	
	@Override
	public boolean writeFaq(FAQ faq) {
		//입력
		if(dao.insertFaq(faq)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean modifyFaq(FAQ faq) {
		//수정
		if(dao.updateFaq(faq)>0) {
			return true;
		}
		return false;
	}

	@Override
	public boolean removeFaq(int idNum) {
		//삭제
		int rowCount = dao.deleteFaq(idNum);
		if(rowCount>0) {
			return true;
		}
		return false;
	}

	@Override
	public FAQ getFaq(int idNum) {
		//조회
		return dao.selectFaq(idNum);
	}

	@Override
	public List<FAQ> gatAllFaq() {
		//전체 조회
		return dao.selectAll();
	}
	
}
