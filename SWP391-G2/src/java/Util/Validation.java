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

    public boolean isValidNameLess50(String str) {
        boolean check = false;
        check = !str.trim().isEmpty() && str != null;
        check = !str.startsWith(" ");
        String regex = constant.VIETNAMESE;
        Pattern pattern = Pattern.compile(regex);
        check = pattern.matcher(str).matches();

        return check;
    }
    public boolean isValidSpace(String str){
        return  !str.trim().isEmpty() && str != null;
    }

    
    
    public static void main(String[] args) {
        System.out.println();
    }
}
