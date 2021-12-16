import 'dart:io';

import 'package:bmi/models/food.dart';
import 'package:bmi/models/status.dart';
import 'package:bmi/models/user.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';


class FireStoreDb {
  FireStoreDb._();

  static FireStoreDb fireStoreHelper = FireStoreDb._();
  FirebaseFirestore firebaseFireStore = FirebaseFirestore.instance;
  FirebaseStorage firebaseStorage = FirebaseStorage.instance;
  addUser(UserInformation user) async {
    await firebaseFireStore
        .collection("Users")
        .doc(user.id)
        .set(user.toMap());
  }

  updateUser(UserInformation user) async {
    await firebaseFireStore
        .collection("Users")
        .doc(user.id)
        .set(user.toMap());
  }
  Future<UserInformation> getUser(String userId) async {
    DocumentSnapshot documentSnapshot =
    await firebaseFireStore.collection("Users").doc(userId).get();
    return UserInformation.fromMap(documentSnapshot.data());
  }
  Future<String> getUserEmailFromFireStoreByUserName(String name) async {
    QuerySnapshot querySnapshot =
    await firebaseFireStore.collection("Users").where("name",isEqualTo: name).get();
    return  querySnapshot.docs.length!=0?querySnapshot.docs[0]["email"]:null;
  }
  addFood(Food food) async {
    firebaseFireStore
        .collection("Foods")
        .doc(food.name)
        .set(food.toMap());
  }
  updateFood(Food food) async {
     await firebaseFireStore
        .collection("Foods")
        .doc(food.name)
        .set(food.toMap());
  }
  Future<Food> getFood(String name) async {
    DocumentSnapshot documentSnapshot =
     await firebaseFireStore.collection("Foods").doc(name).get();
     return Food.fromMap(documentSnapshot.data());
  }

  Future<List<Food>> getAllFoods(String userId) async {
    QuerySnapshot querySnapshot = await firebaseFireStore
        .collection("Foods")
        .where("userId", isEqualTo: userId)
        .get();
         return querySnapshot.docs.map((e) => Food.fromMap(e.data())).toList();  
  }

  deleteFood(String name) async{
    firebaseFireStore.collection("Foods").doc(name).delete();
  }
  addBMIStatus(Status bmiStatus) async {
    firebaseFireStore
        .collection("Status")
        .add(bmiStatus.toMap());
  }

  Future<List<Status>> getAllBMIStatus(String userId) async {
    QuerySnapshot querySnapshot = await firebaseFireStore
        .collection("Status").where("userId", isEqualTo: userId)
        .get();
    return querySnapshot.docs.map((e) => Status.fromMap(e.data())).toList();
  
  }
  Future<String> uploadImg(File file) async{
    String filePath = file.path;
    String fileName = filePath.split('/').last;
    Reference reference = firebaseStorage.ref('images/foods/$fileName');
    await reference.putFile(file);
    return await reference.getDownloadURL();
    
  }

}