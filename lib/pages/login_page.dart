import 'package:bmi/main.dart';
import 'package:bmi/pages/singup_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget{
  TextEditingController userNameController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  GlobalKey<FormState> formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        backgroundColor:Color(0xFF1588d8) ,
        title: Center(child: Text('BMI Analyzer')),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child:
                 Text('Welcome Back',style: TextStyle(fontSize: 30,fontWeight:FontWeight.bold,color:Color(0xFF1588d8) ),),
                 margin: EdgeInsets.only(top: 100),),
              SizedBox(height: 10,),
              Text('if you already have an account, log in',style: TextStyle(color: Colors.black38),),
              SizedBox(height: 50,),
              DefultTextField(textName: 'Username',
                        controller: userNameController,
                        obscure: false,
                        visible: false,
                        validaitor: (value){
                                 if (value == null || value.isEmpty) {
                                   return 'please enter some text';
        
                            }}),
              
              DefultTextField(textName: 'Password',
                        controller: passwordController,
                        obscure: true,
                        visible: true,
                        validaitor: (value){
                                 if (value == null || value.isEmpty) {
                                   return 'please enter some text';
        
                            }}),
                            SizedBox(height: 100,),
                            GestureDetector(
                      onTap: (){ },
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                             color: Colors.grey,
                             blurRadius: 10,
                             offset: Offset(2, 4), // Shadow position
                              ),
                             ],
                          color:Color(0xFF1588d8),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        
                        child:Center(
                          child: Text('Log In',style: TextStyle(fontSize:20,color:Colors.white),
                          ),
                        )
                      ),
                ),
                SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   Text('you Don’t have an account?',style: TextStyle(color: Colors.black),),
                   GestureDetector(
                     onTap: (){
                        Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=> SignUpPage()));
                     },
                     child: Text('Sign up',style: TextStyle(color:Color(0xFF1588d8)),)),
        
        
                ],),
             
            ],),
        ),
      ),
    );
  }

}