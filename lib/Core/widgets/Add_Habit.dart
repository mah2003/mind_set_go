import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/Services/local_storage.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:intl/intl.dart';
import 'package:mind_set_go/Core/widgets/custom_button.dart';
import 'package:mind_set_go/Core/widgets/nav_bar_widget.dart';

import '../Functions/navigation.dart';

class AddHabit extends StatefulWidget {
  const AddHabit({super.key, this.model});
  final HabitModel? model;
  @override
  State<AddHabit> createState() => _AddHabitState();
}

class _AddHabitState extends State<AddHabit> {
  int colorIndex = 0;
  String startdate = DateFormat.yMd().format(DateTime.now());
  String enddate = DateFormat.yMd().format(DateTime.now());
  String starttime = DateFormat("hh:mm a").format(DateTime.now());
  String endtime = DateFormat("hh:mm a").format(DateTime.now());
  var titleControlar = TextEditingController();
  var noteControlar = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundExplore,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Create Custom Habit ",
          style: TextStyle(
            fontSize: 26,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const Text(
                "Name",
              ),
              const Gap(5),
              TextFormField(
                controller: titleControlar,
                decoration: const InputDecoration(hintText: 'Add  Habit'),
              ),
              const Gap(10),
              const Text(
                "Note",
              ),
              const Gap(5),
              TextFormField(
                controller: noteControlar,
                decoration: const InputDecoration(hintText: 'Add Habit  Note'),
              ),
              const Text(
                " Start Habit Date",
              ),
              const Gap(10),
              TextFormField(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2040))
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        startdate = DateFormat.yMd().format(value);
                      });
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: startdate,
                  //  hintStyle:// getBodyTextStyle(),
                  suffixIcon: const Icon(
                    Icons.calendar_month,
                    color: AppColors.blue,
                  ),
                ),
              ),
              const Gap(10),
              const Text(
                "Habit End Date",
              ),
              TextFormField(
                readOnly: true,
                onTap: () {
                  showDatePicker(
                          context: context,
                          firstDate: DateTime.now(),
                          initialDate: DateTime.now(),
                          lastDate: DateTime(2040))
                      .then((value) {
                    if (value != null) {
                      setState(() {
                        enddate = DateFormat.yMd().format(value);
                      });
                    }
                  });
                },
                decoration: InputDecoration(
                  hintText: enddate,
                  //  hintStyle:// getBodyTextStyle(),
                  suffixIcon: const Icon(
                    Icons.calendar_month,
                    color: AppColors.blue,
                  ),
                ),
              ),
              const Gap(10),
              const Row(
                children: [
                  Expanded(
                      child: Text(
                    "start time",
                  )),
                  Gap(10),
                  Expanded(
                      child: Text(
                    "end Time",
                  )),
                ],
              ),
              const Gap(5),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          if (value != null) {
                            setState(() {
                              starttime = value.format(context);
                            });
                          }
                        });
                      },
                      decoration: InputDecoration(
                        hintText: starttime,
                        suffixIcon: const Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ),
                  const Gap(10),
                  Expanded(
                    child: TextFormField(
                      readOnly: true,
                      onTap: () {
                        showTimePicker(
                                context: context, initialTime: TimeOfDay.now())
                            .then((value) {
                          setState(() {
                            if (value != null) {
                              endtime = value.format(context);
                            }
                          });
                        });
                      },
                      decoration: InputDecoration(
                        hintText: endtime,
                        suffixIcon: const Icon(
                          Icons.watch_later_outlined,
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Gap(30),
              Row(
                children: [
                  Expanded(
                    child: Row(
                      children: List.generate(3, (index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 8.0),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                colorIndex = index;
                              });
                            },
                            child: CircleAvatar(
                              radius: 24,
                              backgroundColor: (index == 0)
                                  ? AppColors.blue
                                  : (index == 1)
                                      ? AppColors.orange_warnning
                                      : AppColors.red_error,
                              child: (colorIndex == index)
                                  ? const Icon(Icons.check, color: Colors.white)
                                  : null,
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  CustomButton(
                    width: 145,
                    text: "Add New Habit",
                    onPressed: () {
                      String id = '$Title _ ${DateTime.now().toString()}';
                      AppLocalStorage.cachehabit(
                          id,
                          HabitModel(
                              id: id,
                              title: titleControlar.text,
                              note: noteControlar.text,
                              startdate: startdate,
                              enddate: enddate,
                              startTime: starttime,
                              endTime: endtime,
                              color: colorIndex,
                              isCompleted: true));
                      pushAndRemoveUntil(context, NavBarWidget());
                    },
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
