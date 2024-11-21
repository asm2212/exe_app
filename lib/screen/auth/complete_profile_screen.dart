import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/common_widgets/round_textfield.dart';
import 'package:fit_app/screen/auth/next_screen.dart';
import 'package:flutter/material.dart';

class CompleteProfileScreen extends StatefulWidget {
  const CompleteProfileScreen({super.key});

  @override
  State<CompleteProfileScreen> createState() => _CompleteProfileScreenState();
}

class _CompleteProfileScreenState extends State<CompleteProfileScreen> {
  TextEditingController dateController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String? selectedGender;

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      children: [
                        Image.asset(
                          "assets/images/complete_profile.png",
                          width: media.width,
                          fit: BoxFit.fitWidth,
                        ),
                        SizedBox(height: media.width * 0.03),
                        Text(
                          "Let's Complete Your Profile",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: ColorExtension.black,
                          ),
                        ),
                        Text(
                          "It will help us to know more about you",
                          style: TextStyle(
                            fontSize: 12,
                            color: ColorExtension.gray,
                          ),
                        ),
                        SizedBox(height: media.width * 0.05),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              // Gender Dropdown
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 5),
                                decoration: BoxDecoration(
                                  color: ColorExtension.lightGray,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    value: selectedGender,
                                    hint: Row(
                                      children: [
                                        Image.asset(
                                          "assets/images/gender.png",
                                          width: 20,
                                          height: 20,
                                          color: ColorExtension.gray,
                                        ),
                                        const SizedBox(width: 10),
                                        Text(
                                          "Choose Gender",
                                          style: TextStyle(
                                            color: ColorExtension.gray,
                                            fontSize: 14,
                                          ),
                                        ),
                                      ],
                                    ),
                                    isExpanded: true,
                                    items: ["Male", "Female"]
                                        .map((gender) => DropdownMenuItem(
                                              value: gender,
                                              child: Text(
                                                gender,
                                                style: TextStyle(
                                                  color: ColorExtension.black,
                                                  fontSize: 14,
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        selectedGender = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              SizedBox(height: media.width * 0.05),
                              RoundTextfield(
                                controller: dateController,
                                hintText: "Date of Birth",
                                icon: "assets/images/date.png",
                              ),
                              SizedBox(height: media.width * 0.05),
                              Row(
                                children: [
                                  Expanded(
                                    child: RoundTextfield(
                                      controller: weightController,
                                      hintText: "Your Weight",
                                      icon: "assets/images/weight.png",
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 55,
                                    height: 55,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: ColorExtension.secondaryG,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      "KG",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorExtension.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: media.width * 0.05),
                              Row(
                                children: [
                                  Expanded(
                                    child: RoundTextfield(
                                      controller: heightController,
                                      hintText: "Your Height",
                                      icon: "assets/images/hight.png",
                                    ),
                                  ),
                                  const SizedBox(width: 8),
                                  Container(
                                    width: 55,
                                    height: 55,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: LinearGradient(
                                        colors: ColorExtension.secondaryG,
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      "CM",
                                      style: TextStyle(
                                        fontSize: 12,
                                        color: ColorExtension.white,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: media.width * 0.1),
                              RoundButton(
                                title: "Next >",
                                onPressed: () {
                                  // Navigate to next screen
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          const NextScreen(), // Replace with actual next screen
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
