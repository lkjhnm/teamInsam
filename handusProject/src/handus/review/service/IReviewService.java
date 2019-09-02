package handus.review.service;

import java.util.List;

import handus.model.HeartStudio;
import handus.model.ReviewStudio;

public interface IReviewService {
	public boolean writeReviewStudio(ReviewStudio review);
	public boolean modifyReviewStudio(ReviewStudio review);
	public boolean removeReviewStudio(int num);
	public List<ReviewStudio> getAllRS();
}
