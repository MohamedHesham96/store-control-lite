package com.blue.soft.store.DAO;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import com.blue.soft.store.entity.BillReturn;

public interface BillReturnRepository extends CrudRepository<BillReturn, String> {

	public BillReturn findTopByOrderByIdDesc();

	public List<BillReturn> findByIdContainingOrderByIdDesc(String billId);

	public List<BillReturn> findAllByOrderByIdDesc();

	public BillReturn findByUpdateNowTrue();

	@Query("SELECT COUNT(br) FROM BillReturn br where date = CURRENT_DATE")
	public Integer getReturnBillCountToday();

}