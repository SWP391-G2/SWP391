/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author admin
 */
public class ImageDetail {
    private int ImageID;
    private int ProductFullDetailID;
    private String ImageUrl;

    public ImageDetail() {
    }

    public ImageDetail(int ImageID, int ProductFullDetailID, String ImageUrl) {
        this.ImageID = ImageID;
        this.ProductFullDetailID = ProductFullDetailID;
        this.ImageUrl = ImageUrl;
    }

    public int getImageID() {
        return ImageID;
    }

    public void setImageID(int ImageID) {
        this.ImageID = ImageID;
    }

    public int getProductFullDetailID() {
        return ProductFullDetailID;
    }

    public void setProductFullDetailID(int ProductFullDetailID) {
        this.ProductFullDetailID = ProductFullDetailID;
    }

    public String getImageUrl() {
        return ImageUrl;
    }

    public void setImageUrl(String ImageUrl) {
        this.ImageUrl = ImageUrl;
    }
    
}
