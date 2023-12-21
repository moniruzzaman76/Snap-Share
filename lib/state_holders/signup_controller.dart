import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:snapshare/state_holders/storage_controller.dart';

class SignupController extends GetxController{

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  bool _signupInProgress = false;
  bool get signUpInProgress => _signupInProgress;

  final StorageController storageController = Get.put<StorageController>(StorageController());

  String _message ='';
  String get message => _message;

  Future<String> signupUser(String userName, String email, String password, String bio,Uint8List file) async {
    _signupInProgress = true;
    update();

    try{
      UserCredential _userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
          email: email,
          password: password);

      String _photoUrl= await storageController.uploadImage("profilePicture", file, false);

      await _firebaseFirestore.collection("user").doc(_userCredential.user!.uid).set(
          {
            "userName": userName,
            "password": password,
            "userID" : _userCredential.user!.uid,
            "email" : email,
            "bio" : bio,
            "followers": [],
            "following": [],
            "photoUrl" : _photoUrl
          }
      );
      _signupInProgress = false;
      update();
      _message = "success";
    }catch (e){
      if (e is FirebaseAuthException) {
        _message = "${e.code}, ${e.message}";
        _signupInProgress = false;
        update();
      } else {
        _signupInProgress = false;
        update();
      }
    }
    return _message;
  }


}
