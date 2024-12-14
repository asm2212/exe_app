
import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class IconTitleNextRow extends StatelessWidget {
  final String icon;
  final String title;
  final String time;
  final VoidCallback onPressed;
  final Color color;
  const IconTitleNextRow({super.key,
   required this.icon, 
   required this.title, 
   required this.time, 
   required this.onPressed,
    required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 40,
              height: 40,
              alignment: Alignment.center,
              child: Image.asset(
               icon,
                width: 22,
                height: 22,
                fit: BoxFit.contain,
              ),
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                title ,
                style: TextStyle(color: ColorExtension.gray, fontSize: 16,fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(
              width: 120,
              child: Text(
               time  ,
                textAlign: TextAlign.right,
                style: TextStyle(color: ColorExtension.gray, fontSize: 14),
              ),
            ),
            const SizedBox(width: 10),
            SizedBox(
              width: 25,
              height: 25,
              child:  Container(
                  width: 25,
                  height: 25,
                  alignment: Alignment.center,
                  child: Image.asset(
                    "assets/images/p_next.png",
                    width: 12,
                    height: 12,
                    fit: BoxFit.contain,
                  ),
                ),
              
            )
          ],
        ),
      ),
    );
  }
}