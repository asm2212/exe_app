import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/food_step_detail_row.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';

class FoodInfoDetailsScreen extends StatefulWidget {
  final Map mObj;
  final Map dObj;
  const FoodInfoDetailsScreen(
      {super.key, required this.mObj, required this.dObj});

  @override
  State<FoodInfoDetailsScreen> createState() => _FoodInfoDetailsScreenState();
}

class _FoodInfoDetailsScreenState extends State<FoodInfoDetailsScreen> {
  List nutritionArr = [
    {"image": "assets/images/burn.png", "title": "180kCal"},
    {"image": "assets/images/egg.png", "title": "30g fats"},
    {"image": "assets/images/proteins.png", "title": "20g proteins"},
    {"image": "assets/images/carbo.png", "title": "50g carbo"},
  ];

  List ingredientsArr = [
    {
      "image": "assets/images/flour.png",
      "title": "Wheat Flour",
      "value": "100grm"
    },
    {"image": "assets/images/sugar.png", "title": "Sugar", "value": "3 tbsp"},
    {
      "image": "assets/images/baking_soda.png",
      "title": "Baking Soda",
      "value": "2tsp"
    },
    {"image": "assets/images/eggs.png", "title": "Eggs", "value": "2 items"},
  ];

  List stepArr = [
    {"no": "1", "detail": "Prepare all of the ingredients that needed"},
    {"no": "2", "detail": "Mix flour, sugar, salt, and baking powder"},
    {
      "no": "3",
      "detail":
          "In a separate place, mix the eggs and liquid milk until blended",
    },
    {
      "no": "4",
      "detail":
          "Put the egg and milk mixture into the dry ingredients, Stir until smooth",
    },
    {"no": "5", "detail": "Prepare all of the ingredients that needed again."},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(colors: ColorExtension.primaryG)),
      child: NestedScrollView(
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leading: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  margin: const EdgeInsets.all(8),
                  height: 40,
                  width: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: ColorExtension.lightGray,
                      borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    "assets/images/black_btn.png",
                    width: 15,
                    height: 15,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    height: 40,
                    width: 40,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: ColorExtension.lightGray,
                        borderRadius: BorderRadius.circular(10)),
                    child: Image.asset(
                      "assets/images/more_btn.png",
                      width: 15,
                      height: 15,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
            SliverAppBar(
              backgroundColor: Colors.transparent,
              centerTitle: true,
              elevation: 0,
              leadingWidth: 0,
              leading: Container(),
              expandedHeight: media.width * 0.5,
              flexibleSpace: ClipRect(
                child: Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Transform.scale(
                      scale: 1.25,
                      child: Container(
                        width: media.width * 0.55,
                        height: media.width * 0.55,
                        decoration: BoxDecoration(
                          color: Colors.white24,
                          borderRadius:
                              BorderRadius.circular(media.width * 0.275),
                        ),
                      ),
                    ),
                    Transform.scale(
                      scale: 1.25,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Image.asset(
                          widget.dObj["b_image"].toString(),
                          width: media.width * 0.50,
                          height: media.width * 0.50,
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(
            color: ColorExtension.white,
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 50,
                        height: 4,
                        decoration: BoxDecoration(
                          color: ColorExtension.gray.withOpacity(0.3),
                          borderRadius: BorderRadius.circular(3),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: media.width * 0.05),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.dObj["name"].toString(),
                                style: TextStyle(
                                    color: ColorExtension.black,
                                    fontSize: 19,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(height: media.width * 0.02),
                              Text(
                                "by Asmare Admasu ",
                                style: TextStyle(
                                    color: ColorExtension.gray,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Image.asset(
                            "assets/images/fav.png",
                            width: 18,
                            height: 18,
                            fit: BoxFit.contain,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: media.width * 0.08),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Nutrition",
                      style: TextStyle(
                          color: ColorExtension.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  SizedBox(height: media.width * 0.02),
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: nutritionArr.length,
                        itemBuilder: (context, index) {
                          var nObj = nutritionArr[index] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 5),
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    ColorExtension.primaryColor2
                                        .withOpacity(0.4),
                                    ColorExtension.primaryColor1
                                        .withOpacity(0.4)
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(10)),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  nObj["image"].toString(),
                                  width: 20,
                                  height: 20,
                                  fit: BoxFit.contain,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    nObj["title"].toString(),
                                    style: TextStyle(
                                        color: ColorExtension.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ),
                  SizedBox(
                    height: media.width * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Text(
                      "Descriptions",
                      style: TextStyle(
                          color: ColorExtension.black,
                          fontSize: 19,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 6,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: ReadMoreText(
                      'Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being Pancakes are some people\'s favorite breakfast, who doesn\'t like pancakes? Especially with the real honey splash on top of the pancakes, of course everyone loves that! besides being',
                      trimLines: 4,
                      colorClickableText: ColorExtension.black,
                      trimMode: TrimMode.Line,
                      trimCollapsedText: ' Read More ...',
                      trimExpandedText: ' Read Less',
                      style: TextStyle(
                        color: ColorExtension.gray,
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                      moreStyle: const TextStyle(
                          fontSize: 14, fontWeight: FontWeight.w700),
                    ),
                  ),
                  const SizedBox(
                    height: 22,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Ingredients That You\nWill Need",
                          style: TextStyle(
                              color: ColorExtension.black,
                              fontSize: 19,
                              fontWeight: FontWeight.w700),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            "${stepArr.length} Items",
                            style: TextStyle(
                                color: ColorExtension.gray, fontSize: 14),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: (media.width * 0.25) + 40,
                    child: ListView.builder(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: ingredientsArr.length,
                        itemBuilder: (context, index) {
                          var nObj = ingredientsArr[index] as Map? ?? {};
                          return Container(
                            margin: const EdgeInsets.symmetric(horizontal: 4),
                            width: media.width * 0.23,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: media.width * 0.20,
                                  height: media.width * 0.20,
                                  decoration: BoxDecoration(
                                      color: ColorExtension.lightGray,
                                      borderRadius: BorderRadius.circular(10)),
                                  alignment: Alignment.center,
                                  child: Image.asset(
                                    nObj["image"].toString(),
                                    width: 50,
                                    height: 50,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                const SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  nObj["title"].toString(),
                                  style: TextStyle(
                                    color: ColorExtension.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                                const SizedBox(height: 6),
                                Text(
                                  nObj["value"].toString(),
                                  style: TextStyle(
                                    color: ColorExtension.gray,
                                    fontSize: 13,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                  Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Step by Step",
                              style: TextStyle(
                                  color: ColorExtension.black,
                                  fontSize: 19,
                                  fontWeight: FontWeight.w700),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "${stepArr.length} Steps",
                                style:
                                    TextStyle(color: ColorExtension.gray, fontSize: 14,fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                      ),
                                            ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        shrinkWrap: true,
                        itemCount: stepArr.length,
                        itemBuilder: ((context, index) {
                          var sObj = stepArr[index] as Map? ?? {};

                          return FoodStepDetailRow(
                            sObj: sObj,
                            isLast: stepArr.last == sObj,
                          );
                        }),
                      ),
                       SizedBox(
                        height: media.width * 0.1,
                      ),
                       SafeArea(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: RoundButton(
                            title: "Add to ${widget.mObj["name"]} Meal",
                            onPressed: () {
                             
                            }),
                      ),
                    ],
                  ),
                ),           SizedBox(
                        height: media.width * 0.07,
                      ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
