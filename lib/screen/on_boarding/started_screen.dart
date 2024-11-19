import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/round_button.dart';
import 'package:fit_app/screen/on_boarding/on_boarding_screen.dart';
import 'package:flutter/material.dart';

class StartedScreen extends StatefulWidget {
  const StartedScreen({super.key});

  @override
  State<StartedScreen> createState() => _StartedScreenState();
}

class _StartedScreenState extends State<StartedScreen> {
  bool isChangeColor = false;
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: ColorExtension.white,
        body: Container(
          width: media.width,
          decoration: BoxDecoration(
              gradient: isChangeColor ? LinearGradient(
            colors: ColorExtension.primaryG,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ) : null
          ),
          child: 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(),
                  Text(
                    "FitApp",
                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.w700,
                      color: ColorExtension.black,
                    ),
                  ),
                  Text(
                    "Everybody Can Train",
                    style: TextStyle(
                      fontSize: 18.0,
                      color: ColorExtension.gray,
                    ),
                  ),
                  const Spacer(),
                  SafeArea(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child:RoundButton(title: "Get Started",
                      type: isChangeColor ?  RoundButtonType.textGradient : RoundButtonType.bgGradient,
                       onPressed: (){
                      if(isChangeColor){
                        Navigator.push(context, 
                        MaterialPageRoute(
                          builder: (context) => const OnBoardingScreen(),
                        ),
                        );
                      }else{
                        setState(() {
                          isChangeColor = true;
                        });
                     
                      }
                      }),
                    ),
                  ),
                   const SizedBox(height: 20,),
                ],
              
  
          ),
        ));
  }
}
