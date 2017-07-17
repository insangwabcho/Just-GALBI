package com.zzosang.exam1.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.zzosang.exam1.model.dto.CartDTO;
import com.zzosang.exam1.model.dto.OrderListDTO;

public interface OrderListService {
  public List<OrderListDTO> getOrderList();
  public OrderListDTO getDetail(int num);
  public void addCart(CartDTO dto);
  public void delCart(int cart_id);
  public void modCart(int cart_id, int amount);
  public List<CartDTO> listCart(HttpSession session);
  public int sumMoney(HttpSession session);
  public void addList(OrderListDTO dto);
  public void modList(OrderListDTO dto);
  public void delList(int num);
}
