package com.zzosang.exam1.service;

import com.zzosang.exam1.model.dto.MemberDTO;

public interface MemberService {

  public int joinMember(MemberDTO dto);
  public MemberDTO login(String id);
  public boolean checkpw(String id, String password);
  
}
