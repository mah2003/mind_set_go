import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';

List<String> activities = [
  "Completed",
  "Skipped",
  "Scores",
  "Beast Streak Day",
  "Success Rate",
  "Faild"
];
List<int> values = [25, 7, 93, 3, 92, 3];

class Activity_View extends StatelessWidget {
  Activity_View({super.key});
  final ButtonStyle buttonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.white,
    foregroundColor: AppColors.blue,
    disabledBackgroundColor: AppColors.back,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundExplore,
      appBar: AppBar(
        title: const Text(
          "Activity",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.family_restroom_outlined,
            ),
            iconSize: 36,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            SizedBox(
              height: 36,
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  maximumSize: MediaQuery.sizeOf(context),
                  backgroundColor: AppColors.back,
                  foregroundColor: AppColors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  padding: EdgeInsets.zero,
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(child: _buildButton('Daily', Colors.white)),
                    Expanded(child: _buildButton('Weekly', Colors.white)),
                    Expanded(child: _buildButton('Monthly', Colors.white)),
                  ],
                ),
              ),
            ),
            const Gap(15),
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 250,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(6, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0),
                    child: Container(
                      width: MediaQuery.sizeOf(context).width,
                      height: MediaQuery.sizeOf(context).height / 6,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Center(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            " ${activities[index]} :",
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                                color: Colors.grey),
                          ),
                          const Gap(15),
                          Text(values[index].toString(),
                              style: const TextStyle(
                                color: AppColors.black,
                                fontSize: 40,
                              ))
                        ],
                      )),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
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
}
