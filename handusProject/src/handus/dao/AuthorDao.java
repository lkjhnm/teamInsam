package handus.dao;

import org.apache.ibatis.annotations.Param;

import handus.model.Auction;
import handus.model.HandusImgList;
import handus.model.Item;
import handus.model.Studio;

public interface AuthorDao {

	public boolean insertAuction(Auction auction);
	public boolean insertStudio(Studio studio);
	public boolean insertItem(Item item);
	public boolean insertImage(@Param("type") String type, @Param("imgList") HandusImgList imgList);
}
