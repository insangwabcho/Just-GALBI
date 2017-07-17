package com.zzosang.exam1.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.zzosang.exam1.model.dto.MemberDTO;
import com.zzosang.exam1.service.MemberService;

@Controller
@RequestMapping("member/*")
public class MemberController {

  @Inject
  MemberService memberService;
  
  @RequestMapping("newmember.do")
  public String joinMember(@ModelAttribute MemberDTO dto, Model model){
    if (memberService.joinMember(dto)== 1){
      model.addAttribute("result","success");
    } else {
      model.addAttribute("dto",dto);
      model.addAttribute("result","fail");
    }
    return "join";
  }
  
  @RequestMapping("login.do")
  public String loginMember(@RequestParam String num,
      @RequestParam String id, @RequestParam String password, HttpSession session, Model model){
    
    if (memberService.checkpw(id,password)){
      session.setAttribute("dto",memberService.login(id));
      if (!num.equals("null")){
        session.setAttribute("pause", num);
      }
      return "redirect:/";
    } else {
      model.addAttribute("msg","error");
      return "login";
    }
  }
  
  @RequestMapping("logout.do")
  public String logoutMember(HttpSession session){
    session.removeAttribute("dto");
    return "redirect:/";
  }
  
}
