import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';

class All_habits_View extends StatefulWidget {
  const All_habits_View({super.key, required this.model});

  final List<HabitModel?> model;

  @override
  State<All_habits_View> createState() => _All_habits_ViewState();
}

class _All_habits_ViewState extends State<All_habits_View> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "All Habits You Add",
            style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(children: [
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              widget.model.first?.title ?? '',
              style: const TextStyle(color: AppColors.white),
            ),
            const Gap(5),
            Row(
              children: [
                const Icon(
                  Icons.alarm,
                  color: AppColors.white,
                ),
                const Gap(10),
                Text(
                  '${widget.model.first?.startTime} - ${widget.model.first?.endTime}',
                  style: const TextStyle(color: AppColors.white),
                )
              ],
            ),
            const Gap(5),
            Text(
              widget.model.first?.note ?? '',
              style: const TextStyle(color: AppColors.white),
            ),
          ]),
          Container(
            width: .5,
            height: 60,
            color: AppColors.white,
          ),
          const Gap(10),
          RotatedBox(
            quarterTurns: 3,
            child: Text(
              (widget.model.first?.isCompleted ?? false) ? 'COMPLETED' : 'TODO',
              style: const TextStyle(color: AppColors.white, fontSize: 13),
            ),
          ),
        ]),
      ),
    );
  }
}
