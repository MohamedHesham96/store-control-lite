package com.blue.soft.store.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blue.soft.store.DAO.BillBuyItemsRepository;
import com.blue.soft.store.entity.BillBuyItem;

@Service
public class BillBuyItemsService {

	@Autowired
	BillBuyItemsRepository billBuyItemsRepository;

	public void addBillBuyItem(BillBuyItem billBuyItem) {

		billBuyItemsRepository.save(billBuyItem);

	}

	public void deleteBillBuyItem(String billBuyItemId) {

		billBuyItemsRepository.deleteById(billBuyItemId);

	}

	public BillBuyItem getBillBuyItem(String billBuyItemId) {

		return billBuyItemsRepository.findById(billBuyItemId).get();

	}

	public Float getTotalBuysByDate(String dateFrom, String dateTo) {

		Float totalBuys = billBuyItemsRepository.getTotalBuysByDate(dateFrom, dateTo);

		return totalBuys != null ? totalBuys : 0;
	}

}
