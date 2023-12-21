import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import '../../../state_holders/login_controller.dart';
import '../../widget/show_snackbar.dart';
import '../main_bottom_navigation_screen.dart';


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
                      if (value.length < 8) {
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
                  GetBuilder<LoginController>(
                      builder: (loginController) {
                        if(loginController.loginInProgress){
                          return const Center(
                            child: CircularProgressIndicator(
                            ),
                          );
                        }
                        return SizedBox(
                          width: double.infinity,
                          child: ElevatedButton (
                            onPressed: (emailAddressController.text.isNotEmpty &&
                                passwordController.text.isNotEmpty) ? () async{
                              if (_logInFormKey.currentState!.validate()) {
                                String message = await loginController.loginUser(
                                    emailAddressController.text,
                                    passwordController.text);
                                if (message == "success"){
                                  if (mounted){
                                    showSnackBar(loginController.message, context,Colors.green[500], true);
                                    Get.to(()=> const MainBottomNavigationScreen());
                                  }
                                }else{
                                  if (mounted){
                                    showSnackBar(loginController.message, context, Colors.red[500], false);
                                  }
                                }
                              }
                            } : null,
                            child: const Text("Log In"),
                          ),
                        );
                      }
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


