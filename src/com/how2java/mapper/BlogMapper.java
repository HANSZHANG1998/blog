package com.how2java.mapper;
 
import java.util.List;
import com.how2java.pojo.Blog;
 
public interface BlogMapper {
 
    public int add(Blog blog);  
       
    public void delete(String id);  
      
    public List<Blog> getById(String id);  
     
    public List<Blog> getByUsername(String username);  
    
    public List<Blog> getBlogByUsername(String username);  
      
    public int update(Blog blog);
    
    public void updateViews(Blog blog);
      
    public List<Blog> list();
    
    public int count();  
    
    public List<Blog> searchlike(String content);
    
}