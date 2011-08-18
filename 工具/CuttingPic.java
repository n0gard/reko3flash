package com.dragontiger.reko3.tools;

import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.Transparency;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileFilter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.imageio.ImageIO;

public class CuttingPic {

    /**
     * @param args
     */
    public static void main(String[] args) {
        // TODO Auto-generated method stub
        String dirPath = "E:/FLASH/workspace/reko3flash/素材/所有";
        if (args.length > 0) {
            dirPath = args[0];
        }

        File picFiles = new File(dirPath);
        File[] allFiles = picFiles.listFiles(new FileFilter() {

            @Override
            public boolean accept(File pathname) {
                String fileName = pathname.getName();
                if (fileName.indexOf("HEXZCHR") != -1) {
                    if (fileName.toLowerCase().endsWith("png")) {
                        System.out.println("Got File " + fileName);
                        return true;
                    }
                }
                return false;
            }
        });
        for (File file : allFiles) {
            System.out.println(file.getName());
            cut(file);
        }

    }

    private static void cut(File testImage) {
        BufferedImage srcImageBuf = null;
        try {
            srcImageBuf = ImageIO.read(testImage);
        } catch (IOException e1) {
            // TODO Auto-generated catch block
            e1.printStackTrace();
        }
        BufferedImage dstImageBuf = new BufferedImage(32, 32, BufferedImage.TYPE_INT_RGB);
        BufferedImage dstImageBufTemp = new BufferedImage(32, 32, BufferedImage.TYPE_INT_RGB);

        Graphics2D g2d = dstImageBuf.createGraphics();
        Graphics2D g2dTemp = dstImageBufTemp.createGraphics();
        dstImageBuf = g2d.getDeviceConfiguration().createCompatibleImage(32, 32,
                Transparency.TRANSLUCENT);
        dstImageBufTemp = g2dTemp.getDeviceConfiguration().createCompatibleImage(32, 32,
                Transparency.TRANSLUCENT);
        g2d.dispose();
        g2dTemp.dispose();
        g2d = dstImageBuf.createGraphics();
        g2dTemp = dstImageBufTemp.createGraphics();

        Image srcImage = srcImageBuf.getSubimage(0, 32, 32, 32).getScaledInstance(32, 32,
                BufferedImage.SCALE_DEFAULT);

        g2d.drawImage(srcImage, 0, 0, null);
        g2dTemp.drawImage(srcImage, 0, 0, null);
        // 
        for (int j1 = dstImageBuf.getMinY(); j1 < dstImageBuf.getHeight(); j1++) {
            for (int j2 = dstImageBuf.getMinX(); j2 < dstImageBuf.getWidth(); j2++) {
                int rgb = dstImageBufTemp.getRGB(j2, j1);
                //                System.out.print(" " + rgb);
                // rgb = ((alpha + 1) << 24) | (rgb & 0x00ffffff);
                if (rgb == Color.BLACK.getRGB()) {
                    int otherRgb = 0;
                    //  11 0 2  
                    //   9 X 3  
                    //   8 6 4  
                    List<Integer> xs = new ArrayList<Integer>(8);
                    List<Integer> ys = new ArrayList<Integer>(8);
                    // 0
                    int x0 = j2;
                    int y0 = j1 - 1;
                    xs.add(x0);
                    ys.add(y0);
                    // 11�㷽����������
                    //                    int x10 = j2 - 1;
                    //                    int y10 = j1 - 1;
                    //                    xs.add(x10);
                    //                    ys.add(y10);
                    // 9
                    int x9 = j2 - 1;
                    int y9 = j1;
                    xs.add(x9);
                    ys.add(y9);
                    // 8
                    //                    int x8 = j2 - 1;
                    //                    int y8 = j1 + 1;
                    //                    xs.add(x8);
                    //                    ys.add(y8);
                    // 6
                    int x6 = j2;
                    int y6 = j1 + 1;
                    xs.add(x6);
                    ys.add(y6);
                    // 4
                    //                    int x4 = j2 + 1;
                    //                    int y4 = j1 + 1;
                    //                    xs.add(x4);
                    //                    ys.add(y4);
                    // 3
                    int x3 = j2 + 1;
                    int y3 = j1;
                    xs.add(x3);
                    ys.add(y3);
                    // 2
                    //                    int x2 = j2 + 1;
                    //                    int y2 = j1 - 1;
                    //                    xs.add(x2);
                    //                    ys.add(y2);

                    boolean isNeed = false;
                    for (int i = 0; i < xs.size(); i++) {
                        int x = xs.get(i);
                        int y = ys.get(i);
                        if (x < dstImageBuf.getMinX() || x >= dstImageBuf.getWidth()
                                || y < dstImageBuf.getMinY() || y >= dstImageBuf.getHeight()) {
                            continue;
                        }
                        System.out.println("X " + x + " Y " + y);
                        otherRgb = dstImageBufTemp.getRGB(x, y);
                        if (otherRgb != Color.BLACK.getRGB()) {
                            isNeed = true;
                            break;
                        }
                    }

                    xs = new ArrayList<Integer>();
                    ys = new ArrayList<Integer>();

                    if (isNeed) {
                        continue;
                    }

                    System.out.println(" Black  ");
                    dstImageBuf.setRGB(j2, j1, new Color(0, 0, 0, 1).getRGB());
                }
            }
        }
        System.out.println();
        g2d.drawImage(dstImageBuf, 0, 0, null);
        try {
            ImageIO.write(dstImageBuf, "png", new File("D:/test_"
                    + testImage.getName().split("_")[1].split("\\.")[0] + "b.png"));
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }
}
