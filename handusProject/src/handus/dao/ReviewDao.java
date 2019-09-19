package handus.dao;

import java.util.List;

import handus.model.ReviewItem;
import handus.model.ReviewStudio;

public interface ReviewDao {
	public int insertRS(ReviewStudio review);
	public int updateRS(ReviewStudio review);
	public int deleteRS(int num);
	public List<ReviewStudio> selectAllRS();
	public int selectRScount(int num);
	
	public int insertRI(ReviewItem review);
	public int updateRI(ReviewItem review);
	public int deleteRI(int num);
	public List<ReviewItem> selectAllRI();
	public int selectRIcount(int num);
	
}
