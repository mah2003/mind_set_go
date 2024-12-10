import 'package:hive/hive.dart';
import 'package:mind_set_go/Core/models/habit_model.dart';

class AppLocalStorage {
  // static String kIsUploaded = 'isUploaded';
  // static String kIsDarkMode = 'isDarkMode';
//  static String kUsername = 'name';
  // static String kUserImage = 'image';

  // static late Box userBox;
  static late Box<HabitModel> habitBox;
  static init() {
    //  userBox = Hive.box('userBox');
    habitBox = Hive.box('habitsBox');
  }

  /* static cacheData(String key, value) {
    userBox.put(key, value);
  }*/

  /* static getCachedData(String key) {
    return userBox.get(key);
  }*/

  static cachehabit(String key, HabitModel value) {
    habitBox.put(key, value);
  }

  static HabitModel? getCachedhabit(String key) {
    return habitBox.get(key);
  }
}
