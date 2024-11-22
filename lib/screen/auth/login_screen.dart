import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/common_widgets/round_textfield.dart';
import 'package:fit_app/screen/auth/complete_profile_screen.dart';
import 'package:fit_app/screen/auth/register_screen.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isCheck = false;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Hey there",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: ColorExtension.gray,
                  ),
                ),
                Text(
                  "Welcome Back",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: ColorExtension.black,
                  ),
                ),
                SizedBox(
                  height: media.width * 0.05,
                ),
                const RoundTextfield(
                  hintText: "Email",
                  icon: "assets/images/email.png",
                  keyboardType: TextInputType.emailAddress,
                ),
                SizedBox(
                  height: media.width * 0.04,
                ),
                RoundTextfield(
                  hintText: "Password",
                  icon: "assets/images/lock.png",
                  obscureText: true,
                  rightIcon: IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/show_password.png",
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                      errorBuilder: (context, error, stackTrace) {
                        return Icon(
                          Icons.error,
                          color: ColorExtension.gray,
                          size: 20,
                        );
                      },
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Forget your password?",
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorExtension.gray,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    
                  ],
                ),
                SizedBox(
                  height: media.width * 0.5,
                ),
                RoundButton(
                  title: "Login",
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const CompleteProfileScreen(),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 1,
                        color: ColorExtension.gray.withOpacity(0.5),
                      ),
                    ),
                    Text(
                      "  Or  ",
                      style: TextStyle(
                        fontSize: 12,
                        color: ColorExtension.black,
                      ),
                    ),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: ColorExtension.gray.withOpacity(0.5),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorExtension.white,
                          border: Border.all(
                            width: 1,
                            color: ColorExtension.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/images/google.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                    SizedBox(width: media.width * 0.1),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: 40,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: ColorExtension.white,
                          border: Border.all(
                            width: 1,
                            color: ColorExtension.gray.withOpacity(0.4),
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          "assets/images/facebook.png",
                          width: 20,
                          height: 20,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: media.width * 0.03,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterScreen(),
                      ),
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        "Don't have an account yet? ",
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorExtension.black,
                        ),
                      ),
                      Text(
                        " Register",
                        style: TextStyle(
                          fontSize: 12,
                          color: ColorExtension.secondaryColor1,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
