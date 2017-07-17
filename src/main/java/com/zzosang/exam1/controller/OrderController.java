package com.zzosang.exam1.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zzosang.exam1.model.dto.CartDTO;
import com.zzosang.exam1.service.OrderListService;

@Controller
@RequestMapping("order/*")
public class OrderController {

  @Inject
  OrderListService orderlistService;
  
  @RequestMapping("{idx}")
  public ModelAndView orderDetail(@PathVariable int idx, ModelAndView mav){
    mav.addObject("dto", orderlistService.getDetail(idx));
    mav.setViewName("order_detail");
    return mav;
  }
  
  @RequestMapping("addCart.do")
  public String addCart(@RequestParam int goCart, @RequestParam String num, @ModelAttribute CartDTO dto, HttpSession session){
    String path="";
    if (goCart==1){
      path= "redirect:/#cart";
    } else {
      path= "redirect:/#home";
    }
    orderlistService.addCart(dto);
    if (!num.equals("null")){
      session.setAttribute("pause", num);
      session.setAttribute("addCart", "true");
    }
    return path;
  }
  
  @RequestMapping("delCart.do")
  public ModelAndView delCart(@RequestParam int cart_id, HttpSession session, ModelAndView mav){
    orderlistService.delCart(cart_id);
    List<CartDTO> dto= orderlistService.listCart(session);
    mav.addObject("listCart",dto);
    mav.addObject("sumMoney", orderlistService.sumMoney(session));
    mav.setViewName("cart");
    return mav;
  }
  
  @RequestMapping("modCart.do")
  public ModelAndView modCart(@RequestParam int amount, @RequestParam int cart_id, HttpSession session, ModelAndView mav){
    orderlistService.modCart(cart_id, amount);
    List<CartDTO> dto= orderlistService.listCart(session);
    mav.addObject("listCart",dto);
    mav.addObject("sumMoney", orderlistService.sumMoney(session));
    mav.setViewName("cart");
    return mav;
  }
  
}
