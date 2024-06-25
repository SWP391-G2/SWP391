/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class Brands {

    private int BrandID;
    private String BrandName;
    private String Description;
    private int status;

    public Brands() {
    }

    public Brands(int BrandID, String BrandName, String Description, int status) {
        this.BrandID = BrandID;
        this.BrandName = BrandName;
        this.Description = Description;
        this.status = status;
    }

    public Brands(String BrandName, String Description, int status) {
        this.BrandName = BrandName;
        this.Description = Description;
        this.status = status;
    }

    public int getBrandID() {
        return BrandID;
    }

    public void setBrandID(int BrandID) {
        this.BrandID = BrandID;
    }

    public String getBrandName() {
        return BrandName;
    }

    public void setBrandName(String BrandName) {
        this.BrandName = BrandName;
    }

    public String getDescription() {
        return Description;
    }

    public void setDescription(String Description) {
        this.Description = Description;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

}
