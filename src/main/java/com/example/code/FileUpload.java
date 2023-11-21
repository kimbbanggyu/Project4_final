package com.example.code;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.awt.*;
import java.io.File;
import java.io.IOException;

public class FileUpload {
    public MenuVO uploadPhoto(HttpServletRequest request){
        String filename= "";
        int sizeLimit = 15 *1024 *1024;
        String realPath = request.getServletContext().getRealPath("upload");
        System.out.println(realPath);

        File dir = new File(realPath);
        if(!dir.exists()) dir.mkdirs();

        MenuVO one = null;
        MultipartRequest multipartRequest = null;
        try{
            multipartRequest = new MultipartRequest(request,realPath,sizeLimit,"utf-8",new DefaultFileRenamePolicy());

            filename = multipartRequest.getFilesystemName("photo");
            one = new MenuVO();
            String sid = multipartRequest.getParameter("id");
            if(sid!=null&&!sid.equals("")) one.setId(Integer.parseInt(sid));
            one.setMenu(multipartRequest.getParameter("menu"));
            one.setPrice(multipartRequest.getParameter("price"));
            one.setOrigin(multipartRequest.getParameter("origin"));
            one.setReview(multipartRequest.getParameter("review"));

            if(sid!=null&&!sid.equals("")){
                MenuDAO dao = new MenuDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(sid));
                if(filename!=null && oldfilename!=null){
                    FileUpload.deleteFile(request,oldfilename);

                }
                else if(filename==null && oldfilename!=null) {
                    filename = oldfilename;
                }
            }
            System.out.println(filename);
            System.out.println("sid = " + sid);
            one.setPhoto(filename);


        } catch (IOException e) {
            throw new RuntimeException(e);
        }
        return one;
    }
    public static void deleteFile(HttpServletRequest request ,String filename){
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
}
