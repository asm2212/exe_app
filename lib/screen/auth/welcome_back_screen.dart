import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/screen/auth/register_screen.dart';
import 'package:flutter/material.dart';
import '../../common_widgets/round_button.dart';

class WelcomeBackScreen extends StatelessWidget {
  const WelcomeBackScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              // Welcome Image
              Image.asset(
                "assets/images/welcome.png",
                width: media.width,
                fit: BoxFit.fitWidth,
              ),
              SizedBox(height: media.width * 0.1),
              // Welcome Text
              Text(
                "Welcome, Asmare",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  color: ColorExtension.black,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "You are all set now, let's reach your goals together with us",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 12,
                  color: ColorExtension.gray,
                ),
              ),
              const Spacer(),
              // Go to Home Button
              RoundButton(
                title: "Go To Home",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const RegisterScreen(),
                    ),
                  );
                },
              ),
              SizedBox(height: media.width * 0.1), // Bottom spacing
            ],
          ),
        ),
      ),
    );
  }
}
