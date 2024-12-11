import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';

List<String> learning = [
  "Why should we drink water often?",
  "Benefits of regular walking",
  "History",
  "Literature",
  "Art",
  "Physics",
  "Chemistry",
  "Biology",
  "Geography",
  "Computer Science"
];
List<String> suggested = [
  "Walk",
  "Swim",
  "Read",
  "Write",
  "Art",
  "Read articles",
  "Read in Sona",
  "Read in Quran",
  "Gym",
  "Drink Water"
];
List<String> club = [
  "Istanbul",
  "Runners",
  "History",
  "Literature",
  "Readers",
  "Physics",
  "Chemistry",
  "Biology",
  "Writers",
  "Computer Science"
];
List<String> challengs = [
  "Best Runners",
  "Best Writers",
  "Best Programmer",
  "Best Coders",
  "Gym",
  "faster Man",
  "GOOD speaker",
  "fast understander",
  "Speach ",
  "Computer "
];

class ExploreView extends StatefulWidget {
  const ExploreView({super.key});

  @override
  State<ExploreView> createState() => _ExploreViewState();
}

class _ExploreViewState extends State<ExploreView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backGroundExplore,
      appBar: AppBar(
        title: const Text("Explore",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30)),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_rounded,
              size: 35,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSectionTitle("Suggested for You"),
            _buildCardList(suggested, Colors.blueAccent, "Minits", true),
            const Gap(20),
            _buildSectionTitle("Habit Clubs"),
            _buildCardList(club, AppColors.black, "Members", false),
            const Gap(20),
            _buildSectionTitle("Challenges"),
            _buildCardList(challengs, Colors.blueAccent, "Members", true),
            const Gap(20),
            _buildSectionTitle("Learning"),
            _buildCardList(learning, Colors.blueAccent, "Views", true),
          ],
        ),
      ),
    );
  }

  // Section Title widget
  Row _buildSectionTitle(String title) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.black)),
        TextButton(
          onPressed: () {},
          child: const Text(
            "VIEW All",
            style: TextStyle(color: AppColors.blue, fontSize: 15),
          ),
        ),
      ],
    );
  }

  SizedBox _buildCardList(
      List<String> data, Color cardColor, String unit, bool isChallenge) {
    return SizedBox(
      height: MediaQuery.sizeOf(context).height / 7,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: data.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: MediaQuery.sizeOf(context).width / 4,
                height: MediaQuery.sizeOf(context).height / 3.2,
                decoration: BoxDecoration(
                  color: cardColor,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 5,
                      offset: Offset(2, 2),
                    ),
                  ],
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        data[index],
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: AppColors.white,
                        ),
                      ),
                      const Gap(15),
                      Text(
                        " ${index * 5 + 5} $unit",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
