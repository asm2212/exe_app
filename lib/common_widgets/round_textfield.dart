import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class RoundTextfield extends StatelessWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String hintText;
  final String icon;
  final Widget? rightIcon;
  final  EdgeInsets? margin;
  final bool obscureText;
  const RoundTextfield({super.key,
   this.controller, 
   required this.hintText, 
   required this.icon, 
   this.margin, 
   this.keyboardType,
   this.obscureText = false, 
   this.rightIcon,
   });

  @override
  Widget build(BuildContext context) {
    return  Container(
      margin: margin,
                  decoration: BoxDecoration(
                      color: ColorExtension.lightGray,
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    controller: controller,
                    keyboardType: keyboardType,
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: hintText,
                      prefixIcon: Container(
                        alignment: Alignment.center,
                        width: 30,
                        height: 30,
                        child: Image.asset(
                          icon,
                          width: 20,
                          height: 20,
                          fit: BoxFit.contain,
                        ),
                      ),
                      hintStyle:
                          TextStyle(color: ColorExtension.gray, fontSize: 13),
                    ),
                  ),
                );
  }
}