import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';

List<String> activities = [
  "Completed",
  "Skipped",
  "Scores",
  "Beast Streak Day",
  "Success Rate",
  "Failed"
];
List<int> values = [93, 3, 93, 3, 92, 3];

class ActivityView extends StatelessWidget {
  ActivityView({super.key});
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
              Icons.percent_rounded,
            ),
            iconSize: 36,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            // Tab Buttons (Daily, Weekly, Monthly)
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
            const Gap(15),

            Expanded(
              child: ListView.builder(
                itemCount: activities.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Container(
                      width: double.infinity,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Row(
                                  children: [
                                    Icon(
                                      _getActivityIcon(index),
                                      color: _getActivityColor(index),
                                      size: 28,
                                    ),
                                    const Gap(10),
                                    Text(
                                      "${activities[index]}:",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 24,
                                        color: Colors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "${values[index].toString()} %",
                                      style: const TextStyle(
                                        color: AppColors.black,
                                        fontSize: 40,
                                      ),
                                    ),
                                    const Gap(5),
                                    SizedBox(
                                      width: MediaQuery.sizeOf(context).width /
                                          4, // Ensure a fixed width for the progress bar
                                      child: LinearProgressIndicator(
                                        value: _getProgressValue(index),
                                        backgroundColor: Colors.grey[300],
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          _getActivityColor(index),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
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

  // Function to map activities to an icon
  IconData _getActivityIcon(int index) {
    switch (index) {
      case 0:
        return Icons.check_circle_outline;
      case 1:
        return Icons.cancel_outlined;
      case 2:
        return Icons.score;
      case 3:
        return Icons.flash_on; // Use this for Beast Streak Day
      case 4:
        return Icons.check_circle;
      case 5:
        return Icons.error_outline;
      default:
        return Icons.help_outline;
    }
  }
}

Color _getActivityColor(int index) {
  switch (index) {
    case 0:
      return Colors.green;
    case 1:
      return Colors.red;
    case 2:
      return Colors.blue;
    case 3:
      return Colors.orange;
    case 4:
      return Colors.purple;
    case 5:
      return Colors.grey;
    default:
      return Colors.black;
  }
}

//Function to calculate progress based on activity
double _getProgressValue(int index) {
  switch (index) {
    case 0: // Completed
      return values[index] / 100.0;
    case 1: // Skipped
      return values[index] / 10.0;
    case 2: // Scores
      return values[index] / 100.0;
    case 3: // Streak (Flash icon)
      return values[index] / 10.0;
    case 4: // Success Rate
      return values[index] / 100.0;
    case 5: // Failed
      return values[index] / 10.0;
    default:
      return 0.0;
  }
}
