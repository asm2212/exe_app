import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

enum RoundButtonType { bgGradient, textGradient }

class RoundButton extends StatelessWidget {
  final String title;
  final RoundButtonType type;
  final VoidCallback onPressed;
  const RoundButton(
      {super.key,
      required this.title,
      this.type = RoundButtonType.bgGradient,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: ColorExtension.primaryG,
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),
            borderRadius: BorderRadius.circular(25),
            boxShadow: type == RoundButtonType.bgGradient
                ? const [
                    BoxShadow(
                        color: Colors.black26,
                        blurRadius: 2,
                        offset: Offset(0, 2))
                  ]
                : null),
        child: MaterialButton(
          onPressed: onPressed,
          height: 50,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
          textColor: ColorExtension.primaryColor1,
          minWidth: double.maxFinite,
          elevation: type == RoundButtonType.bgGradient ? 0 : 1,
          color: type == RoundButtonType.bgGradient
              ? Colors.transparent
              : ColorExtension.white,
          child: type == RoundButtonType.bgGradient
              ? Text(
                  title,
                  style: TextStyle(
                      color: ColorExtension.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w700),
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
                        fontSize: 16,
                        fontWeight: FontWeight.w700),
                  )),
        ));
  }
}
