import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/common_widgets/round_textfield.dart';
import 'package:fit_app/screen/auth/complete_profile_screen.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
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
                    "Create an Account",
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
                      hintText: "First Name",
                      icon: "assets/images/user_text.png"),
                  SizedBox(
                    height: media.width * 0.04,
                  ),
                  const RoundTextfield(
                      hintText: "Last Name",
                      icon: "assets/images/user_text.png"),
                  SizedBox(
                    height: media.width * 0.04,
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
                    rightIcon: TextButton(
                      onPressed: () {},
                      child: Container(
                        alignment: Alignment.center,
                        width: 20,
                        height: 20,
                        child: Image.asset(
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
                  ),
                  Row(
                    children: [
                    IconButton(
                      onPressed: (){
                        setState(() {
                          isCheck =! isCheck;
                        });
                      },
                       icon: Icon(
                        isCheck ? Icons.check_box_outlined : Icons.check_box_outline_blank_outlined,
                        color: ColorExtension.gray,
                        size: 20,
                       )
                       ),
                      
                          Expanded(
                           child: Text(
                            "By continuing you accept our terms and conditions",
                            style: TextStyle(
                              fontSize: 10,
                              color: ColorExtension.gray,
                            ),
                           ),
                         ),
                       
                    ],
                  ),
                        SizedBox(
                    height: media.width * 0.1,
                  ),
                  RoundButton(
                    title: "Register", 
                  onPressed: (){
                  Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (context) => 
                   const CompleteProfileScreen())
                  );
                  }
                  ),
                  SizedBox(
                    height: media.width * 0.02,
                  ),
                   Row(
                      children:[
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
                          )
                        ),
                          Expanded(
                            child: Container(
                            height: 1,
                            color: ColorExtension.gray.withOpacity(0.5),
                                                    ),
                          ),
                      ]
                    ),
                             SizedBox(
                    height: media.width * 0.02,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                      onTap: (){},
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
                      SizedBox(width: media.width *0.1,),
                        GestureDetector(
                      onTap: (){},
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
                    height: media.width * 0.02,
                   
                  ),
                  TextButton(
                    onPressed: (){},
                     child:Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an Account? ",
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorExtension.black,
                          )
                        ),
                         Text(
                          " Login",
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorExtension.secondaryColor1,
                            fontWeight: FontWeight.w700,
                          )
                        ),

                      ],
                     )
                      )
                ],
              ),
            ),
          ),
        ));
  }
}
