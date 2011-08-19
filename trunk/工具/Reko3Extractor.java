package com.dragontiger.reko3.tools;

import java.io.File;
import java.io.FileInputStream;

public class Reko3Extractor {
    static int nc;
    static byte[] c;

    public static void main(String[] args) {
        try {
            String filePath = "c:/FACEDAT.R3";
            if (args.length > 0) {
                filePath = args[0];
            }
            File f = new File(filePath);
            FileInputStream fis = new FileInputStream(f);
            int size = fis.available();
            System.out.println("file size " + size);
            byte[] head16 = new byte[16];
            fis.read(head16, 0, 16);
            System.out.println(new String(head16));
            System.out.println(byte2Hex(head16));

            byte[] b = new byte[256];
            fis.read(b, 16, 256);

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    static int getbit(File f,int n)
    {
        int ct,t=0;
    while (n--!=0)    {
    if (nc==0)
    {
    //c=fgetc(f);
    if (fread(c,1,1,f)==0){ 
    return -1;
    }
    nc=8;
    rc++;
    }
    nc--;
    ct=c&0x80;
    t=(t&lt;&lt;1)+(ct&gt;&gt;7);
    c&lt;&lt;=1;
    }
    return t;
    }

    /**
     * 转换成十六进制字符串 包含0x和逗号分隔符","
     */
    public static String byte2Hex(byte[] b) {
        String hs = "";
        String stmp = "";
        for (int n = 0; n < b.length; n++) {
            stmp = (java.lang.Integer.toHexString(b[n] & 0XFF));
            if (stmp.length() == 1) {
                hs = hs + "0x0" + stmp.toUpperCase();
            } else {
                hs = hs + "0x" + stmp.toUpperCase();
            }
            if (n < b.length - 1) {
                hs = hs + ",";
            }
        }
        return hs;
    }
}
