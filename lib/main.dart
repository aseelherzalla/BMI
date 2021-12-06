import 'dart:async';
import 'package:bmi/pages/addfooddetails_page.dart';
import 'package:bmi/pages/completinformation_page.dart';
import 'package:bmi/pages/foodlist.dart';
import 'package:bmi/pages/home_page.dart';
import 'package:bmi/pages/login_page.dart';
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
              child: MaterialApp(theme:ThemeHelper.themeHelper.lightTheme,home: FoodDetails())),
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
        Duration(seconds:5),
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
    return TextFormField(
      controller: widget.controller,
      validator: widget.validaitor,
      obscureText: widget.obscure,
      style: TextStyle(fontSize: 13), 
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

