package handus.dao;

import handus.model.ReviewStudio;

public interface ReviewDao {
	public int insertRS(ReviewStudio review);
	public int updateRS(ReviewStudio review);
	public int deleteRS(int num);
	public ReviewStudio selectAllRS();
}
