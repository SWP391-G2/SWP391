/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author ROG
 */
public class Address {
    private int address_id, account_id;
    private String phone, address_line ,city, district;
    private int status;

    public Address() {
    }

    public Address(int address_id, int account_id, String phone, String address_line, String city, String district, int status) {
        this.address_id = address_id;
        this.account_id = account_id;
        this.phone = phone;
        this.address_line = address_line;
        this.city = city;
        this.district = district;
        this.status = status;
    }

    public int getAddress_id() {
        return address_id;
    }

    public void setAddress_id(int address_id) {
        this.address_id = address_id;
    }

    public int getAccount_id() {
        return account_id;
    }

    public void setAccount_id(int account_id) {
        this.account_id = account_id;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress_line() {
        return address_line;
    }

    public void setAddress_line(String address_line) {
        this.address_line = address_line;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Address{" + "address_id=" + address_id + ", account_id=" + account_id + ", phone=" + phone + ", address_line=" + address_line + ", city=" + city + ", district=" + district + ", status=" + status + '}';
    }

   
   
    
}
