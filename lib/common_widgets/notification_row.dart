import 'package:fit_app/common/color_extension.dart';
import 'package:flutter/material.dart';

class NotificationRow extends StatelessWidget {
  final Map nObj;
  const NotificationRow({super.key, required this.nObj});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 18),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(50),
            child: Image.asset(
              nObj["image"].toString(),
              width: 60,
              height: 60,
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
                  nObj["title"].toString(),
                  style: TextStyle(
                    color: ColorExtension.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  nObj["time"].toString(),
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
              width: 20,
              height: 20,
              fit: BoxFit.contain,
            ),
          ),
        ],
      ),
    );
  }
}
