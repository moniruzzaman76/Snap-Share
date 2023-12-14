import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:snapshare/view/screen/searching_photo_scree.dart';
import 'package:snapshare/view/screen/upload_user_photo_screen.dart';
import '../../state_holders/main_bottom_nav_controller.dart';
import '../../utils/colors.dart';
import '../widget/upload_photo_alert_dialog.dart';
import 'home_screen.dart';
import 'my_profile_screen.dart';

class MainBottomNavigationScreen extends StatefulWidget {
  const MainBottomNavigationScreen({super.key});

  @override
  State<MainBottomNavigationScreen> createState() => _MainBottomNavigationScreenState();
}

class _MainBottomNavigationScreenState extends State<MainBottomNavigationScreen> {

  final List<Widget> _screens = [
    const HomeScreen(),
    const SearchingPhotoScreen(),
    const UploadUserPhotoScreen(),
    const MyProfileScreen(),
  ];


  @override
  Widget build(BuildContext context) {
    Theme.of(context).brightness;
    return GetBuilder<MainBottomNavController>(
        builder: (controller) {
          return Scaffold(
            body: _screens[controller.selectedIndex],
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: controller.selectedIndex,
              onTap: (index) {
                if (index == 2) {
                  uploadPhotoAlertDialog(context);
                  controller.changeScreen(0); // Reset to home after showing the dialog
                } else {
                  // Handle taps for other buttons
                  controller.changeScreen(index);
                }
              },
              backgroundColor: Theme.of(context).brightness == Brightness.dark ?
              AppColors.darkBackgroundColor : AppColors.lightBackgroundColor,
              selectedItemColor: AppColors.primaryColor,
              unselectedItemColor: Theme.of(context).brightness == Brightness.dark ?
              AppColors.lightBackgroundColor : AppColors.darkBackgroundColor,
              showUnselectedLabels: false,
              elevation: 0,
              type: BottomNavigationBarType.fixed,

              items: const [
                BottomNavigationBarItem(
                    icon: Icon(Iconsax.home,), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Iconsax.search_normal_1,), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Iconsax.add,), label: ""),
                BottomNavigationBarItem(
                    icon: Icon(Iconsax.profile_circle,), label: ""),
              ],
            ),
          );
        }
    );
  }

}



