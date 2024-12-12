import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class FoodInfoDetailsScreen extends StatefulWidget {
  final Map mObj;
  final Map dObj;
  const FoodInfoDetailsScreen({super.key, required this.mObj, required this.dObj});

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
    {"image": "assets/images/flour.png", "title": "Wheat Flour", "value": "100grm"},
    {"image": "assets/images/sugar.png", "title": "Sugar", "value": "3 tbsp"},
    {"image": "assets/images/baking_soda.png", "title": "Baking Soda", "value": "2tsp"},
    {"image": "assets/images/eggs.png", "title": "Eggs", "value": "2 items"},
  ];

  List stepArr = [
    {"no": "1", "detail": "Prepare all of the ingredients that needed"},
    {"no": "2", "detail": "Mix flour, sugar, salt, and baking powder"},
    {
      "no": "3",
      "detail": "In a separate place, mix the eggs and liquid milk until blended",
    },
    {
      "no": "4",
      "detail": "Put the egg and milk mixture into the dry ingredients, Stir until smooth",
    },
    {"no": "5", "detail": "Prepare all of the ingredients that needed again."},
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Container(
      decoration:
          BoxDecoration(gradient: LinearGradient(colors: ColorExtension.primaryG)),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
