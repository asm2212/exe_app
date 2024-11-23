import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class TabButton extends StatelessWidget {
  final String icon;
  final String selectIcon;
  final VoidCallback onTap;
  final bool isActive;
  const TabButton({super.key,
   required this.icon,
    required this.selectIcon,
     required this.onTap, 
     required this.isActive
     });

  @override
  Widget build(BuildContext context) {
    return  InkWell(
                  onTap:onTap,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                    Image.asset(
                     isActive ? selectIcon : icon,
                      height: 24,
                      width: 24,
                      fit: BoxFit.fitWidth,
                    ),
                    SizedBox(
                      height: isActive ? 4: 12
                      ,),
                    if(isActive)
                    Container(
                      height: 4,
                      width: 4,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: ColorExtension.secondaryG,
                          ),
                          borderRadius: BorderRadius.circular(2),
                      ),
                    )
                  ],
                  ),
                );
  }
}