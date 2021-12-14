import 'dart:async';
import 'package:bmi/pages/addfooddetails_page.dart';
import 'package:bmi/pages/completinformation_page.dart';
import 'package:bmi/pages/foodlist.dart';
import 'package:bmi/pages/home_page.dart';
import 'package:bmi/pages/login_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:bmi/providers/bmi_provider.dart';
import 'package:flutter/material.dart';
import 'package:bmi/helpers/theme.dart';
//import 'package:bmi/ui/splach.dart';
//import 'package:bmi/ui/splach.dart';
void main() {
  runApp(
    ChangeNotifierProvider<BmiProvider>(
              create: (context) =>BmiProvider(),
              child: MaterialApp(theme:ThemeHelper.themeHelper.lightTheme,home: FirebaseConfiguration())),
   // MaterialApp(home:completeInformation())
  );
}

class Splach extends StatefulWidget{
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splach> {
  void initState() {
    super.initState();
    Timer(
        Duration(seconds:2),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => LoginPage())));
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xFF1588d8),
     body:
      Center(
        child: Container(
         child:Image.asset('assets/images/logo.PNG') ,),
      ),
   );
  }
}



 

class DefultTextField extends StatefulWidget{
  String textName;
  Function validaitor;
  TextEditingController controller;
  bool obscure;
  bool visible;
  DefultTextField({
    @required this.textName,
    this.validaitor,
    @required this.controller,
    this.obscure=false,
    this.visible= false
  });

  @override
  State<DefultTextField> createState() => _DefultTextFieldState();
}

class _DefultTextFieldState extends State<DefultTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      obscureText: widget.obscure,
      style: Theme.of(context).textTheme.headline4, 
      decoration: InputDecoration(
        contentPadding: EdgeInsets.all(0),
        hintText: widget.textName,
        suffix: Visibility(child: IconButton(
          icon:widget.obscure?Icon(Icons.visibility_off_outlined ,size: 16,color: Colors.grey,): Icon(Icons.remove_red_eye_outlined,size: 16,color: Colors.grey,), 
          onPressed: (){
            setState(() {
               widget.obscure=!widget.obscure;
            });
           
          },)
          ,visible: widget.visible,),
        enabledBorder: UnderlineInputBorder(      
        borderSide: BorderSide(color:Color(0xFF1588d8)),   
  ),   
      ),
    );
  }
}
class FirebaseConfiguration extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseApp>(
        future: Firebase.initializeApp(),
        builder: (context, dataSnapshot) {
          if (dataSnapshot.connectionState == ConnectionState.done) {
            return Splach();
          }
          if (dataSnapshot.hasError) {
            return Scaffold(
              body: Center(child: Text(dataSnapshot.error.toString())),
            );
          }
          return Scaffold(
            body: CircularProgressIndicator(),
          );
        }
    );
  }
}
/*class SplachPage extends StatelessWidget{
  void initState() {
    super.initState();
    Timer(
        Duration(seconds:4),
        () => Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => MyApp())));
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     backgroundColor: Color(0xFF1588d8),
     body:
      Center(
        child: Container(
         child:Image.asset('assets/images/logo.PNG') ,),
      ),
   );
  }
  
}*/
/*TextFormField(
                controller:passwordController ,
                obscureText: obscure,
                decoration:InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  hintText: 'password',
                  suffix:IconButton(
          icon:obscure?Icon(Icons.visibility_off_outlined ,size: 16,color: Colors.grey,): Icon(Icons.remove_red_eye_outlined,size: 16,color: Colors.grey,), 
          onPressed: (){
            setState(() {
               obscure=!obscure;
            });
           
          },) ,
                  enabledBorder: UnderlineInputBorder(      
                                 borderSide: BorderSide(color:Color(0xFF1588d8)),   
  ),  ) ,

              ),*/

