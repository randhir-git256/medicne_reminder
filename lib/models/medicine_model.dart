import 'package:hive/hive.dart';

part 'medicine_model.g.dart';

@HiveType(typeId: 0)
class Medicine extends HiveObject {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String dosage;

  @HiveField(2)
  final String schedule;

  @HiveField(3)
  final String type;

  @HiveField(4)
  final int compartment;

  @HiveField(5)
  final String color;

  @HiveField(6)
  final String frequency;

  @HiveField(7)
  final String timesPerDay;

  @HiveField(8)
  final String status;

  @HiveField(9)
  final int day;

  Medicine({
    required this.name,
    required this.dosage,
    required this.schedule,
    required this.type,
    required this.compartment,
    required this.color,
    required this.frequency,
    required this.timesPerDay,
    this.status = 'pending',
    this.day = 1,
  });
}