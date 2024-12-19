import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Feature/Home/widgets/Habits_List.dart';

class HomeView extends StatefulWidget {
  final HabitModel? model;

  HomeView({super.key, this.model});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String selectedDate = DateFormat.yMd().format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundExplore,
      appBar: AppBar(
        title: const Center(
            child: Text(
          "Now All Habits In One Place",
          style: TextStyle(fontWeight: FontWeight.bold, fontFamily: "Cairo"),
        )),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 36,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildButton('Daily', Colors.white)),
                    Expanded(child: _buildButton('Weekly', Colors.white)),
                    Expanded(child: _buildButton('Monthly', Colors.white)),
                  ],
                ),
              ),
              Expanded(child: HabitListBuilder()),
            ],
          ),
        ),
      ),
    );
  }
}

ElevatedButton _buildButton(String label, Color backgroundColor) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: backgroundColor,
      foregroundColor: AppColors.blue,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
    ),
    onPressed: () {},
    child: Text(
      label,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.center,
    ),
  );
}
