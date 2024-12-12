import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class MealFoodScheduleRow extends StatelessWidget {
  final Map mObj;
  final int index;
  const MealFoodScheduleRow({super.key, required this.mObj, required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    color: index % 2 == 0 ? ColorExtension.primaryColor2.withOpacity(0.4) : ColorExtension.secondaryColor2.withOpacity(0.4) ,
                    borderRadius: BorderRadius.circular(10)),
                  alignment: Alignment.center,
                child: Image.asset(
                  mObj["image"].toString(),
                  width: 40,
                  height: 40,
                  fit: BoxFit.contain,
                ),
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
                    mObj["name"].toString(),
                    style: TextStyle(
                        color: ColorExtension.black,
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                    mObj["time"].toString(),
                    style: TextStyle(
                      color:ColorExtension.gray,
                      fontSize: 14,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/next_go.png",
                width: 25,
                height: 25,
              ),
            )
          ],
        ));
  }
}