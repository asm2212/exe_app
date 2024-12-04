import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/common_widgets/setting_row.dart';
import 'package:fit_app/common_widgets/title_subtitle_cell.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  
  List accountArr = [
    {
      "image": "assets/images/p_personal.png",
       "name": "Personal Data",
        "tag": "1"},
    {
      "image": "assets/images/p_achi.png",
       "name": "Achievement", 
       "tag": "2"},
    {
      "image": "assets/images/p_activity.png",
      "name": "Activity History",
      "tag": "3"
    },
    {
      "image": "assets/images/p_workout.png",
      "name": "Workout Progress",
      "tag": "4"
    }
  ];

    List otherArr = [
    {
      "image": "assets/images/p_contact.png",
     "name": "Contact Us",
      "tag": "5"},
    {
      "image": "assets/images/p_privacy.png",
       "name": "Privacy Policy", 
       "tag": "6"},
    {
      "image": "assets/images/p_setting.png",
       "name": "Setting", 
       "tag": "7"},

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorExtension.white,
        centerTitle: true,
        elevation: 0,
        title: Text('Profile',
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
                ),
                ),
          ),
        ],
      ),
      backgroundColor: ColorExtension.white,
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset(
                      "assets/images/pic_5.png",
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Stefani Wong',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: ColorExtension.black),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Lose a Fat Program',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                              color: ColorExtension.gray),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 110,
                    height: 40,
                    child: RoundButton(
                      title: "Edit",
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      type: RoundButtonType.bgGradient,
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
            const  Row(
                children: [
                Expanded(
                  child: TitleSubtitleCell(
                    title: "Height", 
                    subtitle: "180cm"),
                    ),
                             SizedBox(width: 20),
                    Expanded(
                  child: TitleSubtitleCell(
                    title: "Weight", 
                    subtitle: "65kg"),
                    ),
                             SizedBox(width: 20),
                    Expanded(
                  child: TitleSubtitleCell(
                    title: "22yo", 
                    subtitle: "Age"),
                    ),
                ],
              ),
                   const SizedBox(height: 20),
                   Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: ColorExtension.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Text(
                          'Account',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorExtension.black),
                        ),
                          const SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: accountArr.length,
                            itemBuilder: (context, index) {
                              var iObj = accountArr[index]as Map? ?? {};
                              return SettingRow(
                                 icon: iObj["image"].toString(),
                                 title:  iObj["name"].toString(),
                                  onPressed: (){}); 
                            }
                          )
                      ],
                    ),
                   ),
                   const SizedBox(height: 20),
                   Container(
                    padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                    decoration: BoxDecoration(
                      color: ColorExtension.white,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Text(
                          'Other',
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                              color: ColorExtension.black),
                        ),
                          const SizedBox(height: 10),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: otherArr.length,
                            itemBuilder: (context, index) {
                              var iObj = otherArr[index]as Map? ?? {};
                              return SettingRow(
                                 icon: iObj["image"].toString(),
                                 title:  iObj["name"].toString(),
                                  onPressed: (){}); 
                            }
                          )
                      ],
                    ),
                   )
            ],
          ),
        ),
      ),
    );
  }
}
