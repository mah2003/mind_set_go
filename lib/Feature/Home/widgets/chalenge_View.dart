import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:mind_set_go/Core/Functions/navigation.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:mind_set_go/Feature/chalanges/add_chalanage.dart';
import 'package:mind_set_go/Feature/chalanges/challenge_item_widget.dart';

class challenge_View extends StatefulWidget {
  const challenge_View({super.key});

  @override
  State<challenge_View> createState() => _challenge_ViewState();
}

class _challenge_ViewState extends State<challenge_View> {
  List<String> challengeIds = [];

  Future<void> getChallengesData() async {
    await FirebaseFirestore.instance
        .collection('challenges')
        .get()
        .then((collection) {
      collection.docs.forEach((document) {
        log(document.id);
        challengeIds.add(document.id);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: AppColors.blue,
        appBar: AppBar(
          actions: [
            ElevatedButton(
              onPressed: () {
                push(context, add_challenge());
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              child: const Icon(
                Icons.add_rounded,
                size: 35,
                color: Colors.black,
              ),
            )
          ],
          backgroundColor: AppColors.blue,
        ),
        body: Padding(
          padding: EdgeInsets.all(12),
          child: Column(children: [
            SizedBox(
              height: 50,
              width: double.infinity,
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.white,
                      foregroundColor: AppColors.black,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  onPressed: () {},
                  child: Text("Goin To Challenge")),
            ),
            const Gap(15),
            const Text(
                "It is pain itself that rebukes pleasure in the act of being free from pain in the moment of enjoyment. It is pain itself that rebukes pleasure in the act of being free from pain in the moment of enjoyment.",
                style: TextStyle(color: AppColors.white, fontSize: 18)),
            const Gap(15),
            Expanded(
              child: FutureBuilder(
                  future: getChallengesData(),
                  builder: (builder, snapshot) {
                    return ListView.builder(
                        itemCount: challengeIds.length,
                        itemBuilder: (context, index) {
                          return ChallengeItemWidget(
                              Docid: challengeIds[index]);
                        });
                  }),
            ),
          ]),
        ));
  }
}
