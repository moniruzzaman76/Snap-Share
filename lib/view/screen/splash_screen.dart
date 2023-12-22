import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:snapshare/utils/constant.dart';
import 'package:snapshare/view/screen/first_screen.dart';
import 'package:snapshare/view/screen/main_bottom_navigation_screen.dart';

import '../../services/splash_services.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    goToNextScreen();
    super.initState();
  }

  Future<void> goToNextScreen() async {
    if(SplashServices.currentUser != null) {
      debugPrint("User login:${SplashServices.currentUser?.email}");
      Future.delayed(const Duration(seconds: 3)).then(
            (value) {
          Get.offAll(() => const MainBottomNavigationScreen());
        },
      );
    }else {
      Future.delayed(const Duration(seconds: 3)).then(
            (value) {
          Get.offAll(() => const FirstScreen());
        },
      );
    }

  }


  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Image(
              image: AssetImage(Theme.of(context).brightness == Brightness.dark
                  ? Constant.socialLiveTextLogoWhitePNG
                  : Constant.socialLiveTextLogoBlackPNG),
            ),
          ),
          const Spacer(),
          const CircularProgressIndicator(),
          const SizedBox(
            height: 16,
          ),
          const Text("Version 1.0.0"),
          const SizedBox(
            height: 16,
          ),
        ],
      ),
    );
  }
}
