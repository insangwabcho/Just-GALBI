package com.zzosang.exam1.model.dto;

import org.springframework.web.multipart.MultipartFile;

public class OrderListDTO {
  private int num;
  private String name;
  private int price;
  private String details;
  private String notice;
  private String img_url;
  private MultipartFile file1;

  public OrderListDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public OrderListDTO(int num, String name, int price, String details, String notice, String img_url, MultipartFile file1) {
    super();
    this.num = num;
    this.name = name;
    this.price = price;
    this.details = details;
    this.notice = notice;
    this.img_url = img_url;
    this.file1= file1;
  }
  
  public void setFile1(MultipartFile file1) {
    this.file1 = file1;
  }
  
  public MultipartFile getFile1() {
    return file1;
  }

  @Override
  public String toString() {
    return "OrderListDTO [num=" + num + ", name=" + name + ", price=" + price + ", details=" + details + ", notice=" + notice
        + "]";
  }
  
  public String getImg_url() {
    return img_url;
  }
  
  public void setImg_url(String img_url) {
    this.img_url = img_url;
  }

  public int getNum() {
    return num;
  }

  public void setNum(int num) {
    this.num = num;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }

  public int getPrice() {
    return price;
  }

  public void setPrice(int price) {
    this.price = price;
  }

  public String getDetails() {
    return details;
  }

  public void setDetails(String details) {
    this.details = details;
  }

  public String getNotice() {
    return notice;
  }

  public void setNotice(String notice) {
    this.notice = notice;
  }

}
