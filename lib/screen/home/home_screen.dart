import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              children: [
                // Header Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome back",
                          style: TextStyle(
                            fontSize: 10,
                            color: ColorExtension.gray,
                          ),
                        ),
                        Text(
                          "Asmare Admasu",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: ColorExtension.black,
                          ),
                        ),
                      ],
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        "assets/images/notification_active.png",
                        width: 25,
                        height: 25,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: media.width * 0.05),

                // Gradient Container
                Container(
                  height: media.width * 0.4,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: ColorExtension.primaryG,
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "BMI(Body Mass Index)",
                              style: TextStyle(
                                fontSize: 15,
                                color: ColorExtension.white,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "You have a normal weight",
                              style: TextStyle(
                                fontSize: 12,
                                color: ColorExtension.white,
                              ),
                            ),
                            SizedBox(height: media.width * 0.05),
                            SizedBox(
                              width: 100,
                              height: 30,
                              child: RoundButton(
                                title: "View More",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                type: RoundButtonType.bgSGradient,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                            AspectRatio(
                            aspectRatio: 1,
                            child: PieChart(
                              PieChartData(
                                pieTouchData: PieTouchData(
                                  touchCallback:
                                      (FlTouchEvent event, pieTouchResponse) {},
                                ),
                                startDegreeOffset: 250,
                                borderData: FlBorderData(
                                  show: false,
                                ),
                                sectionsSpace: 1,
                                centerSpaceRadius: 0,
                                sections: showingSections(),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              SizedBox(height: media.width * 0.05),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: ColorExtension.primaryColor2.withOpacity(0.3),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                          "Today Target",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: ColorExtension.black,
                          ),
                        ),
                          SizedBox(
                              width: 90,
                              height: 30,
                              child: RoundButton(
                                title: "Check",
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                type: RoundButtonType.bgGradient,
                                onPressed: () {},
                              ),
                            ),
                  ],
                ),
              )
              ],
            ),
          ),
        ),
      ),
    );
  }

    List<PieChartSectionData> showingSections() {
    return List.generate(
      2,
      (i) {
        var color0 = ColorExtension.secondaryColor1;

        switch (i) {
          case 0:
            return PieChartSectionData(
                color: color0,
                value: 33,
                title: '',
                radius: 55,
                titlePositionPercentageOffset: 0.55,
                badgeWidget: const Text(
                  "20,1",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w700),
                ));
          case 1:
            return PieChartSectionData(
              color: Colors.white,
              value: 75,
              title: '',
              radius: 45,
              titlePositionPercentageOffset: 0.55,
            );

          default:
            throw Error();
        }
      },
    );
  }

}
