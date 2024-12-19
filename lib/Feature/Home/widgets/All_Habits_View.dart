import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/Services/local_storage.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Feature/Home/widgets/Habit_Item_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';

class AllHabitsView extends StatefulWidget {
  const AllHabitsView({super.key});

  @override
  State<AllHabitsView> createState() => _AllHabitsViewState();
}

class _AllHabitsViewState extends State<AllHabitsView> {
  late Box habitBox;

  @override
  void initState() {
    super.initState();
    habitBox = AppLocalStorage.habitBox; // Initialize habit box
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "All Habits You Added",
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: Column(
        children: [
          const Gap(20),
          Expanded(
            // Add Expanded here
            child: ValueListenableBuilder(
              valueListenable: habitBox.listenable(),
              builder: (context, box, child) {
                // Fetch all the habits from the box into a list
                List<HabitModel> allHabitList = [];
                box.keys.forEach((key) {
                  var habit = box.get(key);
                  if (habit != null) {
                    allHabitList.add(habit);
                  }
                });

                return ListView.builder(
                  physics: const BouncingScrollPhysics(),
                  itemCount: allHabitList.length,
                  itemBuilder: (context, index) {
                    HabitModel habit = allHabitList[index];

                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        if (direction == DismissDirection.endToStart) {
                          // Delete the habit when swiped left
                          box.delete(habit.id);
                        } else {
                          // Mark as completed when swiped right
                          box.put(
                            habit.id,
                            HabitModel(
                              id: habit.id,
                              title: habit.title,
                              note: habit.note,
                              startdate: habit.startdate,
                              enddate: habit.enddate,
                              startTime: habit.startTime,
                              endTime: habit.endTime,
                              color: habit.color,
                              isCompleted: true,
                            ),
                          );
                        }
                      },
                      secondaryBackground: Container(
                        padding: const EdgeInsets.all(10),
                        margin: const EdgeInsets.only(bottom: 10),
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
                        model: habit,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}







/*import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/Services/local_storage.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Feature/Home/widgets/Habit_Item_widget.dart';
import 'package:hive_flutter/hive_flutter.dart';
class All_habits_View extends StatefulWidget {
  const All_habits_View({super.key});
 
  @override
  State<All_habits_View> createState() => _All_habits_ViewState();
}

class _All_habits_ViewState extends State<All_habits_View> {
   final List<HabitModel> all_Habit_List = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "All Habits You Added",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
        ),
        body: Column(
          children: [
            const Gap(20),
            ValueListenableBuilder(
            valueListenable: AppLocalStorage.habitBox.listenable(),
            builder: (context, box, child) {
           
              box.keys.forEach((key) )
                var habit = AppLocalStorage.getCachedhabit(key);

            ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: all_Habit_List.length,
                      itemBuilder: (context, index) {
                        return Dismissible(
                          key: UniqueKey(),
                          onDismissed: (direction) {
                            if (direction == DismissDirection.endToStart) {
                              box.delete(all_Habit_List[index]?.id);
                            } else {
                              box.put(
                                all_Habit_List[index]?.id,
                                HabitModel(
                                  id: all_Habit_List[index]?.id ?? '',
                                  title: all_Habit_List[index]?.title ?? '',
                                  note: all_Habit_List[index]?.note ?? '',
                                  startdate: all_Habit_List[index]?.startTime ?? '',
                                  enddate: all_Habit_List[index]?.startTime ?? '',
                                  startTime: all_Habit_List[index]?.startTime ?? '',
                                  endTime: all_Habit_List[index]?.endTime ?? '',
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
                            model: all_Habit_List[index],
                          ),
                        );
                      },
                    ),
          ],
        ));
  }
}
*/