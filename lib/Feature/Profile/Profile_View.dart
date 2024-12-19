import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';

List<String> frinds = [
  "Mohammed Ramadan ",
  "Rami Abbas",
  "Hannan Amr",
  "Ahmed Said",
  "Ali Nour",
  "Gmall Hani",
  "qasem Alaa",
  "Taher Hosni",
  "Tamer Ali"
];
List<int> points = [980, 870, 852, 805, 750, 705, 505, 120, 80];

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
            onPressed: () {
              FirebaseAuth.instance.signOut();
            },
            icon: const Icon(
              Icons.logout_rounded,
            ),
            iconSize: 36,
          ),
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
            const Gap(15),
            Expanded(
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
                    Expanded(child: _buildButton('Activity', AppColors.back)),
                    Expanded(child: _buildButton('Friends', Colors.white)),
                    Expanded(
                        child: _buildButton('Achievements', AppColors.back)),
                  ],
                ),
              ),
            ),
            const Gap(20),
            // Gamification Progress Section
            _buildProgressSection(),
            const Gap(20),
            // Leaderboard section
            SizedBox(
              height: MediaQuery.sizeOf(context).height - 538,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: List.generate(frinds.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: ListTile(
                      leading: Icon(Icons.person_rounded),
                      title: Text(
                        frinds[index],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(points[index].toString()),
                      trailing: IconButton(
                          onPressed: () {}, icon: Icon(Icons.delete_rounded)),
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

  // Gamification Progress Section
  Widget _buildProgressSection() {
    return Column(
      children: [
        const Text(
          'The Progress',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        const Gap(10),
        _buildProgressBar('Level 1', 0.75, AppColors.blue),
        const Gap(10),
        _buildProgressBar('Achievement: First Milestone', 0.50, Colors.orange),
        const Gap(10),
        _buildProgressBar('Next Badge: 2000 Points', 0.20, Colors.green),
      ],
    );
  }

  // Custom Progress Bar Widget
  Widget _buildProgressBar(String label, double progress, Color color) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label),
        const Gap(5),
        LinearProgressIndicator(
          value: progress,
          color: color,
          backgroundColor: Colors.grey[300],
        ),
      ],
    );
  }
}
