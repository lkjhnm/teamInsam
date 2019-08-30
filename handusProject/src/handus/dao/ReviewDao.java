package handus.dao;

import java.util.List;

import handus.model.ReviewStudio;

public interface ReviewDao {
	public int insertRS(ReviewStudio review);
	public int updateRS(ReviewStudio review);
	public int deleteRS(int num);
	public List<ReviewStudio> selectAllRS();
	public int selectRScount(int num);
}
