import 'dart:io';

import 'package:bmi/helpers/authentication.dart';
import 'package:bmi/helpers/firestore_db.dart';
import 'package:bmi/helpers/homePageFun.dart';
import 'package:bmi/main.dart';
import 'package:bmi/models/food.dart';
import 'package:bmi/models/status.dart';
import 'package:bmi/models/user.dart';
import 'package:bmi/pages/addmealdetails.dart';
import 'package:bmi/pages/completinformation_page.dart';
import 'package:bmi/pages/home_page.dart';
import 'package:bmi/pages/login_page.dart';
import 'package:bmi/pages/router.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';



class BmiProvider extends ChangeNotifier{
  TextEditingController nameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController repasswordController=TextEditingController();
  TextEditingController foodName=TextEditingController();
  TextEditingController foodUnitController=TextEditingController();
  TextEditingController amountController=TextEditingController();
  User user;
  List<Food> foodList = [];
  UserInformation userInfo;
  Gender gender = Gender.male;
  List<Status> statuses = [];
  Status currentStatus ;
  double length =100;
  double weight =40;
  String date='';
  String time='';
  File imagePath;
  File updeatedImagePath;
  String imgUrl;
  String updeatedimgUrl;
  Food editedFoodItem;
  String stutes;
  
  

  List<String> foodCategory = [
    'fruits',
    'vegetables',
    'fastfood',
  ];
   List<String> foodunit = [
     'cal/g',
    'cal/spoon',
    'cal/cup',
    'cal/piece'
  ];
  String selectedItem;
  String selectedUnit;
  BmiProvider (){
    selectedItem = foodCategory.first;
    selectedUnit = foodunit.first;
    notifyListeners();
  }
  changeSelectedItem(String value){
  selectedItem=value;
  notifyListeners();
  }
  changeEditedFood(Food value){
  editedFoodItem=value;
  notifyListeners();
  }
  changeSelectedUnit(String value){
  selectedUnit=value;
  notifyListeners();
  }

