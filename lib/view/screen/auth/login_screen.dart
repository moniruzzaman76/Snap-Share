import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _isPasswordVisible = true;
  bool isChecked = true;
  final _logInFormKey = GlobalKey<FormState>();
  bool isButtonEnabled = false;

  final TextEditingController emailAddressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    emailAddressController.addListener(updateButtonState);
    passwordController.addListener(updateButtonState);
  }

  void updateButtonState() {
    setState(() {
      isButtonEnabled =
          emailAddressController.text.isNotEmpty && passwordController.text.isNotEmpty;
    });
  }


  void login(){
    FirebaseAuth.instance.signInWithEmailAndPassword(
      email: emailAddressController.text,
      password: passwordController.text,
    ).then((value){
      Get.snackbar(
          "Success", "Login has been done",
          colorText: Colors.white,
          backgroundColor: Colors.green.shade500
      );
    }).onError((error, stackTrace){
      Get.snackbar(
          "Failed!", "Please try Again",
          colorText: Colors.white,
          backgroundColor: Colors.red.shade500
      );
    });
  }


  @override
  Widget build(BuildContext context) {
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
              key: _logInFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Enter your email and password",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontSize: 20
                      ),),
                  const SizedBox(
                    height: 60,
                  ),
                   Text("Email",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16,),
                  TextFormField(
                      controller: emailAddressController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: "Input Email",
                        prefixIcon: Icon(Iconsax.sms)
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Required field is empty';
                        }
                        if (!GetUtils.isEmail(value)) {
                          return 'Please enter valid email';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16,
                  ),
                  Text("Password",
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 16,),
                  TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.phone,
                    obscureText: _isPasswordVisible,
                    decoration: InputDecoration(
                        hintText: "Input Password",
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
                      if (value.length < 6) {
                        return 'The password must be at least 8 characters long';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Row(
                    children: [
                      Transform.scale(
                        scale: 1, // Adjust the scale factor to increase/decrease size
                        child: Checkbox(
                          value: isChecked,
                          onChanged: (value) {
                            setState(() {
                              isChecked = value!;
                            });
                          },
                        ),
                      ),
                      Text("Save password",
                          style: Theme.of(context).textTheme.bodySmall),
                    ],
                  ),

                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: (emailAddressController.text.isNotEmpty &&
                      passwordController.text.isNotEmpty) ? () {
                        if (_logInFormKey.currentState!.validate()) {
                          login();
                        }
                      } : null,
                      child: const Text("Log In"),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),

    );
  }

}


