package cn.smxy.zhouxuelian8.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {
    @Override
    //配置了静态资源的访问路径，使得所有以/upload/开头的请求都能访问D盘upload目录下的资源。
    // 这样的配置常用于文件上传功能，允许用户上传文件到指定目录，并能够通过/upload/路径访问这些文件。
    public void addResourceHandlers(ResourceHandlerRegistry registry){
        registry.addResourceHandler("/upload/**").addResourceLocations("file:D:\\upload\\");
    }

}
