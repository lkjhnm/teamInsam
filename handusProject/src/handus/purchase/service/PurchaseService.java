package handus.purchase.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import handus.dao.PurchaseDao;
import handus.model.TotalOrder;

@Service
public class PurchaseService {
	@Autowired
	private PurchaseDao purchaseDao;
	
	private boolean writeTotalOrder(Map<String, Object> info, Map<String, Object> pMap) {
		TotalOrder order = new TotalOrder();
		order.setTo_num((String)info.get("partner_order_id"));
		order.setTo_m_pk(Integer.parseInt((String)info.get("partner_user_id")));
		order.setTo_p_pk((int)pMap.get("pNum"));
		order.setTo_type((int)pMap.get("pType"));
		order.setTo_price((int)info.get("totalPrice"));
		order.setTo_pay_method((String)info.get("payment_method_type"));
		order.setTo_order_name((String)info.get("item_name"));
		order.setTo_tid((String)info.get("tid"));
		order.setTo_approved_date((Date)info.get("approved_at"));
		order.setTo_count((int)info.get("quantity"));
		
		System.out.println("서비스 Order: "+order);
		
		if(purchaseDao.insertTotalOrder(order)>0) {
			return true;
		}
		return false;
	}
	
	private boolean writeProductOrder(Map<String, Object> pMap, int mNum) {
		int pType = (int)pMap.get("pType");
		boolean result = false;
		Map<String, Object> product = new HashMap<String, Object>();
		switch (pType) {
		case 1:
			product.put("I_PK", (int)pMap.get("pNum"));
			product.put("M_PK_USER", mNum);
			product.put("IO_AMOUNT", (int)pMap.get("pCount"));
			product.put("IO_PRICE", (int)pMap.get("pPrice"));
			if(purchaseDao.insertItemOrder(product)>0) result = true;
			break;
		case 2:
			
			if(purchaseDao.insertAuctionOrder(product)>0) result = true;
			break;
		case 3:
			product.put("S_PK", (int)pMap.get("pNum"));
			product.put("M_PK_USER", mNum);
			product.put("SO_AMOUNT", (int)pMap.get("pCount"));
			product.put("SO_PRICE", (int)pMap.get("pPrice"));
			if(purchaseDao.insertStudioOrder(product)>0) result = true;
			break;
		}
		return result;
	}
	
	@Transactional
	public boolean writeOrders(Map<String, Object> info, Map<String, Object> pMap, int mNum) {
		if(writeTotalOrder(info, pMap) && writeProductOrder(pMap, mNum)) {
			return true;
		};
		return false;
	}
	
	
	public boolean removeTotalOrder(int to_pk) {
		if(purchaseDao.deleteTotalOrder(to_pk)>0) {
			return true;
		}
		return false;
	}
	public TotalOrder getTotalOrder(int to_pk) {
		return purchaseDao.getTObyNum(to_pk);
	}
	
	
	public List<TotalOrder> getTotalListByMember(int mNum){
		return purchaseDao.getAllTOList(mNum);
	}
	public String getOrderNum() {
		return purchaseDao.selectTONumber();
	}
	public List<TotalOrder> getListByOrderNum(int orderNum){
		return purchaseDao.getListByOrderNum(orderNum);
	}
	public Map<String, Object> getOrderDetail(String orderNum){
		Map<String, Object> order = purchaseDao.getTObyOrderNum(orderNum);
		SimpleDateFormat format = new SimpleDateFormat("yyyy년 MM월 dd일 E요일  HH시mm분");
		String orderDate = format.format((Date)order.get("ORDER_DATE"));
		String approveDate = format.format((Date)order.get("APPROVE_DATE"));
		order.put("ORDER_DATE", orderDate);
		order.put("APPROVE_DATE", approveDate);
		return order;
	}
	
	
	public boolean getStudioPurchase(int sNum, int mNum) {
		if(purchaseDao.getStudioPurchase(sNum, mNum)>0) {
			return true;
		}
		return false;
	}
	public boolean getItemPurchase(int iNum, int mNum) {
		System.out.println("서비스: "+purchaseDao.getStudioPurchase(iNum, mNum));
		if(purchaseDao.getItemPurchase(iNum, mNum)>0) {
			return true;
		}
		return false;
	}
	
}
