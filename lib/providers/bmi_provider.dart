import 'package:bmi/main.dart';
import 'package:bmi/pages/completinformation_page.dart';
import 'package:flutter/cupertino.dart';

class BmiProvider extends ChangeNotifier{
  Gender gender = Gender.male;

  changeGender(Gender value){
    gender = value;
    notifyListeners();
  }
}