class Todo {
  final String text;
  final bool isCompleted;
  final DateTime? completedTime;
  final DateTime createdTime;

  Todo(this.text,
      {this.isCompleted = false, this.completedTime, DateTime? createdTime})
      : this.createdTime = createdTime ?? DateTime.now();

  Todo copyWith(
      {String? text,
      bool? isCompleted,
      DateTime? completedTime,
      DateTime? createdTime}) {
    return Todo(
      text ?? this.text,
      isCompleted: isCompleted ?? this.isCompleted,
      completedTime: completedTime ?? this.completedTime,
      createdTime: createdTime ?? this.createdTime,
    );
  }
}
