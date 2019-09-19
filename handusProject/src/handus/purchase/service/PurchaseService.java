package handus.purchase.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import handus.dao.PurchaseDao;

@Service
public class PurchaseService {
	@Autowired
	private PurchaseDao purchaseDao;
	
	
}
