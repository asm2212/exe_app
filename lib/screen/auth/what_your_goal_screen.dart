import 'package:carousel_slider/carousel_slider.dart';
import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/screen/auth/next_screen.dart';
import 'package:flutter/material.dart';

class WhatYourGoalScreen extends StatefulWidget {
  const WhatYourGoalScreen({super.key});

  @override
  State<WhatYourGoalScreen> createState() => _WhatYourGoalScreenState();
}

class _WhatYourGoalScreenState extends State<WhatYourGoalScreen> {
   CarouselSliderController buttonCarouselController = CarouselSliderController();
  List goalArr = [
    {
      "image": "assets/images/goal_1.png",
      "title": "Improve Shape",
      "subtitle":
          "I have a low amount of body fat\nand need / want to build more\nmuscle"
    },
    {
      "image": "assets/images/goal_2.png",
      "title": "Lean & Tone",
      "subtitle":
          "I’m “skinny fat”. look thin but have\nno shape. I want to add lean\nmuscle in the right way"
    },
    {
      "image": "assets/images/goal_3.png",
      "title": "Lose a Fat",
      "subtitle":
          "I have over 20 lbs to lose. I want to\ndrop all this fat and gain muscle\nmass"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CarouselSlider(
                items: goalArr.map((gObj) => Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ColorExtension.primaryG,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  padding: EdgeInsets.symmetric(
                    vertical: media.width * 0.1,
                    horizontal: 39,
                  ),
                  alignment: Alignment.center,
                  child: FittedBox(
                    child: Column(
                      children: [
                        Image.asset(
                          gObj["image"].toString(),
                          width: media.width * 0.5,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: media.width * 0.1),
                        Text(
                          gObj["title"].toString(),
                          style: TextStyle(
                            color: ColorExtension.white,
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Container(
                          width: media.width * 0.1,
                          height: 1,
                          color: ColorExtension.white,
                        ),
                        SizedBox(height: media.width * 0.05),
                        Text(
                          gObj["subtitle"].toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: ColorExtension.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                )).toList(),
                carouselController: buttonCarouselController,
                options: CarouselOptions(
                  autoPlay: false,
                  enlargeCenterPage: true,
                  viewportFraction: 0.7,
                  aspectRatio: 0.74,
                  initialPage: 0,
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 25,vertical:5),
              width: media.width,
              child: Column(
                children: [
                  SizedBox(height: media.width * 0.05),
                  Text(
                    "What is your goal?",
                    style: TextStyle(
                      color: ColorExtension.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    "It will help us to choose the best\nprogram for you",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: ColorExtension.gray,
                      fontSize: 12,
                    ),
                  ),
                  const Spacer(),
                  SizedBox(height: media.width * 0.05),
                  RoundButton(
                    title: "Confirm",
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const NextScreen(),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}