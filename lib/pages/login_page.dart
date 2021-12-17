import 'package:bmi/main.dart';
import 'package:bmi/pages/singup_page.dart';
import 'package:bmi/providers/bmi_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget{
  static String router ='LoginPage';
  
  GlobalKey<FormState> formkey= GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
    Consumer<BmiProvider>(
       
      builder:(context, provider, child) =>
     Scaffold(
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
                        controller: provider.nameController,
                        obscure: false,
                        visible: false,
                        validaitor: (value){
                                 if (value == null || value.isEmpty) {
                                   return 'please enter some text';
        
                            }}),
              
              DefultTextField(textName: 'Password',
                        controller: provider.passwordController,
                        obscure: true,
                        visible: true,
                        validaitor: (value){
                                 if (value == null || value.isEmpty) {
                                   return 'please enter some text';
        
                            }}),
                            SizedBox(height: 100,),
                           ElevatedButton(
              child: Text('CREAT'),
              style: Theme.of(context).elevatedButtonTheme.style,
              onPressed: () {
                
              },
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
    )
    );
  }

}