import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Core/widgets/Add_Habit.dart';
import 'package:mind_set_go/Feature/Activity/Activity_View.dart';
import 'package:mind_set_go/Feature/Exeplore/Explore_View.dart';
import 'package:mind_set_go/Feature/Home/Home_View.dart';
import 'package:mind_set_go/Feature/Profile/Profile_View.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({super.key});

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  List<Widget> pages = [
    HomeView(),
    const ExploreView(),
    const AddHabit(),
    ActivityView(),
    ProfileView(),
  ];
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          iconSize: MediaQuery.sizeOf(context).height / 9,
          currentIndex: currentIndex,
          onTap: (value) {
            setState(() {
              currentIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Image.asset(
                'assets/Home.png',
                width: MediaQuery.sizeOf(context).height / 9,
                height: MediaQuery.sizeOf(context).height / 9,
              ),
              activeIcon: SvgPicture.asset(
                'assets/Primay.svg',
                width: 28,
                height: 28,
                colorFilter:
                    const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/Discovery.svg',
                width: 32,
                height: 32,
              ),
              activeIcon: SvgPicture.asset(
                'assets/Discovery2.svg', width: 32,
                height: 32,
                //  colorFilter: const ColorFilter.mode(
                //    AppColors.red_error, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/Plus cr-fr.svg',
                width: 35,
                height: 35,
              ),
              activeIcon: SvgPicture.asset(
                'assets/Add Button.svg', width: 50,
                height: 50,
                //   colorFilter:
                //     const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/Medal.svg',
                width: 32,
                height: 32,
              ),
              activeIcon: SvgPicture.asset(
                'assets/Medal2.svg',
                width: 32,
                height: 32,
                colorFilter:
                    const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/Profile.svg',
                width: 32,
                height: 32,
              ),
              activeIcon: SvgPicture.asset(
                'assets/Profile2.svg',
                width: 32,
                height: 32,
                colorFilter:
                    const ColorFilter.mode(AppColors.blue, BlendMode.srcIn),
              ),
              label: '',
            ),
          ]),
    );
  }
}
