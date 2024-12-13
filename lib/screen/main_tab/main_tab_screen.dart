import 'package:fit_app/common/color_extension.dart';
import 'package:fit_app/common_widgets/tab_button.dart';
import 'package:fit_app/screen/home/blank_screen.dart';
import 'package:fit_app/screen/home/home_screen.dart';
import 'package:fit_app/screen/main_tab/select_screen.dart';
import 'package:fit_app/screen/photo_progress/photo_progress_screen.dart';
import 'package:fit_app/screen/profile/profile_screen.dart';
import 'package:flutter/material.dart';

class MainTabScreen extends StatefulWidget {
  const MainTabScreen({super.key});

  @override
  State<MainTabScreen> createState() => _MainTabScreenState();
}

class _MainTabScreenState extends State<MainTabScreen> {
  int selectTab = 0;
  final PageStorageBucket pageBucket = PageStorageBucket();
  Widget currentTab = const HomeScreen();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorExtension.white,
      body: PageStorage(bucket: pageBucket,child:currentTab),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: SizedBox(
        width: 70,
        height: 70,
        child: InkWell(
          onTap: () {},
          child: Container(
            height: 65,
            width: 65,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: ColorExtension.primaryG,
              ),
              borderRadius: BorderRadius.circular(35),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 2,
                )
              ],
            ),
            child: Icon(
              Icons.search,
              color: ColorExtension.white,
              size: 40,
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          decoration: BoxDecoration(
            color: ColorExtension.white,
            boxShadow: const [
              BoxShadow(
                  color: Colors.black12, 
                  blurRadius: 2,
                   offset: Offset(0, -2)),
            ],
          ),
          height: kToolbarHeight,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TabButton(
                  icon: "assets/images/home_tab.png",
                  selectIcon: "assets/images/home_tab_select.png",
                  onTap: () {
                    selectTab = 0;
                    currentTab = const HomeScreen();
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isActive: selectTab == 0,
                ),
              ),
              Expanded(
                child: TabButton(
                  icon: "assets/images/activity_tab.png",
                  selectIcon: "assets/images/activity_tab_select.png",
                  onTap: () {
                    selectTab = 1;
                    currentTab = const SelectScreen();
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isActive: selectTab == 1,
                ),
              ),
              const SizedBox(width: 50), // Space for FloatingActionButton
              Expanded(
                child: TabButton(
                  icon: "assets/images/camera_tab.png",
                  selectIcon: "assets/images/camera_tab_select.png",
                  onTap: () {
                    selectTab = 2;
                    currentTab = const PhotoProgressScreen();
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isActive: selectTab == 2,
                ),
              ),
              Expanded(
                child: TabButton(
                  icon: "assets/images/profile_tab.png",
                  selectIcon: "assets/images/profile_tab_select.png",
                  onTap: () {
                    selectTab = 3;
                    currentTab = const ProfileScreen();
                    if (mounted) {
                      setState(() {});
                    }
                  },
                  isActive: selectTab == 3,
                ),
              ),
            ],
          ),
      
        ),
        
      ),
    );
  }
}
