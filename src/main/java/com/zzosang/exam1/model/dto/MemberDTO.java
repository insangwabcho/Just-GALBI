package com.zzosang.exam1.model.dto;

public class MemberDTO {
  private String id;
  private String password;
  private String name;
  private int property;

  public MemberDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public MemberDTO(String id, String password, String name, int property) {
    super();
    this.id = id;
    this.password = password;
    this.name = name;
    this.property= property;
  }

  public int getProperty() {
    return property;
  }
  
  public void setProperty(int property) {
    this.property = property;
  }
  
  public String getId() {
    return id;
  }

  public void setId(String id) {
    this.id = id;
  }

  public String getPassword() {
    return password;
  }

  public void setPassword(String password) {
    this.password = password;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

}
