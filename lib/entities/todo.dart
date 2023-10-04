// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:uuid/uuid.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    @Default(false) bool isCompleted,
    String? imageUrl,
  }) = _Todo;

  const Todo._();
  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);

  factory Todo.fromUuid({
    required String title,
    bool isCompleted = false,
    String? imageUrl,
  }) =>
      Todo(
        id: const Uuid().v4(),
        title: title,
      );
}
