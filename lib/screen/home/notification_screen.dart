import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/notification_row.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {

    List notificationArr = [
    {"image": "assets/images/Workout1.png", 
    "title": "Hey, it’s time for lunch", 
    "time": "About 1 minutes ago"},

    {"image": "assets/images/Workout2.png",
     "title": "Don’t miss your lowerbody workout",
      "time": "About 3 hours ago"},

    {"image": "assets/images/Workout3.png",
     "title": "Hey, let’s add some meals for your b..", 
     "time": "About 3 hours ago"},

    {"image": "assets/images/Workout1.png", 
    "title": "Congratulations, You have finished A..",
     "time": "29 May"},

    {"image": "assets/images/Workout2.png", 
    "title": "Hey, it’s time for lunch",
     "time": "8 April"},

    {"image": "assets/images/Workout3.png", 
    "title": "Ups, You have missed your Lowerbo...", 
    "time": "8 April"},
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
        title: Text('Notification',
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
      body: ListView.separated(
        padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 25),
        itemBuilder: ((context, index) {
        var nObj = notificationArr[index] as Map? ?? {};
        return NotificationRow(nObj: nObj);
        
        }), 
        separatorBuilder: (context, index){
          return Divider(
            height: 1,
            color: ColorExtension.gray.withOpacity(0.5),
          );
        }, 
        itemCount: notificationArr.length
        ),
    );
  }
}
