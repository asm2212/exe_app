// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';

class WorkoutRow extends StatelessWidget {
  final Map wObj;
  const WorkoutRow({
    super.key,
    required this.wObj,
  });

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      decoration: BoxDecoration(
        color: ColorExtension.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 2
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              wObj["image"].toString(),
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 15,),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                   wObj["name"].toString(),
                  style: TextStyle(
                    color: ColorExtension.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 5,),
                Text(
                  "${wObj["kcal"].toString()} Calories Burn | ${wObj["time"].toString()} Minutes",
                  style: TextStyle(
                    color: ColorExtension.gray,
                    fontSize: 12,
                  ),
                ),
                   const SizedBox(height: 5,),

                SimpleAnimationProgressBar(
                  height: 15,
                  width: media.width * 0.5,
                  backgroundColor: Colors.grey.shade100,
                  foregrondColor: Colors.purple,
                  ratio: wObj["progress"] as double? ?? 0.0,
                  direction: Axis.horizontal,
                  curve: Curves.fastLinearToSlowEaseIn,
                  duration: const Duration(seconds: 3),
                  borderRadius: BorderRadius.circular(7.5),
                  gradientColor: LinearGradient(
                      colors: ColorExtension.primaryG,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                ),
              ],
            ),),
          IconButton(
            onPressed: (){}, 
            icon: Image.asset(
              "assets/images/next_icon.png",
              width: 30,
              height: 30,
              fit: BoxFit.contain,
            ),
            ),
        ],
      ),
    );
  }
}
