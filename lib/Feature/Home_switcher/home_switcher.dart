import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mind_set_go/Core/widgets/Nav_Bar_Widget.dart';
import 'package:mind_set_go/Feature/auth/login.dart';

class home_switcher extends StatelessWidget {
  const home_switcher({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (Builder, Snapshot) {
            if (Snapshot.hasData) {
              return NavBarWidget();
            } else {
              return LoginView();
            }
          }),
    );
  }
}
