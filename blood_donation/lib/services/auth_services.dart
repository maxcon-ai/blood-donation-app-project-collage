import 'package:blood_donation/helper/helper_function.dart';
import 'package:blood_donation/services/database_service.dart';
import 'package:blood_donation/shared/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthService {
  final FirebaseAuth firebaseAuth = FirebaseAuth.instance;

//  login
  Future loginUserWithEmailandPassword(String email, String password) async {
    try{
      User user = (await firebaseAuth.signInWithEmailAndPassword(email:email, password: password)).user!;
      if (user!= null){
        return true;
      }
    } on FirebaseAuthException catch(e){
      print(e);
      return Get.snackbar("Login Error", "${e.code}");
    }
  }


// register
  Future registerUserWithEmailandPassword(
      String fullName, String email, String password) async {
    try{
        User user = (await firebaseAuth.createUserWithEmailAndPassword(email:email, password: password)).user!;
        if (user!= null){
          await DatabaseService(user.uid).saveingUserData(fullName, email, password);
          return true;
        }
    } on FirebaseAuthException catch(e){
      print(e);
      return Get.snackbar("Register Error", "${e.code}");
    }
  }

// signOut
Future signOut() async {
    try{
      await HelperFunctions.saveUserLoggedInStatus(false);
      await HelperFunctions.saveUserEmailSF("");
      await HelperFunctions.saveUserNameSF("");
      await firebaseAuth.signOut();
    }catch (e){
      return null;
    }
}

}
