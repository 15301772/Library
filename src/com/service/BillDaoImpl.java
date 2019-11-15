package com.service;

import com.mapper.BookMapper;
import com.pojo.Bill;
import com.pojo.Borrow;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service
public class BillDaoImpl implements BillDao {
    @Autowired
    BookMapper bookMapper;

    @Override
    public List<Bill> selectBillList(Bill bill) {
        return bookMapper.selectBillList(bill);
    }

    @Override
    public List<Bill> selectBill2(Bill bill) { return bookMapper.selectBill2(bill); }

    @Override
    public Bill selectById(Integer id) { return bookMapper.selectById(id); }

    @Override
    public void insertBook(Bill bill) { bookMapper.insertBook(bill); }

    @Override
    public void insertBorrow(Borrow borrow) { bookMapper.insertBorrow(borrow);}

    @Override
    public void updatePress(Bill bill) { bookMapper.updatePress(bill);}

    @Override
    public void deleteBook(Integer id) { bookMapper.deleteBook(id); }

    @Override
    public void updateBook(Bill bill) { bookMapper.updateBook(bill);}
}
