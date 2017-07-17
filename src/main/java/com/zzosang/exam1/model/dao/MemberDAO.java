package com.zzosang.exam1.model.dao;

import com.zzosang.exam1.model.dto.MemberDTO;

public interface MemberDAO{
  
  public int joinMember(MemberDTO dto);
  public boolean checkpw(String id, String password);
  public MemberDTO login(String id);

}
