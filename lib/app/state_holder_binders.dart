import 'package:get/get.dart';
import '../state_holders/login_controller.dart';
import '../state_holders/main_bottom_nav_controller.dart';
import '../state_holders/signup_controller.dart';
import '../state_holders/storage_controller.dart';

class StateHolderBinder extends Bindings{
  @override
  void dependencies() {
    Get.put(MainBottomNavController());
    Get.put(SignupController());
    Get.put(StorageController());
    Get.put(LoginController());

  }
}