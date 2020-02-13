package com.try1t.mapper;
 
import java.util.List;

import com.try1t.pojo.User;
 
public interface UserMapper {
  
    public int add(User user);  

    public void delete(String id);   
      
    public List<User> getById(String id);  
     
    public List<String> getByUsername(String username);  
    
    public int update(User user);    
    
    public int updateDetail(User user);
    
    public int updateURL(User user);  
    
    public int updatePasswordByUsername(User user);  
    
    public List<User> list();
          
    public int count();  
    
    public List<User> getUserByUsername(String username);
    
}