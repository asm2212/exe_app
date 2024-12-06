
import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class ExercisesRow extends StatelessWidget {
  final Map eObj;
  final VoidCallback onPressed;
  const ExercisesRow({super.key,
   required this.eObj,
   required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5),
            child: Image.asset(
              eObj["image"].toString(),
              width: 65,
              height: 65,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                eObj["title"].toString(),
                style: TextStyle(
                  color: ColorExtension.black, 
                  fontSize: 16, 
                  fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6,),
              Text(
                eObj["value"].toString(),
                style: TextStyle(
                  color: ColorExtension.gray,
                  fontSize: 12,
                  fontWeight: FontWeight.w600
                ),
              ),
            ],
          ),
          ),
          IconButton(
              onPressed: onPressed,
              icon: Image.asset(
                "assets/images/next_go.png",
                width: 25,
                height: 25,
                fit: BoxFit.contain,
              ),
              ),
        ],
      ),
    );
  }
}