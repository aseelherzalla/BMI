
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Authentication {
  Authentication._();
  static Authentication authHelper = Authentication._();

 
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  Future<bool> register(String email,String password) async{
    try{
      UserCredential userCredential = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      return true;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        showToast('Password is weak');
      } else if (e.code == 'email-already-in-use') {
        showToast('Email Already in use');
      }
      else if (e.code == 'invalid-email') {
        showToast('Email is invalid');
      }
      return false;
    } catch (e) {
      showToast(e.toString());
      return false;
    }
  }
  Future<bool> logIn(String email,String password) async{
    try{
      await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      return true;
    }
    on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        showToast('User not found');
        return false;
      } else if (e.code == 'wrong-password') {
        showToast('Wrong Password');
        return false;
      }
      else if (e.code == 'invalid-email') {
        showToast('Email is  invalid');
        return false;
      }
    }on Exception catch (e) {
      showToast(e.toString());
      return false;
    }

  }
   showToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      backgroundColor: Color(0xFF1588d8),
    );
  }
  User getCurrentUser(){
    return firebaseAuth.currentUser;
  }
  logout() async{
    await firebaseAuth.signOut();
}}