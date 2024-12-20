import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mind_set_go/Core/utils/Colors.dart';
import 'package:quickalert/quickalert.dart';

class ChallengeItemWidget extends StatelessWidget {
  String Docid;
  ChallengeItemWidget({super.key, required this.Docid});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:
          FirebaseFirestore.instance.collection('challenges').doc(Docid).get(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Show QuickAlert when data is loading
          WidgetsBinding.instance.addPostFrameCallback((_) {
            QuickAlert.show(
              context: context,
              type: QuickAlertType.loading,
              title: 'Loading',
              text: 'Please wait while we fetch the data...',
              barrierDismissible:
                  false, // Prevent closing the alert accidentally
            );
          });
          // Return an empty container while the alert is displayed
          return Container();
        } else if (snapshot.connectionState == ConnectionState.done) {
          Navigator.of(context).pop(); // Close the QuickAlert if visible
          if (snapshot.hasData) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            return Container(
              margin: const EdgeInsets.only(bottom: 10, right: 5, left: 5),
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: AppColors.white,
              ),
              child: ListTile(
                leading: const Icon(
                  Icons.run_circle_rounded,
                  color: Colors.blue,
                  size: 50,
                ),
                title: Text(
                  data['name'],
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                subtitle: Text(
                  ' ID ${data['id']}  ${data['startDate']} To ${data['endDate']} ',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: Text(
                'No data found.',
                style: TextStyle(color: Colors.red, fontSize: 18),
              ),
            );
          }
        } else if (snapshot.hasError) {
          Navigator.of(context).pop(); // Close the QuickAlert if visible
          return Center(
            child: Text(
              'An error occurred: ${snapshot.error}',
              style: TextStyle(color: Colors.red, fontSize: 18),
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
