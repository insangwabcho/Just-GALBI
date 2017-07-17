package com.zzosang.exam1.model.dao;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.zzosang.exam1.model.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
  
  @Inject
  private SqlSession sqlSession;
  
  @Override
  public int joinMember(MemberDTO dto){
    return sqlSession.insert("memb.join",dto);
  }
  
  @Override
  public boolean checkpw(String id, String password) {
    Map<String,String> map= new HashMap<>();
    map.put("id", id);
    map.put("password", password);
    if ((int)sqlSession.selectOne("memb.checkpw", map)== 1){
      return true;
    } else {
      return false;
    }
  }
  
  @Override
  public MemberDTO login(String id) {
    return sqlSession.selectOne("memb.login",id);
  }
  
}
