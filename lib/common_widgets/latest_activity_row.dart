import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class LatestActivityRow extends StatelessWidget {
  final Map lObj;
  const LatestActivityRow({super.key, required this.lObj});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset(
              lObj["image"].toString(),
              width: 70,
              height: 70,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  lObj["title"].toString(),
                  style: TextStyle(
                      color: ColorExtension.black,
                      fontSize: 18,
                      fontWeight: FontWeight.w700),
                ),
                 const SizedBox(
            height: 5,
          ),
                Text(
                  lObj["time"].toString(),
                  style: TextStyle(
                    color: ColorExtension.gray,
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Image.asset(
              "assets/images/sub_menu.png",
              width: 12,
              height: 12,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
