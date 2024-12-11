import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/Functions/navigation.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Core/widgets/custom_button.dart';
import 'package:mind_set_go/Core/widgets/nav_bar_widget.dart';
import 'package:mind_set_go/Feature/intro/onboarding/onboarding_model.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  var pageController = PageController();
  int currentPage = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
        actions: [
          if (currentPage != pages.length - 1)
            TextButton(
              onPressed: () {
                /*   AppLocalStorage.cacheData(
                    key: AppLocalStorage.onboarding, value: true);*/

                pushReplacement(context, const NavBarWidget());
              },
              child: const Text('Skip',
                  style: TextStyle(color: AppColors.white, fontSize: 20)),
            ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          // pageview

          Expanded(
              child: PageView.builder(
            controller: pageController,
            onPageChanged: (value) {
              setState(() {
                currentPage = value;
              });
            },
            itemBuilder: (context, index) {
              return Column(children: [
                // image

                Image.asset(
                  pages[index].image,
                  height: MediaQuery.sizeOf(context).height / 2,
                  width: MediaQuery.sizeOf(context).width / 1.3,
                ),
                const Spacer(),
                // title
                Text(pages[index].title,
                    style: TextStyle(color: AppColors.white, fontSize: 40)),
                const Gap(20),
                Text(
                  pages[index].body,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: AppColors.white),
                ),
                const Spacer(
                  flex: 3,
                ),
              ]);
            },
            itemCount: pages.length,
          )),
          // footer
          SizedBox(
            height: MediaQuery.sizeOf(context).height / 9,
            child: Row(
              children: [
                SmoothPageIndicator(
                  controller: pageController,
                  count: pages.length,
                  effect: const SlideEffect(
                      spacing: 8.0,
                      radius: 15,
                      dotWidth: 15.0,
                      dotHeight: 13,
                      strokeWidth: 1.5,
                      dotColor: Colors.white,
                      activeDotColor: AppColors.blue),
                ),
                const Spacer(),
                if (currentPage == pages.length - 1)
                  CustomButton(
                      height: MediaQuery.sizeOf(context).height / 9,
                      text: 'Continue ',
                      onPressed: () {
                        /*  AppLocalStorage.cacheData(
                            key: AppLocalStorage.onboarding, value: true);*/
                        pushReplacement(context, const NavBarWidget());
                      },
                      width: 120)
              ],
            ),
          )
        ]),
      ),
    );
  }
}
