package com.axweb.util;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.bytedeco.javacv.FFmpegFrameGrabber;
import org.bytedeco.javacv.Frame;
import org.bytedeco.javacv.Java2DFrameConverter;

public class ImageUtil {
	 public  String randomGrabberFFmpegImage(String filePath, 
			 String targerFilePath, String targetFileName)
	            throws Exception {
	        System.out.println(filePath);
	        FFmpegFrameGrabber ff = FFmpegFrameGrabber.createDefault(filePath);
	        ff.start();
	        Frame f;
	        int lenght = ff.getLengthInFrames();
	        int i = 0;
	        String path = null;
	        while (i < lenght) {
	            // 过滤前5帧，避免出现全黑的图片，依自己情况而定
	            f = ff.grabFrame();
	            if ((i > 200) && (f.image != null)) {
	                path = doExecuteFrame(f, targerFilePath, targetFileName);
	                break;
	            }
	            i++;
	        }
	 
	        ff.stop();
	        return path;
	    }
	 
	    public static String doExecuteFrame(Frame f, String targerFilePath, String targetFileName) throws Exception {
	 
	        if (null ==f ||null ==f.image) {
	            throw new Exception("获取缩略图失败");
	        }
	        Java2DFrameConverter converter =new Java2DFrameConverter();
	        String imageMat ="jpg";
	        String FileName =targerFilePath + File.separator +targetFileName +"." +imageMat;
	        BufferedImage bi =converter.getBufferedImage(f);
	        System.out.println("width:" + bi.getWidth());
	        System.out.println("height:" + bi.getHeight());
	        File output =new File(FileName);
	        try {
	            ImageIO.write(bi,imageMat,output);
	        }catch (IOException e) {
	            throw new Exception("缩略图写入文件夹失败");
	        }
	        return FileName;
	    }
	 
	    public static void main(String[] args) throws Exception {
	        //String s = randomGrabberFFmpegImage("/home/xiao/IMG_3077.mp4", "/home/xiao", "213");
	        //System.out.println(s);
	    }

}
