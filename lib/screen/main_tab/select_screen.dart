

import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/screen/meal_planner/meal_planner_screen.dart';
import 'package:fit_app/screen/workout_tracker.dart/workout_tracker_screen.dart';
import 'package:flutter/material.dart';

class SelectScreen extends StatelessWidget {
  const SelectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // var media = MediaQuery.of(context).size;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundButton(
                title: "Workout Tracker",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WorkoutTrackerScreen(),
                    ),
                  );
                }),

                const SizedBox(height: 15,),

                  RoundButton(
                title: "Meal Planner",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MealPlannerScreen(),
                    ),
                  );
                }),

                const SizedBox(height: 15,),

          ],
        ),
      ),
    );
  }
}