 

function login_validation(){
var username=document.getElementById("username");
var password=document.getElementById("password");

var username_error=document.getElementById("username_error");
var password_error=document.getElementById("password_error");
var status=true;


if(username.value==""){
username.style["border-bottom"]="1px solid red";
username_error.textContent="*required";
username_error.style.color="red";
username_error.style["font-size"]="12px";
status=false;
}

if(password.value==""){
password.style["border-bottom"]="1px solid red";
password_error.textContent="*required";
password_error.style.color="red";
password_error.style["font-size"]="12px";

status=false;

}
else{
username.style["border-bottom"]="1px solid black";
username_error.textContent="";

password.style["border-bottom"]="1px solid black";
password_error.textContent="";


}




return status;


}

function r_name(){
var name=document.forms["registrationform"]["register_name"];
var name_error=document.getElementById("name_error");

var status=true;

if(name.value==""){
name.style["border-bottom"]="1px solid red";
name_error.textContent="*required";
status=false;
}
else {
name.style["border-bottom"]="1px solid black";
name_error.textContent="";

document.getElementById('name_tick').setAttribute( "class", "fa fa-check" );
}

return status;
}



function mail(){

 var email=document.forms["registrationform"]["register_email"];
 var email_error=document.getElementById("email_error");

var status=true;
if(email.value==""){
email.style["border-bottom"]="1px solid red";
email_error.textContent="*required";
status=false;
}

else if(email.value.indexOf("@")==-1){
email_error.style.color="red";

email_error.textContent="*Please Use @";
status=false;


}
else if(email.value.indexOf("@")<1){
email_error.style.color="red";
email_error.textContent="*Invalid Email-id";
status=false;
}


else if(email.value.indexOf(".")==-1){

email_error.textContent="*Please Use .";
status=false;
}

else if(email.value.indexOf("com")==-1){

email_error.textContent="*Please Use com";
status=false;
}
else if(email.value.indexOf(".com")!=email.value.length-4){

email_error.textContent="* Please Use .com correctly";
status=false;
}
else if(email.value.indexOf(".com")==(email.value.indexOf("@")+1)){


email_error.textContent="*Invalid Email-id";
status=false;
}



if(email.value.indexOf(".")!=-1&&email.value.indexOf("@")!=-1&&email.value.indexOf(".com")!=-1){

email.style["border-bottom"]="1px solid black";
email_error.textContent="";
document.getElementById('email_tick').setAttribute( "class", "fa fa-check" );
statu=true;
}

return status;
}


function r_phoneno(){

var phoneno=document.forms["registrationform"]["register_phone"];

 var phoneno_error=document.getElementById("phoneno_error");

var status=true;

if(phoneno.value==""){
phoneno.style["border-bottom"]="1px solid red";
phoneno_error.textContent="*required";
status=false;
document.getElementById('phone_tick').setAttribute( "class", "" );
} 

else if(isNaN(phoneno.value)){
phoneno.style["border-bottom"]="1px solid red";
phoneno_error.textContent="*Enter Numeric Value only";
status=false;
document.getElementById('phone_tick').setAttribute( "class", "" );
}


else if(phoneno.value.length!=10){
phoneno.style["border-bottom"]="1px solid red";
phoneno_error.textContent="*Enter valid Mobile Number";
status=false;
document.getElementById('phone_tick').setAttribute( "class", "" );

} 
else{
phoneno.style["border-bottom"]="1px solid black";
phoneno_error.textContent="";

document.getElementById('phone_tick').setAttribute( "class", "fa fa-check" );


}

	return status;
}

function r_username(){
var username=document.forms["registrationform"]["register_username"];
 var username_error=document.getElementById("username_error2");
var status=true;

if(username.value==""){
username.style["border-bottom"]="1px solid red";
username_error.textContent="*required";
status=false;
document.getElementById('username2_tick').setAttribute( "class", "" );
}
else if(username.value.length<8){

username.style["border-bottom"]="1px solid red";
username_error.textContent="*It must have minimum 8 characters";
document.getElementById('username2_tick').setAttribute( "class", "" );

}


else{
username.style["border-bottom"]="1px solid black";
username_error.textContent="";
document.getElementById('username2_tick').setAttribute( "class", "fa fa-check" );


}
return status;
	
}

function r_password(){

var password=document.forms["registrationform"]["register_password"];
 var password_error=document.getElementById("password_error2");

var status=true;
if(password.value==""){
password.style["border-bottom"]="1px solid red";
password_error.textContent="*required";
status=false;
}
else if(password.value.length<8){
password.style["border-bottom"]="1px solid red";
password_error.textContent="*It must have minimum 8 characters";
status=false;
}
else{
password.style["border-bottom"]="1px solid black";
password_error.textContent="";
document.getElementById('password2_tick').setAttribute( "class", "fa fa-check" );

}

return status;

	
}


function registration_validation(){

var status=false;

status=r_name();
status=mail();
status=r_username();
status=r_phoneno();
status=r_password();

return status;

console.log("status"+status);
}
