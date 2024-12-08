// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/common_widgets/step_detail_row.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:fit_app/common/color_extension.dart';
import 'package:readmore/readmore.dart';

class ExerciseDetailScreen extends StatefulWidget {
  final Map eObj;
  const ExerciseDetailScreen({
    super.key,
    required this.eObj,
  });

  @override
  State<ExerciseDetailScreen> createState() => _ExerciseDetailScreenState();
}

class _ExerciseDetailScreenState extends State<ExerciseDetailScreen> {
  List stepArr = [
    {
      "no": "01",
      "title": "Spread Your Arms",
      "detail":
          "To make the gestures feel more relaxed, stretch your arms as you start this movement. No bending of hands."
    },
    {
      "no": "02",
      "title": "Rest at The Toe",
      "detail":
          "The basis of this movement is jumping. Now, what needs to be considered is that you have to use the tips of your feet"
    },
    {
      "no": "03",
      "title": "Adjust Foot Movement",
      "detail":
          "Jumping Jack is not just an ordinary jump. But, you also have to pay close attention to leg movements."
    },
    {
      "no": "04",
      "title": "Clapping Both Hands",
      "detail":
          "This cannot be taken lightly. You see, without realizing it, the clapping of your hands helps you to keep your rhythm while doing the Jumping Jack"
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorExtension.white,
        elevation: 0,
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
              margin: const EdgeInsets.all(10),
              height: 45,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorExtension.lightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/images/closed_btn.png",
                fit: BoxFit.contain,
                height: 15,
                width: 15,
              )),
        ),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.all(10),
                height: 45,
                width: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorExtension.lightGray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/images/more_btn.png",
                  fit: BoxFit.contain,
                  height: 12,
                  width: 12,
                )),
          ),
        ],
      ),
      backgroundColor: ColorExtension.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      gradient: LinearGradient(colors: ColorExtension.primaryG),
                    ),
                    child: Image.asset(
                      "assets/images/video_temp.png",
                      width: media.width,
                      height: media.width * 0.43,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    width: media.width,
                    height: media.width * 0.43,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: ColorExtension.black.withOpacity(0.5),
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Image.asset(
                      "assets/images/Play.png",
                      width: 40,
                      height: 40,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 18,
              ),
              Text(
                widget.eObj["title"].toString(),
                style: TextStyle(
                    color: ColorExtension.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "Easy | 390 Calories Burn",
                style: TextStyle(
                  color: ColorExtension.gray,
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 22,
              ),
              Text(
                "Descriptions",
                style: TextStyle(
                  color: ColorExtension.black,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 8,
              ),
              ReadMoreText(
                'A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide A jumping jack, also known as a star jump and called a side-straddle hop in the US military, is a physical jumping exercise performed by jumping to a position with the legs spread wide',
                trimLines: 4,
                colorClickableText: ColorExtension.black,
                trimMode: TrimMode.Line,
                trimCollapsedText: ' Read More ...',
                trimExpandedText: ' Read Less',
                style: TextStyle(
                  color: ColorExtension.gray,
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                ),
                moreStyle: TextStyle(
                    fontSize: 16,
                    color: ColorExtension.black,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "How To Do It",
                    style: TextStyle(
                        color: ColorExtension.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "${stepArr.length} Steps",
                      style: TextStyle(
                          color: ColorExtension.gray,
                          fontSize: 14,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: stepArr.length,
                itemBuilder: ((context, index) {
                  var sObj = stepArr[index] as Map? ?? {};
                  return StepDetailRow(
                    sObj: sObj,
                    isLast: stepArr.last == sObj,
                  );
                }),
              ),
              const SizedBox(height: 20),
              Text(
                "Custom Repetitions",
                style: TextStyle(
                    color: ColorExtension.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
                            const SizedBox(height: 20),
               SizedBox(
                height: 180,
                child: CupertinoPicker.builder(
                  itemExtent: 40,
                  selectionOverlay: Container(
                    width: double.maxFinite,
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(color: ColorExtension.gray.withOpacity(0.2), width: 1),
                        bottom: BorderSide(
                            color: ColorExtension.gray.withOpacity(0.2), width: 1),
                      ),
                    ),
                  ),
                  onSelectedItemChanged: (index) {},
                  childCount: 60,
                  itemBuilder: (context, index) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(
                          "assets/images/burn.png",
                          width: 18,
                          height: 18,
                          fit: BoxFit.contain,
                        ),
                        const SizedBox(width: 5),
                        Text(
                          " ${(index + 1) * 15} Calories Burn",
                          style: TextStyle(
                            color: ColorExtension.gray,
                             fontSize: 16,
                             fontWeight: FontWeight.w500),
                        ),
                                const SizedBox(width: 5),
                        Text(
                          " ${index + 1} ",
                          style: TextStyle(
                              color: ColorExtension.gray,
                              fontSize: 28,
                              fontWeight: FontWeight.w700),
                        ),
                          const SizedBox(width: 5),
                        Text(
                          " times",
                          style: TextStyle(
                            color: ColorExtension.gray,
                             fontSize: 18,
                             fontWeight: FontWeight.w600
                             ),
                        )
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              RoundButton(title: "Save", elevation: 0, onPressed: () {}),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
