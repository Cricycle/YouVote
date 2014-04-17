package com.Model;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
public class JSHA512Hash {
     
    public static String sha512(String input, int lenLimit) {
        if(input == null) return null;
        
        String sha512 = null;
        try {
            //Create MessageDigest object for SHA-512
            //Update input string in message digest
            //Converts message digest value in base 16 (hex)
            
            MessageDigest digest = MessageDigest.getInstance("SHA-512");
            digest.update(input.getBytes("UTF-8"), 0, input.length());
            sha512 = new BigInteger(1, digest.digest()).toString(16);
            
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            Logger.getLogger(JSHA512Hash.class.getName()).log(Level.SEVERE, null, e);
        }
        return sha512.substring(0, lenLimit);
    }
}