import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../view/screen/auth/login_screen.dart';
import '../view/screen/auth/signup_screen.dart';


class SplashServices {
  static final _auth= FirebaseAuth.instance;
  static User? get currentUser => _auth.currentUser;

}
