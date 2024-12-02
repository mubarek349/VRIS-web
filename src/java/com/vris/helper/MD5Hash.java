package com.vris.helper;

import java.security.*;

public class MD5Hash {

    private String hashpass = "";

    public String getHashPass(String password) throws NoSuchAlgorithmException {
        String plainText = password;
        MessageDigest mdAlgorithm = MessageDigest.getInstance("MD5");
        mdAlgorithm.update(plainText.getBytes());

        byte[] digest = mdAlgorithm.digest();
        StringBuilder hexString = new StringBuilder();

        for (int i = 0; i < digest.length; i++) {
            plainText = Integer.toHexString(0xFF & digest[i]);

            if (plainText.length() < 2) {
                plainText = "0" + plainText;
            }

            hexString.append(plainText);
        }
        hashpass = hexString.toString();
        return hashpass;
    }
}
