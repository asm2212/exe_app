import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/today_target_cell.dart';
import 'package:flutter/material.dart';

class ActivityTrackerScreen extends StatefulWidget {
  const ActivityTrackerScreen({super.key});

  @override
  State<ActivityTrackerScreen> createState() => _ActivityTrackerScreenState();
}

class _ActivityTrackerScreenState extends State<ActivityTrackerScreen> {
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
              margin: const EdgeInsets.all(10),
              height: 45,
              width: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: ColorExtension.lightGray,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Image.asset(
                "assets/images/black_btn.png",
                fit: BoxFit.contain,
                height: 15,
                width: 15,
              )),
        ),
        title: Text('Activity Tracker',
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: ColorExtension.black)),
        actions: [
          InkWell(
            onTap: () {},
            child: Container(
                margin: const EdgeInsets.all(10),
                height: 45,
                width: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: ColorExtension.lightGray,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/images/more_btn.png",
                  fit: BoxFit.contain,
                  height: 12,
                  width: 12,
                )),
          ),
        ],
      ),
      backgroundColor: ColorExtension.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
          child: Column(
            children: [
              Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    ColorExtension.primaryColor2.withOpacity(0.4),
                    ColorExtension.primaryColor1.withOpacity(0.4)
                  ]),
                  borderRadius: BorderRadius.circular(15),
                  color: ColorExtension.primaryColor2.withOpacity(0.3),
                ),
                child: Column(
                  children: [
                    Row(
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
                          width: 45,
                          height: 45,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: ColorExtension.primaryG
                                ),
                                borderRadius: BorderRadius.circular(25),
                            ),
                            child: MaterialButton(
                              onPressed: (){},
                              padding: EdgeInsets.zero,
                              height:35,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25),
                              ),
                              textColor: ColorExtension.primaryColor1,
                              minWidth: double.maxFinite,
                              elevation:0,
                              color: Colors.transparent,
                              child: Icon(
                                Icons.add,
                                color: ColorExtension.white,
                                size: 30,),
                              ),
                          )
                        ),
                      ],
                    ),
                    SizedBox(height: media.width*0.03,),
                     Row(
                           children: [
                          const Expanded(
                            child: TodayTargetCell(
                              icon: "assets/images/water.png", 
                              value: "8 L", 
                              title: "Water Intake")
                              ),
                                  SizedBox(width: media.width*0.04,),
                             const  Expanded(
                            child: TodayTargetCell(
                              icon: "assets/images/foot.png", 
                              value: "2400", 
                              title: "Foot Steps")
                              ),
                           ],
                    )
                  ],
                ),
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}
