import 'package:flutter/material.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';

class challenge_View extends StatelessWidget {
  const challenge_View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.blue,
      appBar: AppBar(
        backgroundColor: AppColors.blue,
      ),
      body: SizedBox(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        child: Image.asset(
          'assets/Content.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
