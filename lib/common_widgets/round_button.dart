import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

enum RoundButtonType { bgGradient,bgSGradient ,textGradient }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  final double fontSize;
  final FontWeight fontWeight;
  const RoundButton(
      {super.key,
      required this.title,
      this.fontSize = 18,
      this.fontWeight = FontWeight.w700,
      this.type = RoundButtonType.bgGradient,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: type == RoundButtonType.bgSGradient ? ColorExtension.secondaryG :   ColorExtension.primaryG,
              ),
            borderRadius: BorderRadius.circular(25),
            boxShadow: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient
                ? const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ]
                : null),
        child: MaterialButton(
          onPressed: onPressed,
          height: 55,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          textColor: ColorExtension.primaryColor1,
          minWidth: double.maxFinite,
          elevation: type == RoundButtonType.bgGradient  || type == RoundButtonType.bgSGradient ? 0 : 1,
          color: type == RoundButtonType.bgGradient || type == RoundButtonType.bgSGradient
              ? Colors.transparent
              : ColorExtension.white,
          child: type == RoundButtonType.bgGradient  || type == RoundButtonType.bgSGradient
              ? Text(
                  title,
                  style: TextStyle(
                      color: ColorExtension.white,
                      fontSize: fontSize,
                      fontWeight: fontWeight),
                )
              : ShaderMask(
                  shaderCallback: (bounds) {
                    return LinearGradient(
                            colors: ColorExtension.primaryG,
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight)
                        .createShader(
                            Rect.fromLTRB(0, 0, bounds.width, bounds.height));
                  },
                  child: Text(
                    title,
                    style: TextStyle(
                        color: ColorExtension.primaryColor1,
                        fontSize: fontSize,
                        fontWeight: fontWeight),
                  )),
        ));
  }
}
