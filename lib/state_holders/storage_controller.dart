import 'dart:typed_data';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';

class StorageController extends GetxController{

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String> uploadImage(String childName,Uint8List file,bool isPost) async {

    Reference reference=  _firebaseStorage.ref(childName).child(_firebaseAuth.currentUser!.uid);

    UploadTask uploadTask = reference.putData(file);

    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadUrl= await taskSnapshot.ref.getDownloadURL();
    return downloadUrl;
  }


}