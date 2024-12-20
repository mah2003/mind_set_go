import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:mind_set_go/Core/Functions/navigation.dart';
import 'package:mind_set_go/Core/Services/local_storage.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Feature/Home/widgets/All_Habits_View.dart';
import 'package:mind_set_go/Feature/Home/widgets/Habit_Item_widget.dart';
import 'package:mind_set_go/Feature/Home/widgets/chalenge_View.dart';

class HabitListBuilder extends StatefulWidget {
  const HabitListBuilder({
    super.key,
  });

  @override
  State<HabitListBuilder> createState() => _HabitListBuilderState();
}

class _HabitListBuilderState extends State<HabitListBuilder> {
  String selectedDate = DateFormat.yMd().format(DateTime.now());
  List<HabitModel?> allHabitsList = [];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Gap(5),
        DatePicker(
          height: MediaQuery.sizeOf(context).height / 7.5,
          width: MediaQuery.sizeOf(context).width / 5,
          DateTime.now().subtract(const Duration(days: 2)),
          initialSelectedDate: DateTime.now(),
          selectionColor: AppColors.blue,
          selectedTextColor: Colors.white,
          dayTextStyle: const TextStyle(fontSize: 16),
          monthTextStyle: const TextStyle(fontSize: 10),
          dateTextStyle: const TextStyle(fontSize: 16),
          onDateChange: (date) {
            setState(() {
              selectedDate = DateFormat.yMd().format(date);
            });
          },
        ),
        const Gap(10),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Challenges"),
            TextButton(
              onPressed: () {
                push(context, const challenge_View());
              },
              child: const Text(
                "View All",
                style: TextStyle(color: AppColors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
        Container(
          height: MediaQuery.sizeOf(context).height / 14,
          width: MediaQuery.sizeOf(context).width,
          child: Image.asset(
            fit: BoxFit.cover,
            'assets/Challenge Card.png',
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text("Habits"),
            TextButton(
              onPressed: () {
                push(context, AllHabitsView());
              },
              child: const Text(
                "View All",
                style: TextStyle(color: AppColors.blue, fontSize: 15),
              ),
            ),
          ],
        ),
        Expanded(
          child: ValueListenableBuilder(
            valueListenable: AppLocalStorage.habitBox.listenable(),
            builder: (context, box, child) {
              List<HabitModel?> habitList = [];
              int completedCount = 0;
              box.keys.forEach((key) {
                var habit = AppLocalStorage.getCachedhabit(key);

                if (habit != null) {
                  try {
                    DateTime startDate =
                        DateFormat('MM/dd/yyyy').parse(habit.startdate);
                    DateTime? endDate = habit.enddate != null
                        ? DateFormat('MM/dd/yyyy').parse(habit.enddate)
                        : null;
                    DateTime selectedDateParsed =
                        DateFormat('MM/dd/yyyy').parse(selectedDate);

                    if (endDate != null) {
                      for (DateTime date = startDate;
                          date.isBefore(endDate) ||
                              date.isAtSameMomentAs(endDate);
                          date = date.add(Duration(days: 1))) {
                        if (date.isAtSameMomentAs(selectedDateParsed)) {
                          habitList.add(habit);

                          // Check if the habit is completed
                          if (habit.isCompleted) {
                            completedCount++;
                          }
                        }
                      }
                    } else if (startDate.isAtSameMomentAs(selectedDateParsed)) {
                      habitList.add(habit);

                      // Check if the habit is completed
                      if (habit.isCompleted) {
                        completedCount++;
                      }
                    }
                  } catch (e) {
                    print(
                        "Error parsing date for habit: ${habit.title}. Error: $e");
                  }
                }
              });

              String completionText =
                  "$completedCount From ${habitList.length} Done";

              return Column(
                children: [
                  Container(
                    height: MediaQuery.sizeOf(context).height / 12,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColors.blue,
                    ),
                    child: ListTile(
                      leading: const Icon(
                        Icons.crisis_alert_rounded,
                        color: AppColors.white,
                      ),
                      title: const Text(
                        "Your daily goals almost done! 🔥",
                        style: TextStyle(color: AppColors.white, fontSize: 19),
                      ),
                      subtitle: Text(
                        completionText, // Display the dynamically calculated completion text
                        style: const TextStyle(
                            color: AppColors.white, fontSize: 14),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: habitList.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              box.delete(habitList[index]?.id);
                            } else {
                              box.put(
                                habitList[index]?.id,
                                HabitModel(
                                  id: habitList[index]?.id ?? '',
                                  title: habitList[index]?.title ?? '',
                                  note: habitList[index]?.note ?? '',
                                  startdate: habitList[index]?.startTime ?? '',
                                  enddate: habitList[index]?.startTime ?? '',
                                  startTime: habitList[index]?.startTime ?? '',
                                  endTime: habitList[index]?.endTime ?? '',
                                  color: 3,
                                  isCompleted: true,
                                ),
                              );
                            }
                          },
                          secondaryBackground: Container(
                            padding: EdgeInsets.all(10),
                            margin: EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.red,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.delete,
                                  color: AppColors.white,
                                ),
                                Gap(5),
                                Text(
                                  'Delete Habit Today',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                          background: Container(
                            padding: const EdgeInsets.all(10),
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.green,
                            ),
                            child: const Row(
                              children: [
                                Icon(
                                  Icons.check,
                                  color: AppColors.white,
                                ),
                                Gap(5),
                                Text(
                                  'Complete Habit Today',
                                  style: TextStyle(color: AppColors.white),
                                ),
                              ],
                            ),
                          ),
                          child: Habit_Item_widget(
                            model: habitList[index],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          ),
        )
      ],
    );
  }
}
