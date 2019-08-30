package handus.review.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.ReviewDao;
import handus.model.ReviewStudio;

@Service
public class ReviewService {
	@Autowired
	private ReviewDao reviewDao;

	public boolean writeReviewStudio(ReviewStudio review) {
		if(reviewDao.insertRS(review)>0) {
			return true;
		}
		return false;
	}

	public boolean modifyReviewStudio(ReviewStudio review) {
		if(reviewDao.updateRS(review)>0) {
			return true;
		}
		return false;
	}

	public boolean removeReviewStudio(int num) {
		if(reviewDao.deleteRS(num)>0) {
			return true;
		}
		return false;
	}

	public List<ReviewStudio> getAllRS() {
		return reviewDao.selectAllRS();
	}
	
	
}
