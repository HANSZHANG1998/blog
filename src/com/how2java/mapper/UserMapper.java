package com.how2java.mapper;
 
import java.util.List;
import com.how2java.pojo.User;
 
public interface UserMapper {
  
    public int add(User user);  

    public void delete(String id);   
      
    public List<User> getById(String id);  
     
    public List<String> getByUsername(String username);  
      
    public int update(User user);    
      
    public List<User> list();
          
    public int count();  
    
}