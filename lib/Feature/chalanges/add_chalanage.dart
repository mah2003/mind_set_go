import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';
import 'package:mind_set_go/Core/Functions/navigation.dart';
import 'package:mind_set_go/Core/Services/notificationServices/localNotificationService.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Core/widgets/custom_button.dart';
import 'package:mind_set_go/Feature/Home/widgets/chalenge_View.dart';

class add_challenge extends StatefulWidget {
  const add_challenge({super.key});

  @override
  State<add_challenge> createState() => _add_challengeState();
}

class _add_challengeState extends State<add_challenge> {
  String startdate = DateFormat.yMd().format(DateTime.now());
  String enddate = DateFormat.yMd().format(DateTime.now());
  var titleControlar = TextEditingController();
  var idControlar = TextEditingController();
  Future storeChallengeData() async {
    await FirebaseFirestore.instance.collection('challenges').add({
      'name': titleControlar.text.trim(),
      'id': idControlar.text.trim(),
      'startDate': startdate,
      'endDate': enddate
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundExplore,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          "Create New Challenge ",
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
                  decoration:
                      const InputDecoration(hintText: 'challenge namego s'),
                ),
                const Gap(10),
                const Text(
                  "Id ",
                ),
                const Gap(5),
                TextFormField(
                  controller: idControlar,
                  decoration: const InputDecoration(hintText: 'Challenge Id'),
                ),
                const Text(
                  "Start Challege Date",
                ),
                const Gap(5),
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
                    suffixIcon: const Icon(
                      Icons.calendar_month,
                      color: AppColors.blue,
                    ),
                  ),
                ),
                const Gap(10),
                const Text(
                  "End Challege Date",
                ),
                const Gap(5),
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
                    suffixIcon: const Icon(
                      Icons.calendar_month,
                      color: AppColors.blue,
                    ),
                  ),
                ),
                const Gap(10),
                CustomButton(
                  width: double.infinity,
                  text: "Add New Challenge",
                  onPressed: () async {
                    // Send notification

                    LocalNotificationService.showNotification();
                    storeChallengeData();
                    push(context, challenge_View());
                  },
                )
              ],
            )),
      ),
    );
  }
}
