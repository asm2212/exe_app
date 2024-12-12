import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class MealCategoryCell extends StatelessWidget {
  final Map cObj;
  final int index;
  const MealCategoryCell({super.key, required this.index, required this.cObj});

  @override
  Widget build(BuildContext context) {
    bool isEvent = index % 2 == 0;
    return Container(
      margin: const EdgeInsets.all(10),
      width: 100,
      decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: isEvent
                ? [
                    ColorExtension.primaryColor2.withOpacity(0.5),
                    ColorExtension.primaryColor1.withOpacity(0.5)
                  ]
                : [
                    ColorExtension.secondaryColor2.withOpacity(0.5),
                    ColorExtension.secondaryColor1.withOpacity(0.5)
                  ],
          ),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(17.5),
            child: Container(
              decoration: BoxDecoration(
                  color: ColorExtension.white,
                  borderRadius: BorderRadius.circular(17.5)),
              child: Image.asset(
                cObj["image"].toString(),
                width: 45,
                height: 45,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
            child: Text(
              cObj["name"],
              maxLines: 1,
              style: TextStyle(
                  color: ColorExtension.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
          ),
        ],
      ),
    );
  }
}
