import 'package:flutter/material.dart';
import 'package:mind_set_go/Core/Services/local_storage.dart';
import 'package:mind_set_go/Core/Services/notificationServices/localNotificationService.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';
import 'package:mind_set_go/Feature/intro/SplashView.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mind_set_go/firebase_options.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  LocalNotificationService.initialize();
  await Hive.initFlutter();
  Hive.registerAdapter(HabitModelAdapter());
  await Hive.openBox<HabitModel>('habitsBox');
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  AppLocalStorage.init();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false, home: SplashView());
  }
}
