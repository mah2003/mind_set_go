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
  "Gum",
  "faster Man",
  "GOOD speaker",
  "fast understander",
  "Speach ",
  "Computer Science"
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
              ))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Suggested for You"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "VIEW All",
                    style: TextStyle(color: AppColors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
            const Gap(10),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 11,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            suggested[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.white),
                          ),
                          Text(" ${index * 5 + 5} Minits",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                              ))
                        ],
                      )),
                    ),
                  );
                }),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(" Habit Clubs"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "VIEW All",
                    style: TextStyle(color: AppColors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
            const Gap(10),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 11,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Column(
                        children: [
                          Text(
                            club[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.black),
                          ),
                          const Gap(15),
                          Text(" ${index * 5 + 5} Members",
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ))
                        ],
                      )),
                    ),
                  );
                }),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Challenges"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "VIEW All",
                    style: TextStyle(color: AppColors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
            const Gap(10),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 7,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 225,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Icon(
                            Icons.hourglass_full_sharp,
                            color: AppColors.white,
                          ),
                          Text(
                            challengs[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.white),
                          ),
                          const Gap(15),
                          Text(" ${index * 5 + 5} Members",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ))
                        ],
                      )),
                    ),
                  );
                }),
              ),
            ),
            const Gap(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Learning"),
                TextButton(
                  onPressed: () {},
                  child: const Text(
                    "VIEW All",
                    style: TextStyle(color: AppColors.blue, fontSize: 15),
                  ),
                ),
              ],
            ),
            const Gap(12),
            SizedBox(
              height: MediaQuery.sizeOf(context).height / 7,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: List.generate(10, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Container(
                      width: 225,
                      height: 150,
                      decoration: BoxDecoration(
                        color: Colors.blueAccent,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            learning[index],
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: AppColors.white),
                          ),
                          const Gap(15),
                          Text(" ${index * 5 + 5} Views",
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 14,
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
}
