/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Util;

import Constant.constant;
import java.util.regex.Pattern;

/**
 *
 * @author nguye
 */
public class Validation {

    public boolean isValidStartWithSpace(String str) {
        return str.startsWith(" ");
    }

    public boolean isValidVietnameseAndEnglish(String str) {
        String regex = constant.VIETNAMESE;
        Pattern pattern = Pattern.compile(regex);
        return !pattern.matcher(str).matches();
    }

    public boolean isValidEmpty(String str) {
        return str.trim().isEmpty() || str == null;
    }

    public static void main(String[] args) {
        Validation validation = new Validation();

    }
}
