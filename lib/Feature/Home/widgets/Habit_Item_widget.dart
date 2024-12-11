import 'package:flutter/material.dart';
import 'package:mind_set_go/Core/Functions/navigation.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Core/widgets/Add_Habit.dart';

class Habit_Item_widget extends StatelessWidget {
  const Habit_Item_widget({
    super.key,
    required this.model,
  });
  final HabitModel? model;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        if (model?.isCompleted != false) {
          push(
              context,
              AddHabit(
                model: model,
              ));
        }
      },
      child: Container(
          margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: (model?.color == 0)
                  ? AppColors.blue
                  : (model?.color == 1)
                      ? AppColors.orange_warnning
                      : (model?.color == 2)
                          ? AppColors.red_error
                          : Colors.green),
          child: ListTile(
            leading: const Icon(
              Icons.local_fire_department_outlined,
              color: AppColors.white,
              size: 50,
            ),
            title: Text(
              model?.title ?? '',
              style: const TextStyle(
                  color: AppColors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25),
            ),
            subtitle: Text(
              '${model?.startTime} - ${model?.endTime}',
              style: const TextStyle(
                  color: AppColors.white, fontWeight: FontWeight.bold),
            ),
          )),
    );
  }
}
