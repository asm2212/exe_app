// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/meal_category_cell.dart';
import 'package:fit_app/common_widgets/meal_recommend_cell.dart';
import 'package:fit_app/common_widgets/popular_meal_row.dart';
import 'package:fit_app/screen/meal_planner/food_info_details_screen.dart';
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
      "b_image": "assets/images/pancake_1.png",
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
    var media = MediaQuery.of(context).size;

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
              color: ColorExtension.black,
              fontSize: 19,
              fontWeight: FontWeight.w700),
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
      backgroundColor: ColorExtension.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: const EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                  color: ColorExtension.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(
                        color: Colors.black12,
                        blurRadius: 2,
                        offset: Offset(0, 1)),
                  ]),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textSearch,
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          enabledBorder: InputBorder.none,
                          prefixIcon: Image.asset(
                            "assets/images/search.png",
                            width: 30,
                            height: 30,
                          ),
                          hintText: "Search Pancake"),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    width: 1,
                    height: 25,
                    color: ColorExtension.gray.withOpacity(0.3),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Image.asset(
                      "assets/images/Filter.png",
                      width: 29,
                      height: 29,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: media.width * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    "Category",
                    style: TextStyle(
                        color: ColorExtension.black,
                        fontSize: 19,
                        fontWeight: FontWeight.w700),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 120,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: categoryArr.length,
                  itemBuilder: (context, index) {
                    var cObj = categoryArr[index] as Map? ?? {};
                    return MealCategoryCell(
                      cObj: cObj,
                      index: index,
                    );
                  },
                  ),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Recommendation\nfor Diet",
                style: TextStyle(
                    color: ColorExtension.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: media.width * 0.7,
              child: ListView.builder(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  scrollDirection: Axis.horizontal,
                  itemCount: recommendArr.length,
                  itemBuilder: (context, index) {
                    var fObj = recommendArr[index] as Map? ?? {};
                    return MealRecommendCell(
                      fObj: fObj,
                      index: index,
                    );
                  }),
            ),
            SizedBox(
              height: media.width * 0.05,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Text(
                "Popular",
                style: TextStyle(
                    color: ColorExtension.black,
                    fontSize: 19,
                    fontWeight: FontWeight.w700),
              ),
            ),
            ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: popularArr.length,
                itemBuilder: (context, index) {
                  var fObj = popularArr[index] as Map? ?? {};
                 return InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => FoodInfoDetailsScreen(
                            dObj: fObj,
                            mObj: widget.eObj,
                          ),
                        ),
                      );
                    },
                    child: PopularMealRow(
                      mObj: fObj,
                    ),
                  );
                }
                ),
            SizedBox(
              height: media.width * 0.05,
            ),
          ],
        ),
      ),
    );
  }
}
