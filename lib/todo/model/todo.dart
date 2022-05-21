import 'package:isar/isar.dart';

part 'todo.g.dart';

@Collection()
class Todo {
  int? id = Isar.autoIncrement;
  final String text;
  final bool isCompleted;
  final DateTime? completedTime;
  DateTime? createdTime;

  Todo(this.text,
      {this.id,
      this.isCompleted = false,
      this.completedTime,
      this.createdTime}) {
    if (this.createdTime == null) {
      this.createdTime = DateTime.now();
    }
  }

  Todo copyWith(
      {int? id,
      String? text,
      bool? isCompleted,
      DateTime? completedTime,
      DateTime? createdTime}) {
    return Todo(
      text ?? this.text,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
      completedTime: completedTime ?? this.completedTime,
      createdTime: createdTime ?? this.createdTime,
    );
  }
}
