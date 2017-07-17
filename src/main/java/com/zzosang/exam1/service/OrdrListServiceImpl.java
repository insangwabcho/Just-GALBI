package com.zzosang.exam1.service;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.zzosang.exam1.model.dao.OrderListDAO;
import com.zzosang.exam1.model.dto.CartDTO;
import com.zzosang.exam1.model.dto.OrderListDTO;

@Service
public class OrdrListServiceImpl implements OrderListService {

  @Inject
  OrderListDAO orderlistDao;
  
  @Override
  public List<OrderListDTO> getOrderList() {
    return orderlistDao.getOrderList();
  }
  
  @Override
  public OrderListDTO getDetail(int num) {
    return orderlistDao.getDetail(num);
  }
  
  @Override
  public void addCart(CartDTO dto) {
    orderlistDao.addCart(dto);
  }
  
  @Override
  public void delCart(int cart_id) {
    orderlistDao.delCart(cart_id);
  }
  
  @Override
  public void modCart(int cart_id, int amount) {
    orderlistDao.modCart(cart_id, amount);
  }
  
  @Override
  public List<CartDTO> listCart(HttpSession session) {
    return orderlistDao.listCart(session);
  }
  
  @Override
  public int sumMoney(HttpSession session) {
    return orderlistDao.sumMoney(session);
  }
  
  @Override
  public void addList(OrderListDTO dto) {
    orderlistDao.addList(dto);
  }
  
  @Override
  public void modList(OrderListDTO dto) {
    orderlistDao.modList(dto);
  }
  
  @Override
  public void delList(int num) {
    orderlistDao.delList(num);
  }
  
}
