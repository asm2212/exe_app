// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class MealFoodDetailsScreen extends StatefulWidget {
  final Map eObj;
  const MealFoodDetailsScreen({
    super.key,
    required this.eObj,
  });

  @override
  State<MealFoodDetailsScreen> createState() => _MealFoodDetailsScreenState();
}

class _MealFoodDetailsScreenState extends State<MealFoodDetailsScreen> {

    TextEditingController textSearch = TextEditingController();

  List categoryArr = [
    {
      "name": "Salad",
      "image": "assets/images/c_1.png",
    },
    {
      "name": "Cake",
      "image": "assets/images/c_2.png",
    },
    {
      "name": "Pie",
      "image": "assets/images/c_3.png",
    },
    {
      "name": "Smoothies",
      "image": "assets/images/c_4.png",
    },
    {
      "name": "Salad",
      "image": "assets/images/c_1.png",
    },
    {
      "name": "Cake",
      "image": "assets/images/c_2.png",
    },
    {
      "name": "Pie",
      "image": "assets/images/c_3.png",
    },
    {
      "name": "Smoothies",
      "image": "assets/images/c_4.png",
    },
  ];


  List popularArr = [
    {
      "name": "Blueberry Pancake",
      "image": "assets/images/f_1.png",
      "b_image":"assets/images/pancake_1.png",
      "size": "Medium",
      "time": "30mins",
      "kcal": "230kCal"
    },
    {
      "name": "Salmon Nigiri",
      "image": "assets/images/f_2.png",
       "b_image": "assets/images/nigiri.png",
      "size": "Medium",
      "time": "20mins",
      "kcal": "120kCal"
    },
  ];


  List recommendArr = [
    {
      "name": "Honey Pancake",
      "image": "assets/images/rd_1.png",
      "size": "Easy",
      "time": "30mins",
      "kcal": "180kCal"
    },
    {
      "name": "Canai Bread",
      "image": "assets/images/m_4.png",
      "size": "Easy",
      "time": "20mins",
      "kcal": "230kCal"
    },
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorExtension.white,
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
        title: Text(
          widget.eObj["name"].toString(),
          style: TextStyle(
              color: ColorExtension.black, fontSize: 19, fontWeight: FontWeight.w700),
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
          )
        ],
      ),
    );
  }
}