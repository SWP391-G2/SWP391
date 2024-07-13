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

    public boolean isPositiveInteger(String s) {
        return s.matches("\\d+");
    }

    public boolean isPositiveRealNumber(String s) {
        return s.matches("\\d*\\.?\\d+");
    }

    public boolean CheckPass(String password) {
        boolean islower = false;
        boolean isupper = false;
        boolean isNumber = false;
        boolean isspecital = false;
        if (password.length() < 8) {
            return false;
        }
        for (char p : password.toCharArray()) {
            if (Character.isUpperCase(p)) {
                islower = true;
            } else if (Character.isLowerCase(p)) {
                isupper = true;
            } else if (Character.isDigit(p)) {
                isNumber = true;
            } else {
                isspecital = true;
            }
        }
        if (password.contains(" ")) {
            return false;
        }
        return isNumber && islower && isspecital && isupper;
    }

    public static void main(String[] args) {
        Validation validation = new Validation();
        System.out.println(validation.isValidEmpty(constant.ACCOUNTS));
        System.out.println(constant.ACCOUNTS);
    }

}