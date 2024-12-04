
import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class TitleSubtitleCell extends StatelessWidget {
  final String title;
  final String subtitle;
  const TitleSubtitleCell({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
      decoration: BoxDecoration(
          color: ColorExtension.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: const [BoxShadow(color: Colors.black12, blurRadius: 2)]),
      child: Column(
        children: [
          ShaderMask(
            blendMode: BlendMode.srcIn,
            shaderCallback: (bounds) {
              return LinearGradient(
                      colors: ColorExtension.primaryG,
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight)
                  .createShader(
                      Rect.fromLTRB(0, 0, bounds.width, bounds.height));
            },
            child: Text(
             subtitle,
              style: TextStyle(
                  color: ColorExtension.white.withOpacity(0.7),
                  fontWeight: FontWeight.w700,
                  fontSize: 19),
            ),
          ),
          Text(
            title,
            style: TextStyle(
              color:ColorExtension.gray,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}