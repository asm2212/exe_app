import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/icon_title_next_row.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AddScheduleScreen extends StatefulWidget {
  final DateTime date;
  const AddScheduleScreen({super.key, required this.date});

  @override
  State<AddScheduleScreen> createState() => _AddScheduleScreenState();
}

class _AddScheduleScreenState extends State<AddScheduleScreen> {
  // Method to format DateTime to a string
  String dateToString(DateTime date, {required String formatStr}) {
    return DateFormat(formatStr).format(date);
  }

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
              "assets/images/closed_btn.png",
              width: 15,
              height: 15,
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: Text(
          "Add Schedule",
          style: TextStyle(
              color: ColorExtension.black,
              fontSize: 16,
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
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Image.asset(
                  "assets/images/date.png",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(
                  width: 8,
                ),
                Text(
                  dateToString(widget.date, formatStr: "E, dd MMMM yyyy"),
                  style:
                      TextStyle(color: ColorExtension.gray, fontSize: 14),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Time",
              style: TextStyle(
                  color: ColorExtension.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: media.width * 0.35,
              child: CupertinoDatePicker(
                onDateTimeChanged: (newDate) {},
                initialDateTime: DateTime.now(),
                use24hFormat: false,
                minuteInterval: 1,
                mode: CupertinoDatePickerMode.time,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Details Workout",
              style: TextStyle(
                  color: ColorExtension.black,
                  fontSize: 14,
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              height: 8,
            ),
            IconTitleNextRow(
                icon: "assets/images/choose_workout.png",
                title: "Choose Workout",
                time: "Upperbody",
                color: ColorExtension.lightGray,
                onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            IconTitleNextRow(
                icon: "assets/images/difficulty.png",
                title: "Difficulity",
                time: "Beginner",
                color: ColorExtension.lightGray,
                onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            IconTitleNextRow(
                icon: "assets/images/repetitions.png",
                title: "Custom Repetitions",
                time: "",
                color: ColorExtension.lightGray,
                onPressed: () {}),
            const SizedBox(
              height: 10,
            ),
            IconTitleNextRow(
                icon: "assets/images/repetitions.png",
                title: "Custom Weights",
                time: "",
                color: ColorExtension.lightGray,
                onPressed: () {}),
            const Spacer(),
            RoundButton(title: "Save", onPressed: () {}),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
