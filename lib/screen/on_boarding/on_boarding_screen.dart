import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/on_boarding_view.dart';
import 'package:fit_app/screen/auth/register_screen.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController controller = PageController();
  int selectPage = 0;

  final List<Map<String, String>> pageArr = [
    {
      "title": "Track Your Goal",
      "subtitle":
          "Don't worry if you have trouble determining your goals, we can help you determine and track them.",
      "image": "assets/images/on_1.png",
    },
    {
      "title": "Get Burn",
      "subtitle":
          "Let's keep burning your goals. We can help you determine and track them.",
      "image": "assets/images/on_2.png",
    },
    {
      "title": "Eat Well",
      "subtitle":
          "Start a healthy lifestyle with us. We can determine your diet every day. Healthy eating is fun!",
      "image": "assets/images/on_3.png",
    },
    {
      "title": "Improve Sleep\nQuality",
      "subtitle":
          "Improve the quality of your sleep with us. Good quality sleep can bring a great mood in the morning!",
      "image": "assets/images/on_4.png",
    },
  ];

  @override
  void initState() {
    super.initState();

    // Listen for page changes
    controller.addListener(() {
      setState(() {
        selectPage = controller.page?.round() ?? 0;
      });
    });
  }

  @override
  void dispose() {
    controller.dispose(); // Dispose controller when widget is removed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: Stack(
        alignment: Alignment.bottomRight,
        children: [
          // PageView for onboarding pages
          PageView.builder(
            controller: controller,
            itemCount: pageArr.length,
            itemBuilder: (context, index) {
              var pObj = pageArr[index];
              return OnBoardingView(pObj: pObj);
            },
          ),

          // SafeArea to handle overflow
          Positioned(
              bottom: media.height * 0.02,
              right: media.width * 0.05,
              child: SizedBox(
                width: 120,
                height: 120,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    // Progress indicator
                    SizedBox(
                      width: 70,
                      height: 70,
                      child: CircularProgressIndicator(
                        color: ColorExtension.primaryColor1,
                        value: (selectPage + 1) / pageArr.length,
                        strokeWidth: 2,
                      ),
                    ),
                    // Next button
                    GestureDetector(
                      onTap: () {
                        if (selectPage < pageArr.length - 1) {
                          controller.nextPage(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                          );
                        } else {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RegisterScreen(),
                            ),
                          );
                        }
                      },
                      child: Container(
                        width: 60,
                        height: 60,
                        decoration: BoxDecoration(
                          color: ColorExtension.primaryColor1,
                          borderRadius: BorderRadius.circular(35),
                        ),
                        child: Icon(
                          Icons.navigate_next,
                          color: ColorExtension.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          
        ],
      ),
    );
  }
}
