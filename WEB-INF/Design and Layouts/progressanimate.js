
function myprogressivebar(){
myFunction();
var prg=document.getElementById("progressbar");
var mylevel=document.getElementById("level");

var myprg=document.getElementById("progressive_struc");
var percent=document.getElementById("percentcount");
var counter=1;
var progress=10;

var id=setInterval(frame,80);

function frame(){
   if(counter==1){
   prg.style['background-color']="#F60100";
   mylevel.innerHTML="Novice";
  }
  if (counter==20)
   {

 prg.style['background-color']="#E51E2B";
   mylevel.innerHTML="Adv. Beginner";

   }
  if(counter==40){
 prg.style['background-color']="#FF9A00";
   mylevel.innerHTML="Competent";
  	
  }
   if(counter==60){
  	 prg.style['background-color']="#FCBD34";
   mylevel.innerHTML="Proficient";

  }
  if(counter==80){
 prg.style['background-color']="#6DB432";
   mylevel.innerHTML="Expert";
  	
  }

   if(counter==100 && progress==1000){
  	clearInterval(id);
  } 
  else{
  	progress +=10;
  	counter +=1;
    
    prg.style.width=progress+"px";
    percent.innerHTML=counter+ '%';

  }

}


}

function myFunction(){
	var timercircle=document.getElementById("circle");

var counter=0;
var timeleft=60;

function convertSeconds(s){
var min=Math.floor(s/60);
var sec=s%60;
return min+":"+sec;
}


var timer_id=setInterval(function timeIt(){
	counter++;
	var rem=timeleft-counter;
	var time=convertSeconds(rem);
	
	if(counter==1){
timercircle.style['background-color']="#6DB432";
	}
	
	if(counter==21){
	timercircle.style['background-color']="#FF9A00";	
	}

	if(counter==41){
	timercircle.style['background-color']="#E51E2B";	
	}
	if(counter==51){
		timercircle.style['background-color']="#F60100";
	}
	if(counter==60){
         clearInterval(timer_id);
	}

document.getElementById("timer").innerHTML=time;
},1000);



}
//--------------------------------REGISTER VALIDATION---------------------------->
function validate(){  
var name=document.registrationform.name.value;  
var username=document.registrationform.username.value;
var phoneno=document.registrationform.phoneno.value;   
var password=document.registrationform.password.value;  
var status=false;  
  
if(name.length<1){  
document.getElementById("val_name").innerHTML=  
" Please enter your name";  
status=false;  
}else{  
document.getElementById("val_name").innerHTML="Correct";  
status=true;  
}  

if(username.length<1){  
document.getElementById("val_username").innerHTML=  
" Please enter your username";  
status=false;  
}else{  
document.getElementById("val_username").innerHTML="Correct";  
status=true;  
}  

if (isNaN(phoneno)){  
  document.getElementById("val_phoneno").innerHTML="Enter Numeric value only";  
  status=false;  
}else{ 
document.getElementById("val_phoneno").innerHTML="Correct";  

  status=true;   
  }  


if(password.length<6){  
document.getElementById("val_password").innerHTML=
"Password must be at least 6 char long";  
status=false;  
}else{  
document.getElementById("val_password").innerHTML="Correct";  
}  
return status;  
}  
//--------------------------------REGISTER VALIDATION---------------------------->