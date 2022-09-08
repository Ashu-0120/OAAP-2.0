//Logic

int correct_count=0,wrong_count=0,question_count=0,difficulty level=0,correct_count=0,wrong_count=0;


if(option==Answer){//if correct answer is selected by a student
correct_count++;
question_count++;
}else{
wrong_count++;
question_count++;
} 

if(question_count==3){// This if condition will run when 3 question has been attempted by user 
  if(correct_count>2){// This if condition will run when 2 question has been attempted correct by user
     correct_count=0;
	 question_count=0;
	 wrong_count=0
      	 if(difficulty_level<2)
           difficulty_level+1;
	 }
	 else if(wrong_count>2){// This if condition will run when 2 question has been attempted wrong by user
     correct_count=0;
	 question_count=0;
	 wrong_count=0
      	 if(difficulty_level>0)
             difficulty_level-1;
// if only 1 question is attempted out of 3 question, difficulty level will remain same	 
  }

           Connection con=ExamPortalDao.getConnection();  
     PreparedStatement preparedstatement=con.prepareStatement("SELECT * FROM ooa_aptitude"+difficulty_level+" WHERE  count=?");

//We have to modify the names of tables;
//ooa_aptitude_easy to ooa_aptitude_0
//ooa_aptitude_medium to ooa_aptitude_1
//ooa_aptitude_hard to ooa_aptitude_2


}

