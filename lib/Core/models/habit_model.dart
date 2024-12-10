import 'package:hive/hive.dart';

part 'habit_model.g.dart';

@HiveType(typeId: 0)
class HabitModel extends HiveObject {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final String title;
  @HiveField(2)
  final String note;
  @HiveField(3)
  final String startdate;
  @HiveField(4)
  final String enddate;
  @HiveField(5)
  final String startTime;
  @HiveField(6)
  final String endTime;
  @HiveField(7)
  final int color;
  @HiveField(8)
  final bool isCompleted;

  HabitModel(
      {required this.id,
      required this.title,
      required this.note,
      required this.startdate,
      required this.enddate,
      required this.startTime,
      required this.endTime,
      required this.color,
      required this.isCompleted});
}
