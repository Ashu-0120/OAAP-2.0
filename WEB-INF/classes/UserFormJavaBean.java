package ooapDao;

public class UserFormJavaBean
 {  
private int id,status;
private String name,email,username,password,phone;  

public int getStatus() 
{   System.out.println("maar de goli");
    return status;  
}  
public void setStatus(int status) {  
    System.out.println("Pyaar mai dil pr");
    this.status = status;  
}  


public int getId() 
{  
    return id;  
}  
public void setId(int id) {  
    this.id = id;  
} 

public String getName() {  
    return name;  
}  

public void setName(String name) {  
    this.name = name;  
}

public String getEmail() {  
    return email;  
}  

public void setEmail(String email) {  
    this.email = email;  
}

public String getPhone() {  
    return phone;  
}  

public void setPhone(String phone) {  
    this.phone = phone;  
}

public String getUserName() {  
    return username;  
}  

public void setUserName(String username) {  
    this.username =username;  
}


public String getPassword() {  
    return password;  
}  
public void setPassword(String password) {  
    this.password = password;  
}  

}  
