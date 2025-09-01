package cn.smxy.zhouxuelian8.Controller;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
import java.util.*;

@RestController
@CrossOrigin
public class FileController {
    @PostMapping("/uploadFile")
    public Map<String,Object> uploadFile(MultipartFile file) throws IOException{
        String oldFilename = file.getOriginalFilename();
        String newFileName = UUID.randomUUID().toString()+oldFilename;
        String fileSavePath ="D:/upload/"+newFileName;

        File f =new File(fileSavePath);
        file.transferTo(f);

        String imagePath ="http://localhost:8089/zhouxuelian8/upload/"+newFileName;

        Map<String,Object> map =new HashMap<>();
        map.put("code",200);
        map.put("msg","文件上传成功");
        map.put("dataobject",imagePath);
        return map;
    }
    @PostMapping("/richText/uploadFile")
    public Map<String,Object> richTextUploadFile(MultipartFile file,String type) throws IOException{
        String oldFileName = file.getOriginalFilename();
        String newFileName = UUID.randomUUID().toString() + oldFileName;
        String fileSavePath ="D:/upload/" + newFileName;

        File f = new File(fileSavePath);
        file.transferTo(f);

        String imagePath = "http://localhost:8089/zhouxuelian8/upload/" + newFileName;
        if ("img".equals(type)){
            Map<String,Object> m =new HashMap<>();
            m.put("url",imagePath);
            List<Map<String,Object>> list =new ArrayList<>();
            list.add(m);

            Map<String,Object> map =new HashMap<>();
            map.put("errno",0);
            map.put("data",list);
            return map;
        }else {
            Map<String,Object> m =new HashMap<>();
            m.put("url",imagePath);

            Map<String,Object> map =new HashMap<>();
            map.put("errno",0);
            map.put("data",m);
            return map;
        }

    }
}
