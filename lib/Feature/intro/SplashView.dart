import 'package:flutter/material.dart';
import 'package:mind_set_go/Core/Functions/navigation.dart';
import 'package:mind_set_go/Feature/intro/onboarding/onboading_view.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      /*  String? token = AppLocalStorage.getCachedData(key: AppLocalStorage.token);
      bool isOnboardingShown =
          AppLocalStorage.getCachedData(key: AppLocalStorage.onboarding) ??
              false;

      if (token != null) {
        pushAndRemoveUntil(context, PatientNavBarWidget());
      } else {
        if (isOnboardingShown) {
          pushReplacement(context, const WelcomeView());
        } else {*/
      pushReplacement(context, const OnboardingView());
      /*  }
      }*/
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo.shade900,
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Image.asset(
          'assets/Splash.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
