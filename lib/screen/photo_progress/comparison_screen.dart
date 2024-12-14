import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/icon_title_next_row.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/screen/photo_progress/result_screen.dart';
import 'package:flutter/material.dart';


class ComparisonScreen extends StatefulWidget {
  const ComparisonScreen({super.key});

  @override
  State<ComparisonScreen> createState() => _ComparisonScreenState();
}

class _ComparisonScreenState extends State<ComparisonScreen> {
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
          "Comparison",
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
      backgroundColor: ColorExtension.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          children: [
            IconTitleNextRow(
                icon: "assets/images/date.png",
                title: "Select Month 1",
                time: "May",
                onPressed: () {},
                color: ColorExtension.lightGray),
            const SizedBox(
              height: 15,
            ),
            IconTitleNextRow(
                icon: "assets/images/date.png",
                title: "Select Month 2",
                time: "select Month",
                onPressed: () {},
                color: ColorExtension.lightGray),
            const Spacer(),
            RoundButton(
                title: "Compare",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultScreen(
                        date1: DateTime(2023, 5, 1),
                        date2: DateTime(2023, 6, 1),
                      ),
                    ),
                  );
                }),
            const SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }
}