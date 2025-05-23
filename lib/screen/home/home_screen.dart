import 'package:dotted_dashed_line/dotted_dashed_line.dart';
import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/common_widgets/workout_row.dart';
import 'package:fit_app/screen/home/activity_tracker_screen.dart';
import 'package:fit_app/screen/home/finished_workout_screen.dart';
import 'package:fit_app/screen/home/notification_screen.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_progress_bar/simple_animation_progress_bar.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

   List latestWorkoutArr = [
    {
      "name": "Full Body Workout",
      "image": "assets/images/Workout1.png",
      "kcal": "180",
      "time": "20",
      "progress": 0.3
    },
    {
      "name": "Lower Body Workout",
      "image": "assets/images/Workout2.png",
      "kcal": "200",
      "time": "30",
      "progress": 0.4
    },
    {
      "name": "Ab Workout",
      "image": "assets/images/Workout3.png",
      "kcal": "300",
      "time": "40",
      "progress": 0.7
    },
  ];

  List<int> showingTooltipOnSpots = [21];

  List<FlSpot> get allSpots => const [
        FlSpot(0, 20),
        FlSpot(1, 25),
        FlSpot(2, 40),
        FlSpot(3, 50),
        FlSpot(4, 35),
        FlSpot(5, 40),
        FlSpot(6, 30),
        FlSpot(7, 20),
        FlSpot(8, 25),
        FlSpot(9, 40),
        FlSpot(10, 50),
        FlSpot(11, 35),
        FlSpot(12, 50),
        FlSpot(13, 60),
        FlSpot(14, 40),
        FlSpot(15, 50),
        FlSpot(16, 20),
        FlSpot(17, 25),
        FlSpot(18, 40),
        FlSpot(19, 50),
        FlSpot(20, 35),
        FlSpot(21, 80),
        FlSpot(22, 30),
        FlSpot(23, 20),
        FlSpot(24, 25),
        FlSpot(25, 40),
        FlSpot(26, 50),
        FlSpot(27, 35),
        FlSpot(28, 50),
        FlSpot(29, 60),
        FlSpot(30, 40)
      ];

  List waterArr = [
    {
      "title": "6am - 8am",
      "subtitle": "600ml",
    },
    {
      "title": "8am - 11am",
      "subtitle": "500ml",
    },
    {
      "title": "11am - 2pm",
      "subtitle": "1000ml",
    },
    {
      "title": "2pm - 4pm",
      "subtitle": "700ml",
    },
    {
      "title": "4pm - now",
      "subtitle": "900ml",
    },
  ];

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    final lineBarsData = [
      LineChartBarData(
        showingIndicators: showingTooltipOnSpots,
        spots: allSpots,
        isCurved: false,
        barWidth: 3,
        belowBarData: BarAreaData(
          show: true,
          gradient: LinearGradient(colors: [
            ColorExtension.primaryColor2.withOpacity(0.4),
            ColorExtension.primaryColor1.withOpacity(0.1),
          ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
        ),
        dotData: const FlDotData(show: false),
        gradient: LinearGradient(
          colors: ColorExtension.primaryG,
        ),
      ),
    ];

    final tooltipsOnBar = lineBarsData[0];

    return Scaffold(
        backgroundColor: ColorExtension.white,
        body: SingleChildScrollView(
            child: SafeArea(
          child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                          onPressed: () {
                            Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => const NotificationScreen()));
                          },
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
                                    touchCallback: (FlTouchEvent event,
                                        pieTouchResponse) {},
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 15),
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
                              onPressed: () {
                                 Navigator.push(context, 
                            MaterialPageRoute(
                              builder: (context) => const ActivityTrackerScreen()));
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: media.width * 0.05),
                    Text(
                      "Activity Status",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: ColorExtension.black,
                      ),
                    ),
                    SizedBox(height: media.width * 0.02),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(25),
                      child: Container(
                        height: media.width * 0.5,
                        width: double.maxFinite,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: ColorExtension.primaryColor2.withOpacity(0.3),
                        ),
                        child: Stack(
                          alignment: Alignment.topLeft,
                          children: [
                            Padding(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Heart Rate",
                                      style: TextStyle(
                                        fontSize: 15,
                                        color: ColorExtension.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    ShaderMask(
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                                colors: ColorExtension.primaryG,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                            .createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                      },
                                      child: Text(
                                        "78 BPM",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: ColorExtension.white
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                  ],
                                )),
                            LineChart(
                              LineChartData(
                                showingTooltipIndicators:
                                    showingTooltipOnSpots.map((index) {
                                  return ShowingTooltipIndicators([
                                    LineBarSpot(
                                      tooltipsOnBar,
                                      lineBarsData.indexOf(tooltipsOnBar),
                                      tooltipsOnBar.spots[index],
                                    ),
                                  ]);
                                }).toList(),
                                lineTouchData: LineTouchData(
                                  enabled: true,
                                  handleBuiltInTouches: false,
                                  touchCallback: (FlTouchEvent event,
                                      LineTouchResponse? response) {
                                    if (response == null ||
                                        response.lineBarSpots == null) {
                                      return;
                                    }
                                    if (event is FlTapUpEvent) {
                                      final spotIndex = response
                                          .lineBarSpots!.first.spotIndex;
                                      showingTooltipOnSpots.clear();
                                      setState(() {
                                        showingTooltipOnSpots.add(spotIndex);
                                      });
                                    }
                                  },
                                  mouseCursorResolver: (FlTouchEvent event,
                                      LineTouchResponse? response) {
                                    if (response == null ||
                                        response.lineBarSpots == null) {
                                      return SystemMouseCursors.basic;
                                    }
                                    return SystemMouseCursors.click;
                                  },
                                  getTouchedSpotIndicator:
                                      (LineChartBarData barData,
                                          List<int> spotIndexes) {
                                    return spotIndexes.map((index) {
                                      return TouchedSpotIndicatorData(
                                        const FlLine(
                                          color: Colors.red,
                                        ),
                                        FlDotData(
                                          show: true,
                                          getDotPainter:
                                              (spot, percent, barData, index) =>
                                                  FlDotCirclePainter(
                                            radius: 3,
                                            color: Colors.white,
                                            strokeWidth: 3,
                                            strokeColor:
                                                ColorExtension.secondaryColor1,
                                          ),
                                        ),
                                      );
                                    }).toList();
                                  },
                                  touchTooltipData: LineTouchTooltipData(
                                    // tooltipBgColor: ColorExtension.secondaryColor1,
                                    tooltipRoundedRadius: 20,
                                    getTooltipItems:
                                        (List<LineBarSpot> lineBarsSpot) {
                                      return lineBarsSpot.map((lineBarSpot) {
                                        return LineTooltipItem(
                                          "${lineBarSpot.x.toInt()} mins ago",
                                          const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        );
                                      }).toList();
                                    },
                                  ),
                                ),
                                lineBarsData: lineBarsData,
                                minY: 0,
                                maxY: 130,
                                titlesData: const FlTitlesData(
                                  show: false,
                                ),
                                gridData: const FlGridData(show: false),
                                borderData: FlBorderData(
                                  show: true,
                                  border: Border.all(
                                    color: Colors.transparent,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: media.width * 0.05),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 20),
                            height: media.width * 0.95,
                            decoration: BoxDecoration(
                                color: ColorExtension.white,
                                borderRadius: BorderRadius.circular(25),
                                boxShadow: const [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 2,
                                  )
                                ]),
                            child: Row(
                              children: [
                                SimpleAnimationProgressBar(
                                  height: media.width * 0.85,
                                  width: media.width * 0.07,
                                  backgroundColor: Colors.grey.shade100,
                                  foregrondColor: Colors.purple,
                                  ratio: 0.5,
                                  direction: Axis.vertical,
                                  curve: Curves.fastLinearToSlowEaseIn,
                                  duration: const Duration(seconds: 3),
                                  borderRadius: BorderRadius.circular(15),
                                  gradientColor: LinearGradient(
                                      colors: ColorExtension.primaryG,
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Water Intake",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorExtension.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: media.width * 0.02,
                                    ),
                                    ShaderMask(
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                                colors: ColorExtension.primaryG,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                            .createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                      },
                                      child: Text(
                                        "4 Liters",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: ColorExtension.white
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: media.width * 0.03,
                                    ),
                                    Text(
                                      "Real time updates",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorExtension.gray,
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),
                                    SizedBox(
                                      height: media.width * 0.03,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: waterArr.map((wObj) {
                                        var isLast = wObj == waterArr.last;
                                        return Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  height: 10,
                                                  width: 10,
                                                  decoration: BoxDecoration(
                                                    color: ColorExtension
                                                        .secondaryColor2,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                  ),
                                                ),
                                                if (!isLast)
                                                  DottedDashedLine(
                                                    height: media.width * 0.1,
                                                    width: 0,
                                                    axis: Axis.vertical,
                                                    dashColor: ColorExtension
                                                        .secondaryColor2
                                                        .withOpacity(0.4),
                                                  )
                                              ],
                                            ),
                                            SizedBox(
                                              width: media.width * 0.03,
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  wObj["title"].toString(),
                                                  style: TextStyle(
                                                    fontSize: 12,
                                                    color: ColorExtension.gray,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                ShaderMask(
                                                  shaderCallback: (bounds) {
                                                    return LinearGradient(
                                                            colors:
                                                                ColorExtension
                                                                    .secondaryG,
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight)
                                                        .createShader(
                                                            Rect.fromLTRB(
                                                                0,
                                                                0,
                                                                bounds.width,
                                                                bounds.height));
                                                  },
                                                  child: Text(
                                                    wObj["subtitle"].toString(),
                                                    style: TextStyle(
                                                      fontSize: 12,
                                                      color: ColorExtension
                                                          .white
                                                          .withOpacity(0.7),
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: media.width * 0.03,
                                                ),
                                              ],
                                            ),
                                          ],
                                        );
                                      }).toList(),
                                    )
                                  ],
                                ))
                              ],
                            ),
                          ),
                        ),
                        SizedBox(width: media.width * 0.05),
                        Expanded(
                            child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Container(
                                width: double.maxFinite,
                                height: media.width * 0.45,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 20),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.black12,
                                        blurRadius: 2,
                                      )
                                    ]),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sleep",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorExtension.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: media.width * 0.015,
                                    ),
                                    ShaderMask(
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                                colors: ColorExtension.primaryG,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                            .createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                      },
                                      child: Text(
                                        "8h 20m",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: ColorExtension.white
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Image.asset(
                                      "assets/images/sleep_grap.png",
                                      width: double.maxFinite,
                                      fit: BoxFit.fitWidth,
                                    )
                                  ],
                                )),
                            SizedBox(height: media.width * 0.05),
                            Container(
                              width: double.maxFinite,
                              height: media.width * 0.45,
                              padding: const EdgeInsets.symmetric(
                                  vertical: 15, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 2,
                                    )
                                  ]),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Calories",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: ColorExtension.black,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                    SizedBox(
                                      height: media.width * 0.015,
                                    ),
                                    ShaderMask(
                                      shaderCallback: (bounds) {
                                        return LinearGradient(
                                                colors: ColorExtension.primaryG,
                                                begin: Alignment.centerLeft,
                                                end: Alignment.centerRight)
                                            .createShader(Rect.fromLTRB(0, 0,
                                                bounds.width, bounds.height));
                                      },
                                      child: Text(
                                        "760 kcal",
                                        style: TextStyle(
                                          fontSize: 18,
                                          color: ColorExtension.white
                                              .withOpacity(0.7),
                                        ),
                                      ),
                                    ),
                                    const Spacer(),
                                    Container(
                                      alignment: Alignment.center,
                                      child: SizedBox(
                                        width: media.width * 0.2,
                                        height: media.width * 0.2,
                                        child: Stack(
                                          alignment: Alignment.center,
                                          children: [
                                            Container(
                                                width: media.width * 0.15,
                                                height: media.width * 0.15,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors:
                                                        ColorExtension.primaryG,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          media.width * 0.75),
                                                ),
                                                child: FittedBox(
                                                  child: Text("230kcal\n left",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color: ColorExtension
                                                            .white,
                                                        fontSize: 10,
                                                      )),
                                                )),
                                            SimpleCircularProgressBar(
                                              startAngle: -180,
                                              progressStrokeWidth: 15,
                                              progressColors:
                                                  ColorExtension.primaryG,
                                              valueNotifier: ValueNotifier(50),
                                              backColor: Colors.grey.shade200,
                                              backStrokeWidth: 15,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            ),
                          ],
                        ))
                      ],
                    ),

                    SizedBox(height: media.width * 0.05),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Workout Progress",
                          style: TextStyle(
                              color: ColorExtension.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w700),
                        ),
                        Container(
                            height: 30,
                            padding: const EdgeInsets.symmetric(horizontal: 8),
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  colors: ColorExtension.primaryG),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton(
                                items: ["Weekly", "Monthly"]
                                    .map((name) => DropdownMenuItem(
                                          value: name,
                                          child: Text(
                                            name,
                                            style: TextStyle(
                                                color: ColorExtension.gray,
                                                fontSize: 14),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {},
                                icon: Icon(Icons.expand_more,
                                    color: ColorExtension.white),
                                hint: Text(
                                  "Weekly",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: ColorExtension.white,
                                      fontSize: 12),
                                ),
                              ),
                            )),
                      ],
                    ),
                    SizedBox(
                      height: media.width * 0.05,
                    ),
                    Container(
                        padding: const EdgeInsets.only(left: 15),
                        height: media.width * 0.5,
                        width: double.maxFinite,
                        child: LineChart(
                          LineChartData(
                            showingTooltipIndicators:
                                showingTooltipOnSpots.map((index) {
                              return ShowingTooltipIndicators([
                                LineBarSpot(
                                  tooltipsOnBar,
                                  lineBarsData.indexOf(tooltipsOnBar),
                                  tooltipsOnBar.spots[index],
                                ),
                              ]);
                            }).toList(),
                            lineTouchData: LineTouchData(
                              enabled: true,
                              handleBuiltInTouches: false,
                              touchCallback: (FlTouchEvent event,
                                  LineTouchResponse? response) {
                                if (response == null ||
                                    response.lineBarSpots == null) {
                                  return;
                                }
                                if (event is FlTapUpEvent) {
                                  final spotIndex =
                                      response.lineBarSpots!.first.spotIndex;
                                  showingTooltipOnSpots.clear();
                                  setState(() {
                                    showingTooltipOnSpots.add(spotIndex);
                                  });
                                }
                              },
                              mouseCursorResolver: (FlTouchEvent event,
                                  LineTouchResponse? response) {
                                if (response == null ||
                                    response.lineBarSpots == null) {
                                  return SystemMouseCursors.basic;
                                }
                                return SystemMouseCursors.click;
                              },
                              getTouchedSpotIndicator:
                                  (LineChartBarData barData,
                                      List<int> spotIndexes) {
                                return spotIndexes.map((index) {
                                  return TouchedSpotIndicatorData(
                                    const FlLine(
                                      color: Colors.transparent,
                                    ),
                                    FlDotData(
                                      show: true,
                                      getDotPainter:
                                          (spot, percent, barData, index) =>
                                              FlDotCirclePainter(
                                        radius: 3,
                                        color: Colors.white,
                                        strokeWidth: 3,
                                        strokeColor:
                                            ColorExtension.secondaryColor1,
                                      ),
                                    ),
                                  );
                                }).toList();
                              },
                              touchTooltipData: LineTouchTooltipData(
                                getTooltipColor: (touchedSpot) =>
                                    ColorExtension.secondaryColor1,
                                tooltipRoundedRadius: 20,
                                getTooltipItems:
                                    (List<LineBarSpot> lineBarsSpot) {
                                  return lineBarsSpot.map((lineBarSpot) {
                                    return LineTooltipItem(
                                      "${lineBarSpot.x.toInt()} mins ago",
                                      const TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                            lineBarsData: lineBarsData1,
                            minY: -0.5,
                            maxY: 110,
                            titlesData: FlTitlesData(
                                show: true,
                                leftTitles: const AxisTitles(),
                                topTitles: const AxisTitles(),
                                bottomTitles: AxisTitles(
                                  sideTitles: bottomTitles,
                                ),
                                rightTitles: AxisTitles(
                                  sideTitles: rightTitles,
                                )),
                            gridData: FlGridData(
                              show: true,
                              drawHorizontalLine: true,
                              horizontalInterval: 25,
                              drawVerticalLine: false,
                              getDrawingHorizontalLine: (value) {
                                return FlLine(
                                  color: ColorExtension.gray.withOpacity(0.15),
                                  strokeWidth: 2,
                                );
                              },
                            ),
                            borderData: FlBorderData(
                              show: true,
                              border: Border.all(
                                color: Colors.transparent,
                              ),
                            ),
                          ),
                        )),
                    SizedBox(height: media.width * 0.04),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Latest Workout",
                          style: TextStyle(
                              color: ColorExtension.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                        TextButton(
                          onPressed: () {},   
                          child: Text(
                            "See more",
                            style: TextStyle(
                                color: ColorExtension.gray,
                                 fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  
                    ListView.builder(
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: latestWorkoutArr.length,
                      itemBuilder: (context,index){
                       var wObj = latestWorkoutArr[index] as Map? ?? {};
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const FinishedWorkoutScreen(),
                              ),
                            );
                          },
                          child: WorkoutRow(wObj: wObj));
                    }),
                    
                    const SizedBox(height: 50),
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

  LineTouchData get lineTouchData1 => LineTouchData(
        handleBuiltInTouches: true,
        touchTooltipData: LineTouchTooltipData(
          getTooltipColor: (touchedSpot) => Colors.blueGrey.withOpacity(0.8),
        ),
      );

  List<LineChartBarData> get lineBarsData1 => [
        lineChartBarData1_1,
        lineChartBarData1_2,
      ];

  LineChartBarData get lineChartBarData1_1 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          ColorExtension.primaryColor2.withOpacity(0.5),
          ColorExtension.primaryColor1.withOpacity(0.5),
        ]),
        barWidth: 4,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(show: false),
        spots: const [
          FlSpot(1, 35),
          FlSpot(2, 70),
          FlSpot(3, 40),
          FlSpot(4, 80),
          FlSpot(5, 25),
          FlSpot(6, 70),
          FlSpot(7, 35),
        ],
      );

  LineChartBarData get lineChartBarData1_2 => LineChartBarData(
        isCurved: true,
        gradient: LinearGradient(colors: [
          ColorExtension.secondaryColor2.withOpacity(0.5),
          ColorExtension.secondaryColor1.withOpacity(0.5),
        ]),
        barWidth: 2,
        isStrokeCapRound: true,
        dotData: const FlDotData(show: false),
        belowBarData: BarAreaData(
          show: false,
        ),
        spots: const [
          FlSpot(1, 80),
          FlSpot(2, 50),
          FlSpot(3, 90),
          FlSpot(4, 40),
          FlSpot(5, 80),
          FlSpot(6, 35),
          FlSpot(7, 60),
        ],
      );

  SideTitles get rightTitles => SideTitles(
        getTitlesWidget: rightTitleWidgets,
        showTitles: true,
        interval: 20,
        reservedSize: 40,
      );

  Widget rightTitleWidgets(double value, TitleMeta meta) {
    String text;
    switch (value.toInt()) {
      case 0:
        text = '0%';
        break;
      case 20:
        text = '20%';
        break;
      case 40:
        text = '40%';
        break;
      case 60:
        text = '60%';
        break;
      case 80:
        text = '80%';
        break;
      case 100:
        text = '100%';
        break;
      default:
        return Container();
    }

    return Text(text,
        style: TextStyle(
          color: ColorExtension.gray,
          fontSize: 12,
        ),
        textAlign: TextAlign.center);
  }

  SideTitles get bottomTitles => SideTitles(
        showTitles: true,
        reservedSize: 32,
        interval: 1,
        getTitlesWidget: bottomTitleWidgets,
      );

  Widget bottomTitleWidgets(double value, TitleMeta meta) {
    var style = TextStyle(
      color: ColorExtension.gray,
      fontSize: 12,
    );
    Widget text;
    switch (value.toInt()) {
      case 1:
        text = Text('Sun', style: style);
        break;
      case 2:
        text = Text('Mon', style: style);
        break;
      case 3:
        text = Text('Tue', style: style);
        break;
      case 4:
        text = Text('Wed', style: style);
        break;
      case 5:
        text = Text('Thu', style: style);
        break;
      case 6:
        text = Text('Fri', style: style);
        break;
      case 7:
        text = Text('Sat', style: style);
        break;
      default:
        text = const Text('');
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      space: 10,
      child: text,
    );
  }
}
