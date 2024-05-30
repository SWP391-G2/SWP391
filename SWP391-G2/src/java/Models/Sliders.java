/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models;

/**
 *
 * @author nguye
 */
public class Sliders {

    private int sliderID;
    private String sliderImage;
    private boolean sliderStatus;
    private String sliderTitle;

    public Sliders() {
    }

    public Sliders(int sliderID, String sliderImage, boolean sliderStatus, String sliderTitle) {
        this.sliderID = sliderID;
        this.sliderImage = sliderImage;
        this.sliderStatus = sliderStatus;
        this.sliderTitle = sliderTitle;
    }

    public int getSliderID() {
        return sliderID;
    }

    public void setSliderID(int sliderID) {
        this.sliderID = sliderID;
    }

    public String getSliderImage() {
        return sliderImage;
    }

    public void setSliderImage(String sliderImage) {
        this.sliderImage = sliderImage;
    }

    public boolean isSliderStatus() {
        return sliderStatus;
    }

    public void setSliderStatus(boolean sliderStatus) {
        this.sliderStatus = sliderStatus;
    }

    public String getSliderTitle() {
        return sliderTitle;
    }

    public void setSliderTitle(String sliderTitle) {
        this.sliderTitle = sliderTitle;
    }

}
