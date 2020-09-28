package com.blue.soft.store.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.blue.soft.store.DAO.BillBuyRepository;
import com.blue.soft.store.entity.BillBuy;

@Service
public class BillBuyService {

	@Autowired
	BillBuyRepository billBuyRepository;

	public void saveBuyBill(BillBuy billBuy) {

		billBuyRepository.save(billBuy);

	}

	public BillBuy getBillBuyById(String id) {

		return (BillBuy) billBuyRepository.findById(id).get();
	}

	public BillBuy getLast() {

		return billBuyRepository.findTopByOrderByIdDesc();
	}

	public void deleteBuyBill(String id) {

		billBuyRepository.deleteById(id);
	}

	public List<BillBuy> getAllBuyBills() {

		return (List<BillBuy>) billBuyRepository.findAllByOrderByIdDesc();
	}

	public List<BillBuy> getBillBuyContainingId(String id) {

		return (List<BillBuy>) billBuyRepository.findByIdContainingOrderByIdDesc(id);
	}

	public BillBuy getBillBuyByUpdateNow() {

		return (BillBuy) billBuyRepository.findByUpdateNowTrue();
	}
}