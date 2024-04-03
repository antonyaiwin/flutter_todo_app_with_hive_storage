// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/hive_flutter.dart';

part 'todo_model.g.dart';

@HiveType(typeId: 0)
class TodoModel {
  @HiveField(0)
  String title;
  @HiveField(1)
  bool isCompleted;
  @HiveField(2)
  String category;

  TodoModel({
    required this.title,
    required this.isCompleted,
    required this.category,
  });
}
