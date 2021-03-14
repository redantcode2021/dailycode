import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

part 'associate.g.dart';

@HiveType(typeId: 0)
class Associate extends HiveObject {
  @HiveField(0)
  final String name;
  @HiveField(1)
  final int age;
  @HiveField(2)
  final int phone;
  @HiveField(3)
  final DateTime joinDate;
  @HiveField(4)
  final bool isSenior;

  Associate({
    @required this.name,
    this.age,
    this.phone,
    this.joinDate,
    this.isSenior,
  });
}
