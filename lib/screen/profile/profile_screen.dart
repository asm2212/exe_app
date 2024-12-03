import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
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
                )),
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
              Row(
                children: [
                  Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 15),
                           decoration: BoxDecoration(
                          color: ColorExtension.white,
                          borderRadius: BorderRadius.circular(15),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 2,
                            ),
                          ]),
                      child: Column(
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                      colors: ColorExtension.primaryG,
                                      begin: Alignment.centerLeft,
                                      end: Alignment.centerRight)
                                  .createShader(Rect.fromLTRB(
                                      0, 0, bounds.width, bounds.height));
                            },
                            child: Text(
                              "180cm",
                              style: TextStyle(
                                fontSize: 20,
                                color: ColorExtension.white.withOpacity(0.8),
                              ),
                            ),
                          ),
                          Text(
                            "Height",
                            style: TextStyle(
                              fontSize: 15,
                              color: ColorExtension.gray,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
