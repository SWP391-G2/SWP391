/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

/**
 *
 * @author nguye
 */
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import javax.xml.bind.DatatypeConverter;

public class Security {

    protected String PasswordSecurity(String srcText) throws NoSuchAlgorithmException {
        String enrText;
        MessageDigest msd = MessageDigest.getInstance("MD5");
        msd.update(srcText.getBytes());
        byte[] digest = msd.digest();
        enrText = DatatypeConverter.printHexBinary(digest).toLowerCase();
        return enrText;
    }

        protected String PasswordSecurity2(String srcText) throws NoSuchAlgorithmException {
        String enrText;
        MessageDigest msd = MessageDigest.getInstance("SHA-256");
        msd.update(srcText.getBytes());
        byte[] digest = msd.digest();
        enrText = DatatypeConverter.printHexBinary(digest).toLowerCase();
        return enrText;
    }
    public static void main(String[] args) throws NoSuchAlgorithmException {
        Security s = new Security();
        System.out.println(s.PasswordSecurity2("123"));
        System.out.println(s.PasswordSecurity("123"));
    }
}
