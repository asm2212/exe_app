import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class OnBoardingView extends StatelessWidget {
  final Map pObj;
  const OnBoardingView({super.key, required this.pObj});

  @override
  Widget build(BuildContext context) {
     var media = MediaQuery.of(context).size;
            return SizedBox(
            width: media.width,
            height: media.height,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
              Image.asset(
                pObj["image"].toString(),
                width: media.width,
                ),
                SizedBox(height: media.width*0.1,),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                 pObj["title"].toString(),
                  style: TextStyle(
                    color: ColorExtension.black,
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                ),
                 Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  pObj["subtitle"].toString(),
                  style: TextStyle(
                    color: ColorExtension.gray,
                    fontSize: 12,
                  ),
                ),
                ),
              ],)
            );
  }
}