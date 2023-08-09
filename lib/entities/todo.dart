// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class Todo with _$Todo {
  const factory Todo({
    required String id,
    required String title,
    required bool isCompleted,
    required String imageUrl,
  }) = _Todo;

  const Todo._();
  factory Todo.fromJson(Map<String, Object?> json) => _$TodoFromJson(json);

}
