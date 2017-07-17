package com.zzosang.exam1.model.dto;

import java.util.Date;

public class CartDTO {
  private int cart_id;
  private String user_id;
  private String user_name;
  private int list_id;
  private String list_name;
  private int amount;
  private int money;
  private Date add_date;
  private String img_url;
  private int price;

  public CartDTO() {
    super();
    // TODO Auto-generated constructor stub
  }

  public CartDTO(int cart_id, String user_id, String user_name, int list_id, String list_name, int amount, int money,
      Date add_date, String img_url, int price) {
    super();
    this.cart_id = cart_id;
    this.user_id = user_id;
    this.user_name = user_name;
    this.list_id = list_id;
    this.list_name = list_name;
    this.amount = amount;
    this.money = money;
    this.add_date = add_date;
    this.img_url = img_url;
    this.price = price;
  }

  @Override
  public String toString() {
    return "CartDTO [cart_id=" + cart_id + ", user_id=" + user_id + ", user_name=" + user_name + ", list_id=" + list_id
        + ", list_name=" + list_name + ", amount=" + amount + ", money=" + money + ", add_date=" + add_date + ", img_url="
        + img_url + ", price=" + price + "]";
  }

  public int getPrice() {
    return price;
  }
  
  public void setPrice(int price) {
    this.price = price;
  }
  
  public String getImg_url() {
    return img_url;
  }

  public void setImg_url(String img_url) {
    this.img_url = img_url;
  }

  public int getCart_id() {
    return cart_id;
  }

  public void setCart_id(int cart_id) {
    this.cart_id = cart_id;
  }

  public String getUser_id() {
    return user_id;
  }

  public void setUser_id(String user_id) {
    this.user_id = user_id;
  }

  public String getUser_name() {
    return user_name;
  }

  public void setUser_name(String user_name) {
    this.user_name = user_name;
  }

  public int getList_id() {
    return list_id;
  }

  public void setList_id(int list_id) {
    this.list_id = list_id;
  }

  public String getList_name() {
    return list_name;
  }

  public void setList_name(String list_name) {
    this.list_name = list_name;
  }

  public int getAmount() {
    return amount;
  }

  public void setAmount(int amount) {
    this.amount = amount;
  }

  public int getMoney() {
    return money;
  }

  public void setMoney(int money) {
    this.money = money;
  }

  public Date getAdd_date() {
    return add_date;
  }

  public void setAdd_date(Date add_date) {
    this.add_date = add_date;
  }

}
