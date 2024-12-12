import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class NutritionRow extends StatelessWidget {
  final Map nObj;
  const NutritionRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
     var media = MediaQuery.of(context).size;
      var val = double.tryParse(nObj["value"].toString()) ?? 1;
    var maxVal = double.tryParse(nObj["max_value"].toString()) ?? 1;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 15),
      child: Column(children: [
        Row(
          children: [
            Text(
              nObj["title"].toString(),
              style: TextStyle(
                  color: ColorExtension.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              width: 7,
            ),
            Image.asset(
              nObj["image"].toString(),
              width: 22,
              height: 22,
            ),
            const Spacer(),
            Text(
              "${nObj["value"].toString()} ${nObj["unit_name"].toString()}",
              style: TextStyle(color: ColorExtension.gray, fontSize: 14,fontWeight: FontWeight.w500),
            ),
          ],
        ),
        const SizedBox(
          height: 6,
        ),
        SimpleAnimationProgressBar(
          height: 10,
          width: media.width - 30,
          backgroundColor: Colors.grey.shade100,
          foregrondColor: Colors.purple,
          ratio: val / maxVal,
          direction: Axis.horizontal,
          curve: Curves.fastLinearToSlowEaseIn,
          duration: const Duration(seconds: 3),
          borderRadius: BorderRadius.circular(7.5),
          gradientColor: LinearGradient(
              colors: ColorExtension.primaryG,
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
        ),
      ]),
    );
  }
}