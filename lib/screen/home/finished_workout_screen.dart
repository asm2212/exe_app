import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:flutter/material.dart';

class FinishedWorkoutScreen extends StatefulWidget {
  const FinishedWorkoutScreen({super.key});

  @override
  State<FinishedWorkoutScreen> createState() => _FinishedWorkoutScreenState();
}

class _FinishedWorkoutScreenState extends State<FinishedWorkoutScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(
                height: 30,
              ),
              Image.asset(
                "assets/images/complete_workout.png",
                height: media.width * 1,
                fit: BoxFit.fitHeight,
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Congratulations, You Have Finished Your Workout",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: ColorExtension.black,
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                "Exercises is king and nutrition is queen. Combine the two and you will have a kingdom",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorExtension.gray,
                    fontSize: 15,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "-Jack Lalanne",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: ColorExtension.gray,
                    fontSize: 17,
                    fontWeight: FontWeight.w500),
              ),
              const Spacer(),
              RoundButton(
                  title: "Back To Home",
                  onPressed: () {
                    Navigator.pop(context);
                  }),
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
