package com.service;

import com.pojo.Bill;
import com.pojo.Borrow;

import java.util.List;

public interface BillDao {
    public List<Bill> selectBillList(Bill bill);
    public List<Bill> selectBill2(Bill bill);
    public Bill selectById(Integer id);
    public void insertBook(Bill bill);
    public void insertBorrow(Borrow borrow);
    public void updatePress(Bill bill);
    public void deleteBook(Integer id);
    public void updateBook(Bill bill);
}
