import 'package:animated_toggle_switch/animated_toggle_switch.dart';
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
  bool positive = false;

  List accountArr = [
    {
      "image": "assets/images/p_personal.png",
      "name": "Personal Data",
      "tag": "1"
    },
    {"image": "assets/images/p_achi.png", "name": "Achievement", "tag": "2"},
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
    {"image": "assets/images/p_contact.png", "name": "Contact Us", "tag": "5"},
    {
      "image": "assets/images/p_privacy.png",
      "name": "Privacy Policy",
      "tag": "6"
    },
    {"image": "assets/images/p_setting.png", "name": "Setting", "tag": "7"},
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
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
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
            const Row(
              children: [
                Expanded(
                  child: TitleSubtitleCell(title: "Height", subtitle: "180cm"),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TitleSubtitleCell(title: "Weight", subtitle: "65kg"),
                ),
                SizedBox(width: 20),
                Expanded(
                  child: TitleSubtitleCell(title: "22yo", subtitle: "Age"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                  color: ColorExtension.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
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
                        var iObj = accountArr[index] as Map? ?? {};
                        return SettingRow(
                            icon: iObj["image"].toString(),
                            title: iObj["name"].toString(),
                            onPressed: () {});
                      })
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              decoration: BoxDecoration(
                  color: ColorExtension.white,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Notifications',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: ColorExtension.black),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 40,
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset("assets/images/p_notification.png",
                              height: 25, width: 25, fit: BoxFit.contain),
                          const SizedBox(
                            width: 15,
                          ),
                          Expanded(
                            child: Text(
                              "Pop-up Notification",
                              style: TextStyle(
                                  color: ColorExtension.black,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                          CustomAnimatedToggleSwitch<bool>(
                            current: positive,
                            values: const [false, true],
                            spacing: 0.0,
                            indicatorSize: const Size.square(30.0),
                            animationDuration:
                                const Duration(milliseconds: 200),
                            animationCurve: Curves.linear,
                            onChanged: (b) => setState(() => positive = b),
                            iconBuilder: (context, local, global) {
                              return const SizedBox();
                            },
                            cursors: const ToggleCursors(
                                defaultCursor: SystemMouseCursors.click),
                            onTap: (_) => setState(() => positive = !positive),
                            iconsTappable: false,
                            wrapperBuilder: (context, global, child) {
                              return Stack(
                                alignment: Alignment.center,
                                children: [
                                  Positioned(
                                    left: 10.0,
                                    right: 10.0,
                                    height: 25.0,
                                    child: DecoratedBox(
                                      decoration: BoxDecoration(
                                        gradient: LinearGradient(
                                            colors: ColorExtension.secondaryG),
                                        borderRadius: const BorderRadius.all(
                                            Radius.circular(50.0)),
                                      ),
                                    ),
                                  ),
                                  child,
                                ],
                              );
                            },
                            foregroundIndicatorBuilder: (context, global) {
                              return SizedBox.fromSize(
                                size: const Size(6, 6),
                                child: DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: ColorExtension.white,
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(30.0)),
                                    boxShadow: const [
                                      BoxShadow(
                                          color: Colors.black38,
                                          spreadRadius: 0.05,
                                          blurRadius: 1.1,
                                          offset: Offset(0.0, 0.8))
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ]),
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
                  boxShadow: const [
                    BoxShadow(color: Colors.black12, blurRadius: 2)
                  ]),
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
                      padding: EdgeInsets.zero,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: otherArr.length,
                      itemBuilder: (context, index) {
                        var iObj = otherArr[index] as Map? ?? {};
                        return SettingRow(
                            icon: iObj["image"].toString(),
                            title: iObj["name"].toString(),
                            onPressed: () {});
                      }),
                           const SizedBox(height: 50),
                ],
              ),
            )
          ]),
        )));
  }
}
