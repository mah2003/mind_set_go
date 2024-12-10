import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';

class ProfileView extends StatelessWidget {
  ProfileView({super.key});
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
          "Your Profile",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 40),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings_rounded,
            ),
            iconSize: 36,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            const ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/Splash.png'),
                radius: 40,
              ),
              title: Text(
                'Mahmoud Masoud',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text('1452 Points'),
            ),
            const Gap(30),
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
                    Expanded(child: _buildButton('Activity', Colors.white)),
                    Expanded(child: _buildButton('Friends', Colors.white)),
                    Expanded(child: _buildButton('Achievements', Colors.white)),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  ElevatedButton _buildButton(String label, Color backgroundColor) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor, // Set background color to white
        foregroundColor:
            AppColors.blue, // Text color should contrast with the background
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      onPressed: () {},
      child: Text(
        label, maxLines: 1, // Ensure the text doesn't wrap onto a second line
        overflow: TextOverflow.ellipsis, // Truncate text with "..."
        textAlign: TextAlign.center,
      ),
    );
  }
}
