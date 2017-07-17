package com.zzosang.exam1.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.zzosang.exam1.model.dto.CartDTO;
import com.zzosang.exam1.model.dto.MemberDTO;
import com.zzosang.exam1.model.dto.OrderListDTO;

@Repository
public class OrderListDAOImpl implements OrderListDAO{

  @Inject
  SqlSession sqlSession;
  
  @Override
  public List<OrderListDTO> getOrderList() {
    return sqlSession.selectList("orderList.getList");
  }
  
  @Override
  public OrderListDTO getDetail(int num) {
    return sqlSession.selectOne("orderList.getDetail", num);
  }
  
  @Override
  public void addCart(CartDTO dto) {
    sqlSession.insert("orderList.addCart", dto);
  }
  
  @Override
  public void delCart(int cart_id) {
    sqlSession.delete("orderList.delCart", cart_id);
  }
  
  @Override
  public void modCart(int cart_id, int amount) {
    Map<String,Integer> map= new HashMap<>();
    map.put("cart_id", cart_id);
    map.put("amount", amount);
    sqlSession.update("orderList.modCart", map);
  }
  
  @Override
  public List<CartDTO> listCart(HttpSession session) {
    MemberDTO dto= (MemberDTO)session.getAttribute("dto");
    String userid= dto.getId();
    return sqlSession.selectList("orderList.listCart", userid);
  }
  
  @Override
  public int sumMoney(HttpSession session) {
    MemberDTO dto= (MemberDTO)session.getAttribute("dto");
    String userid= dto.getId();
    return sqlSession.selectOne("orderList.sumMoney", userid);
  }
  
  @Override
  public void addList(OrderListDTO dto) {
    sqlSession.insert("orderList.addList", dto);
  }
  
  @Override
  public void modList(OrderListDTO dto) {
    sqlSession.update("orderList.modList", dto);
  }
  
  @Override
  public void delList(int num) {
    sqlSession.delete("orderList.delList", num);
  }
  
}