  changeGender(Gender value){
    gender = value;
    notifyListeners();
  }
  changeWeight(double value){
    if(value>=40&&value<=250){
      weight = value;
    }
    else{
      weight = 40;
    }
    notifyListeners();
  }
   clear() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    repasswordController.clear();
  }
  clearRecordFields(){
    weight = 30;
    length = 120;
    date = '';
    time = '';
  }
  fillItems(){
    foodName.text = editedFoodItem.name;
    selectedUnit=editedFoodItem.unit;
    foodUnitController.text = editedFoodItem.calory.toString();
    selectedItem = editedFoodItem.category;
    notifyListeners();
  }

   logout() async{
   await Authentication.authentication.logout();
    clear();
    RouterHelper.router.pushReplacementNamed(LoginPage.router);
}
  changeLength(double value){
    if(value>=100&&value<=200){
      length = value;
    }
    else{
      length = 100;
    }
    notifyListeners();
  }
  changDate(BuildContext context) async {
    date = await showDatePicker(
        context: context,
        initialDate: DateTime((DateTime.now().year) - 1),
        firstDate: DateTime(1980),
        lastDate: DateTime((DateTime.now().year)))
        .then((value) => value == null ?'' : DateFormat.y().format(value));
    notifyListeners();
  }
  changTime(BuildContext context) async {
    time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then((value) => value == null ? '' : value.format(context));
    notifyListeners();
  }

  updatUser(UserInformation userInformation){
userInfo=userInformation;
notifyListeners();
  }
 
  addUser()async{
    await FireStoreDb.fireStoreDb.addUser(userInfo);
  }
  addStutes(Status status)async{
    await FireStoreDb.fireStoreDb.addBMIStatus(status);
    await getAllStatus();
    Authentication.authentication.showToast('addStatus');
  }
  updateFood(Food food) async{
    await FireStoreDb.fireStoreDb.updateFood(food);
    await cleanFields();
    await getAllFoods();
  }

  
  getCurrentUser(){
    user=Authentication.authentication.getCurrentUser();
    notifyListeners();
  }
  getUser() async{
    userInfo = await FireStoreDb.fireStoreDb.getUser(user.uid);
    notifyListeners();
  }
  getAllFoods() async{
    foodList = await FireStoreDb.fireStoreDb.getAllFoods(user.uid);
    foodList = foodList.reversed.toList();
    notifyListeners();
  }
  getAllStatus() async{
    statuses = await  FireStoreDb.fireStoreDb.getAllStatus(user.uid);
    notifyListeners();
    statuses.sort((a,b){
      return a.date.compareTo(b.date);
    });
    currentStatus = statuses.last;
    statuses.removeLast();
    statuses = statuses.reversed.toList();
    notifyListeners();
    }
    ///////////////////////////////////////////
    String changeStatus(){
      stutes=HomePageFun.calculateBMIStatus(userInfo, currentStatus.weight, currentStatus.height);
    return HomePageFun.changeStatus(currentStatus: currentStatus,statuses: statuses,userData: userInfo,status: stutes);
  }
  CreateButton() async{
    if(nameController.text!=''&&emailController.text!=''&&passwordController.text!=''&& repasswordController.text!=''){
      if(passwordController.text ==  repasswordController.text){
        bool value = await Authentication.authentication.register(emailController.text, passwordController.text);
        if(value){
          getCurrentUser();
          userInfo = UserInformation(id: user.uid, name: nameController.text, email: emailController.text);
          RouterHelper.router.pushReplacementNamed(CompleteInformation.router);
          clear();
        }
      }
      else{
        Authentication.authentication.showToast('passNotMatch');
      }
    }
    else{
      Authentication.authentication.showToast('fillAllFields');
    }
  }
  
  loginButton() async{
    if (nameController.text != '' && passwordController.text != ''){
      String email = await FireStoreDb.fireStoreDb.getUserEmail(nameController.text.trim());
      if (email != null) {
        bool result = await Authentication.authentication
            .logIn(email, passwordController.text.trim());
        if (result) {
          getCurrentUser();
          //getData();
          RouterHelper.router.pushReplacementNamed(HomePage.router);
        }
      } else {
        Authentication.authentication.showToast('noUserName');
      }
    } else {
      Authentication.authentication.showToast('fillAllFields');
    }
    clear();
    }
    
  allUserData(){
    getUser();
    getAllStatus();
    getAllFoods();
  }
  isLogin() async {
    getCurrentUser();
    if(user==null){
      RouterHelper.router.pushReplacementNamed(LoginPage.router);
    }
    else{
      await allUserData();
      RouterHelper.router.pushReplacementNamed(HomePage.router);
    }
  }
  addFood(Food food) async{
    await FireStoreDb.fireStoreDb.addFood(food);
    await cleanFields();
    await getAllFoods();
  }
  cleanFields(){
    foodName.clear();
    foodUnitController.clear();
    selectedItem = foodCategory.first;
    selectedUnit = foodunit.first;
    editedFoodItem = null;
    amountController.clear();
    imagePath = null;
    notifyListeners();
  }
    pickImage() async{
    XFile imgFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(imgFile != null){
      imagePath = File(imgFile.path);
      notifyListeners();
    }
  }
  updatImage() async{
    XFile imgFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if(imgFile != null){
      updeatedImagePath = File(imgFile.path);
      notifyListeners();
    }
  }
  getImgUrl()async{
    imgUrl= await FireStoreDb.fireStoreDb.uploadImg(imagePath);
    notifyListeners();
  }
  
  deleteFoodItem(String name) async{
    await FireStoreDb.fireStoreDb.deleteFood(name);
    await getAllFoods();
    Authentication.authentication.showToast('item has been deleted');
  }
  Future<String> yloveA()async {
    String imgUrl = '';
    if(updeatedImagePath!=null){
      imgUrl = await FireStoreDb.fireStoreDb.uploadImg(updeatedImagePath);
    }
    else{
      imgUrl =editedFoodItem.img;
    }
    return imgUrl;
  }

  }

