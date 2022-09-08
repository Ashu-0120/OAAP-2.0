package oaapDao;
import oaapDao.*;
import java.util.*;  
import java.sql.*; 

public class oaapUserDao {  

	
	public static Connection getConnection(){  
        Connection con=null;  
        try{  
            Class.forName("oracle.jdbc.OracleDriver");  
            con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","AshiTiwari","2001");  
        }
		catch(Exception e){System.out.println(e);}  
        return con;  
    } 

	public static int oaapUserInfo(String name,String username,String password,String email,String phone){  
        int status=0;  

	UserInfoJavaBean uijb=new UserInfoJavaBean();
        oaapUserDao oud=new oaapUserDao();
        try{  
            Connection con=oaapUserDao.getConnection();  
            PreparedStatement ps=con.prepareStatement("insert into userinfo values (user_id_seq.nextval,?,?,?,?,?)");

       ps.setString(1,name);
       ps.setString(2,username);
       ps.setString(3,password);
       ps.setString(4,email); 
       ps.setString(5,phone);

        status=ps.executeUpdate();
              
            con.close();  

uijb=oud.oaapUserValidate(username,password);

System.out.println(uijb.getId());
		oud.oaapInsertSubjectAccuracy("aptitude",String.valueOf(uijb.getId()),0);
		oud.oaapInsertSubjectAccuracy("reasoning",String.valueOf(uijb.getId()),0);
		oud.oaapInsertSubjectAccuracy("technical",String.valueOf(uijb.getId()),0);
		oud.oaapInsertSubjectAccuracy("java",String.valueOf(uijb.getId()),0);
	

        }catch(Exception ex){System.out.println(ex);}  
          
        return status;  
    }

	public static UserInfoJavaBean oaapUserValidate(String username,String password){

	UserInfoJavaBean uijb=new UserInfoJavaBean();

    
	System.out.println("username"+username);
	System.out.println("password"+password);

        try{  
            Connection con=oaapUserDao.getConnection();  
           
		   PreparedStatement preparedstatement=con.prepareStatement("select * from userinfo where username=? and password=?");
           preparedstatement.setString(1,username);
          preparedstatement.setString(2,password);


           uijb.setStatus(0);
           System.out.println("Kya Yahaan aaye ???");
		ResultSet resultset=preparedstatement.executeQuery();
     
		if(resultset.next()){
            
           System.out.println("chl yahaan jaate hai..");
        uijb.setStatus(1);
         uijb.setId(resultset.getInt(1));
        uijb.setName(resultset.getString(2));
        uijb.setEmail(resultset.getString(5));
        uijb.setPhone(resultset.getString(6));
        
    }

	System.out.println("userid="+uijb.getId());

		}
		catch(Exception ee){
		System.out.println(ee);
		}
	return uijb;
	}

public QuestionAnswerJavaBean oaapQuestionFetch(String mock_test_sub,String difficulty,String count){
	QuestionAnswerJavaBean qajb=new QuestionAnswerJavaBean();

        try{  
            Connection con=oaapUserDao.getConnection();  

         PreparedStatement preparedstatement=con.prepareStatement("select * from "+mock_test_sub+"_"+difficulty+" where sno="+Integer.parseInt(count));

         ResultSet resultset=preparedstatement.executeQuery();

  if(resultset.next()){

         qajb.setStatus(1);
		 qajb.setQid(resultset.getInt(1));
		 qajb.setCid(resultset.getInt(2));
		 qajb.setQuestion(resultset.getString(3));
		 
         qajb.setA(resultset.getString(4));
         qajb.setB(resultset.getString(5));
         qajb.setC(resultset.getString(6));
         qajb.setD(resultset.getString(7));
		 qajb.setAnswer(resultset.getString(8));
	   System.out.println("if-result-set");
	  


}

System.out.println("test1");
   
   }
		catch(Exception ee){
		System.out.println(ee);
		}
	return qajb;


	}

	public float oaapFetchSubjectAccuracy(String subject,String uid){
  float accuracy=0,temp=0,count=0;
  
  try{  

    Connection con=oaapUserDao.getConnection();  

         PreparedStatement preparedstatement=con.prepareStatement("select * from statistic_"+subject+" where U_id="+Integer.parseInt(uid));

ResultSet rs=preparedstatement.executeQuery();
    
	while(rs.next()){
count++;
   temp=rs.getFloat(2);
   accuracy=accuracy+temp;

	}
   
		}
		catch(Exception e){
		System.out.println(e);
		}



return (accuracy/count);

}

	public int oaapInsertSubjectAccuracy(String subject,String uid,float accuracy){
int status=0;
        try{  

    Connection con=oaapUserDao.getConnection();  

         PreparedStatement preparedstatement=con.prepareStatement("insert into statistic_"+subject+" values(?,?)");
    
	   preparedstatement.setInt(1,Integer.parseInt(uid));
	   preparedstatement.setFloat(2,accuracy);

  status=preparedstatement.executeUpdate();
		}
		catch(Exception e){
		System.out.println(e);
		}


return status;

}
}
	