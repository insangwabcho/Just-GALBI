package com.zzosang.exam1.controller;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.zzosang.exam1.model.dto.CartDTO;
import com.zzosang.exam1.model.dto.OrderListDTO;
import com.zzosang.exam1.service.MemberService;
import com.zzosang.exam1.service.OrderListService;

@Controller
public class MainController {
  
  @Inject
  MemberService memberService;
  @Inject
  OrderListService orderlistService;
  
  @RequestMapping(value="/", method=RequestMethod.GET)
  public String main(){
    return "main";
  }
  
  @RequestMapping("faq.do")
  public void faq(){}
  
  @RequestMapping("introduce.do")
  public void introduce(){}
  
  @RequestMapping("questions.do")
  public void questions(){}
  
  @RequestMapping("order.do")
  public String order(Model model){
    List<OrderListDTO> items= orderlistService.getOrderList();
    model.addAttribute("items",items);
    return "order";
  }
  
  @RequestMapping("main.do")
  public String mainsss(){
    return "redirect:/";
  }
  
  @RequestMapping("login.do")
  public void login(){}
  
  @RequestMapping("home.do")
  public void home(){}
  
  @RequestMapping("join.do")
  public void join(){}
  
  @RequestMapping("test.do")
  public void test(){}
  
  @RequestMapping("cart.do")
  public ModelAndView cart(HttpSession session, ModelAndView mav){
    List<CartDTO> dto= orderlistService.listCart(session);
    mav.addObject("listCart",dto);
    mav.addObject("sumMoney", orderlistService.sumMoney(session));
    mav.setViewName("cart");
    return mav;
  }
}
