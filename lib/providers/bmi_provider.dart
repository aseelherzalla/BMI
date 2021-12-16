import 'package:bmi/helpers/authentication.dart';
import 'package:bmi/main.dart';
import 'package:bmi/models/user.dart';
import 'package:bmi/pages/completinformation_page.dart';
import 'package:bmi/pages/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';



class BmiProvider extends ChangeNotifier{
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController repasswordController=TextEditingController();
  User user;
  UserInformation userInfo;
  Gender gender = Gender.male;

  changeGender(Gender value){
    gender = value;
    notifyListeners();
  }
  CreateButton() async{
    if(nameController.text!=''&&emailController.text!=''&&passwordController.text!=''&& repasswordController.text!=''){
      if(passwordController.text ==  repasswordController.text){
        bool value = await Authentication.authHelper.register(emailController.text, passwordController.text);
        if(value){
          getCurrentUser();
          userInfo = UserInformation(id: user.uid, name: nameController.text, email: emailController.text);
          RouterHelper.route.pushReplacementNamed(completeInformation.router);
          //cleanControllers();
        }
      }
      else{
        Authentication.authHelper.showToast('passNotMatch');
      }
    }
    else{
      Authentication.authHelper.showToast('fillAllFields');
    }
  }
  getCurrentUser(){
    user=Authentication.authHelper.getCurrentUser();
    notifyListeners();
  }

}