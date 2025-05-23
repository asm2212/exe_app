import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common/common.dart';
import 'package:flutter/material.dart';



class TodayMealRow extends StatelessWidget {
  final Map mObj;
  const TodayMealRow({super.key, required this.mObj});

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 2),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: ColorExtension.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                mObj["image"].toString(),
                width: 40,
                height: 40,
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
                    mObj["name"].toString(),
                    style: TextStyle(
                        color: ColorExtension.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  Text(
                     "${getDayTitle(mObj["time"].toString())} | ${getStringDateToOtherFormate(mObj["time"].toString(), outFormatStr: "h:mm aa")}",
                    style: TextStyle(
                      color: ColorExtension.gray,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "assets/images/bell.png",
                width: 35,
                height: 35,
              ),
            ),
          ],
        ),
        );
  }
}