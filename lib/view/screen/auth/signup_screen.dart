import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snapshare/utils/colors.dart';
import 'package:snapshare/utils/constant.dart';
import 'package:snapshare/view/screen/auth/login_screen.dart';
import 'package:snapshare/view/screen/main_bottom_navigation_screen.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool _isPasswordVisible = true;
  final _signUpFormKey = GlobalKey<FormState>();
  Uint8List? _profileImage;

  final TextEditingController userNameController = TextEditingController();
  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController bioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _signUpFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                       Center(
                        child: _profileImage != null ? CircleAvatar(
                          radius: screenWidth * 0.160,
                          backgroundColor: const Color(0xFF4478FF),
                          child: CircleAvatar(
                            backgroundColor: Colors.white,
                            backgroundImage: MemoryImage(_profileImage!),
                            radius: screenWidth * 0.155,
                          ),
                        ) : CircleAvatar(
                          backgroundColor: Colors.white,
                          backgroundImage:
                          const AssetImage(Constant.profilePicturePlaceholderPNG),
                          radius: screenWidth * 0.155,
                        ),
                      ),
                      Positioned(
                        bottom: screenHeight * 0.001,
                        left: screenWidth * 0.5,
                        child: CircleAvatar(
                          backgroundColor: const Color(0xFF4478FF),
                          radius: screenWidth * 0.053,
                          child: CircleAvatar(
                            radius: screenWidth * 0.049,
                            backgroundColor: Colors.grey.shade300,
                            child: IconButton(
                              onPressed: () {
                                selectImage();
                              },
                              icon: const Icon(
                                Iconsax.camera,
                                size: 20,
                                color: Colors.black ,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("User Name",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      controller: userNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "User Name",
                          prefixIcon: Icon(Iconsax.user)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field is empty';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("Email",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      controller: emailAddressController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Email",
                        prefixIcon: Icon(Iconsax.sms),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field is empty';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return "Please enter valid email";
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("Password",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: _isPasswordVisible,
                    decoration: InputDecoration(
                        hintText: "Password",
                        prefixIcon: const Icon(Iconsax.lock_1),
                        suffixIcon: IconButton(
                          onPressed: () {
                            if (mounted) {
                              _isPasswordVisible = !_isPasswordVisible;
                              setState(() {});
                            }
                          },
                          icon: _isPasswordVisible
                              ? const Icon(Iconsax.eye_slash)
                              : const Icon(
                                  Iconsax.eye,
                                ),
                        )),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Required field is empty';
                      }
                      if (value.length < 8) {
                        return 'The password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("Bio",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(
                    height: 16,
                  ),
                  TextFormField(
                      controller: bioController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: "Bio",
                          prefixIcon: Icon(Iconsax.info_circle)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field is empty';
                        }
                        return null;
                      },),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (_signUpFormKey.currentState!.validate()) {
                          Get.to(()=> const MainBottomNavigationScreen());
                        }
                      },
                      child: const Text("Sign Up"),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Have an account?",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, letterSpacing: 0.5),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child:  Text("Log In",
                            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                              color: AppColors.primaryColor,
                              fontWeight: FontWeight.w600
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

  Future<void> selectImage() async {
     ImagePicker _imagePicker = ImagePicker();
     XFile? _file = await _imagePicker.pickImage(source: ImageSource.gallery);

     if (_file != null) {
       Uint8List image = await _file.readAsBytes();
       setState(() {
       });
       _profileImage = image;

     }
  }
}
