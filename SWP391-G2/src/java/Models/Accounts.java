/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

import java.util.BitSet;
import java.util.Date;

/**
 *
 * @author nguye
 */
public class Accounts {

    private int accountID;
    private String firstName, lastName, password, image;
    private int gender;
    private Date birthday;
    private String phone,email, address;
    private int status;
    private Date createDate;
    private int role;

    public Accounts() {
    }

    public Accounts(int accountID, String firstName, String lastName, String password, String image, int gender, Date birthday, String phone, String email, String address, int status, Date createDate, int role) {
        this.accountID = accountID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.image = image;
        this.gender = gender;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.status = status;
        this.createDate = createDate;
        this.role = role;
    }

    public Accounts(String firstName, String lastName, String password, String image, int gender, Date birthday, String phone, String email, String address, int status, Date createDate, int role) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.password = password;
        this.image = image;
        this.gender = gender;
        this.birthday = birthday;
        this.phone = phone;
        this.email = email;
        this.address = address;
        this.status = status;
        this.createDate = createDate;
        this.role = role;
    }

    public int getAccountID() {
        return accountID;
    }

    public void setAccountID(int accountID) {
        this.accountID = accountID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getGender() {
        return gender;
    }

    public void setGender(int gender) {
        this.gender = gender;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    public Date getCreateDate() {
        return createDate;
    }

    public void setCreateDate(Date createDate) {
        this.createDate = createDate;
    }

    public int getRole() {
        return role;
    }

    public void setRole(int role) {
        this.role = role;
    }

    @Override
    public String toString() {
        return "Accounts{" + "accountID=" + accountID + ", firstName=" + firstName + ", lastName=" + lastName + ", password=" + password + ", image=" + image + ", gender=" + gender + ", birthday=" + birthday + ", phone=" + phone + ", email=" + email + ", address=" + address + ", status=" + status + ", createDate=" + createDate + ", role=" + role + '}';
    }
    
}
