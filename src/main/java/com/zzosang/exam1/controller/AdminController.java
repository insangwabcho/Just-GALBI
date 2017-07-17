package com.zzosang.exam1.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.zzosang.exam1.model.dto.OrderListDTO;
import com.zzosang.exam1.service.OrderListService;

@Controller
@RequestMapping("admin/*")
public class AdminController {
  
  @Inject
  OrderListService orderlistService;

  @RequestMapping("adminpage.do")
  public void adminpage() {
  }

  @RequestMapping("faq.do")
  public void adminfaq() {
  }

  @RequestMapping("home.do")
  public void adminhome() {
  }

  @RequestMapping("introduce.do")
  public void adminintroduce() {
  }

  @RequestMapping("order.do")
  public ModelAndView adminorder(ModelAndView mav, HttpServletRequest request) {
    if (request.getParameter("num")!= null){
      mav.addObject("detail", orderlistService.getDetail(Integer.parseInt(request.getParameter("num"))));
    }
    List<OrderListDTO> dto= orderlistService.getOrderList();
    System.out.println(dto.toString());
    mav.addObject("items", dto);
    mav.setViewName("admin/order");
    return mav;
  }

  @RequestMapping("questions.do")
  public void adminquestions() {
  }
  
  @RequestMapping("modifyList.do")
  public ModelAndView modifyList(@ModelAttribute OrderListDTO dto, ModelAndView mav){
    String path= "/Users/insang/OneDrive/workspace/Spring/ZZoExam/src/main/webapp/resources/image/uploads/";
    String filename= "noImg.png";
    if (!dto.getFile1().isEmpty()){
      filename= System.currentTimeMillis()+"_"+dto.getFile1().getOriginalFilename();
      File f= new File(path);
      if (!f.exists()){
        f.mkdirs();
      }
      try {
        dto.getFile1().transferTo(new File(path+filename));
      } catch (Exception e) {
        e.printStackTrace();
      }
      dto.setImg_url(filename);
    } else {
      OrderListDTO dto2= orderlistService.getDetail(dto.getNum());
      dto.setImg_url(dto2.getImg_url());
    }
    orderlistService.modList(dto);
    mav.addObject("result","success");
    mav.setViewName("admin/result");
    return mav;
  }
  
  @RequestMapping("deleteList.do")
  public ModelAndView deleteList(@RequestParam String num, ModelAndView mav){
    String filename= orderlistService.getDetail(Integer.parseInt(num)).getImg_url();
    if (filename != null){
      String path= "/Users/insang/OneDrive/workspace/Spring/ZZoExam/src/main/webapp/resources/image/uploads/";
      File f= new File(path+filename);
      if (f.exists()){
        f.delete();
      }
    }
    orderlistService.delList(Integer.parseInt(num));
    mav.addObject("result","success");
    mav.setViewName("admin/result");
    return mav;
  }
  
  @RequestMapping("addList.do")
  public ModelAndView addList(@ModelAttribute OrderListDTO dto, ModelAndView mav){
    String filename="noImg.png";
    String path= "/Users/insang/OneDrive/workspace/Spring/ZZoExam/src/main/webapp/resources/image/uploads/";
    if (!dto.getFile1().isEmpty()){
      filename= System.currentTimeMillis()+"_"+dto.getFile1().getOriginalFilename();
      File f= new File(path);
      if (!f.exists()){
        f.mkdir();
      }
      try {
        dto.getFile1().transferTo(new File(path+filename));
      } catch (IllegalStateException | IOException e) {
        e.printStackTrace();
      }
    }
    dto.setImg_url(filename);
    orderlistService.addList(dto);
    mav.addObject("result","success");
    mav.setViewName("admin/result");
    return mav;
  }

}
