import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class LoginController extends GetxController{
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  bool _loginInProgress = false;
  bool get loginInProgress => _loginInProgress;

  String _message ='';
  String get message => _message;

  Future<String> loginUser(String email, String password) async {
    _loginInProgress = true;
    update();

    try{
       await _firebaseAuth.signInWithEmailAndPassword(
           email: email, password: password);

       _loginInProgress = false;
      update();
      _message = "success";
    } catch (e){
      if (e is FirebaseAuthException) {
        _message = "${e.code}, ${e.message}";
        _loginInProgress = false;
          update();
      } else {
          _loginInProgress = false;
          update();
      }
    }
    return _message;
  }


}