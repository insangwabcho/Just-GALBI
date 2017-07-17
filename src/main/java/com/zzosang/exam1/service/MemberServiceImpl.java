package com.zzosang.exam1.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.zzosang.exam1.model.dao.MemberDAO;
import com.zzosang.exam1.model.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService{

  @Inject
  MemberDAO memberDao;
  
  @Override
  public int joinMember(MemberDTO dto){
    return memberDao.joinMember(dto);
  }
  
  @Override
  public MemberDTO login(String id) {
    return memberDao.login(id);
  }
  
  @Override
  public boolean checkpw(String id, String password) {
    return memberDao.checkpw(id, password);
  }
}
