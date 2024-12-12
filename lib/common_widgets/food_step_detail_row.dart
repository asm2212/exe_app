import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class FoodStepDetailRow extends StatelessWidget {
  final Map sObj;
  final bool isLast;
  const FoodStepDetailRow({super.key, required this.sObj, this.isLast = false});

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 20,
              height: 20,
              decoration: BoxDecoration(
                color: ColorExtension.secondaryColor1,
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Container(
                width: 18,
                height: 18,
                decoration: BoxDecoration(
                  border: Border.all(color: ColorExtension.white, width: 3),
                  borderRadius: BorderRadius.circular(9),
                ),
              ),
            ),
            if (!isLast)
              DottedDashedLine(
                  height: 50,
                  width: 0,
                  dashColor: ColorExtension.secondaryColor1,
                  axis: Axis.vertical)
          ],
        ),
        const SizedBox(
          width: 10,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Step ${ sObj["no"].toString()}",
                style: TextStyle(
                  color: ColorExtension.black,
                  fontSize: 17,
                  fontWeight: FontWeight.w700
                ),
              ),
              Text(
                sObj["detail"].toString(),
                style: TextStyle(color: ColorExtension.gray, fontSize: 15,fontWeight: FontWeight.w500),
              ),
            ],
          ),
        )
      ],
    );
  }
}