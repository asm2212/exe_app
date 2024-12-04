import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';


class SettingRow extends StatelessWidget {
  final String icon;
  final String title;
  final VoidCallback onPressed;
  const SettingRow({super.key,
   required this.icon, 
   required this.title, 
   required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: SizedBox(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              icon,
                height: 25, 
                width: 25,
                 fit: BoxFit.contain
                 ),
            const SizedBox(
              width: 15,
            ),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  color: ColorExtension.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500
                ),
              ),
            ),
            Image.asset(
              "assets/images/p_next.png",
                height: 14,
                 width: 14, 
                 fit: BoxFit.contain)
          ],

        ),
      ),
    );
  }
}