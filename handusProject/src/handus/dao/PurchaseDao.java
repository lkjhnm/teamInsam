package handus.dao;

import java.util.Date;
import java.util.List;
import java.util.Map;

import handus.model.TotalOrder;

public interface PurchaseDao {
	public String selectTONumber();
	public int insertTotalOrder(TotalOrder to);
	public int deleteTotalOrder(int to_pk);
	public TotalOrder getTObyNum(int to_pk);
	public Map<String, Object> getTObyOrderNum(String orderNum);
	// 멤버별로 주문한 테이블 확인 리스트 
	public List<TotalOrder> getAllTOList(int m_pk);
	// 주문번호로 Order 불러오기
	public List<TotalOrder> getListByOrderNum(int orderNum);
	
	public int getStudioPurchase(int sNum, int mNum);
	public int getItemPurchase(int iNum, int mNum);
	
	// 각각의 주문 입력하기 
	public int insertItemOrder(Map<String, Object> product);
	public int insertAuctionOrder(Map<String, Object> product);
	public int insertStudioOrder(Map<String, Object> product);
	
}
