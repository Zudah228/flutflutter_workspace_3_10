import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_workspace_3_10/entities/todo.dart';

const Duration _kPageTransitionDuration = Duration(milliseconds: 400);

class TodoDetailsPageArgs extends Equatable {
  const TodoDetailsPageArgs({required this.todo});
  final Todo todo;

  @override
  List<Object?> get props => [todo];
}

class TodoDetailsPage extends StatefulWidget {
  const TodoDetailsPage._(this.args);
  final TodoDetailsPageArgs args;

  static const routeName = '/todo_details';

  static Route<void> route(TodoDetailsPageArgs args) {
    return PageRouteBuilder(
      settings: RouteSettings(name: routeName, arguments: args),
      transitionDuration: _kPageTransitionDuration,
      pageBuilder: (_, __, ___) => TodoDetailsPage._(args),
      transitionsBuilder: (context, animation, _, child) {
        return FadeTransition(opacity: animation, child: child);
      },
    );
  }

  @override
  State<TodoDetailsPage> createState() => _TodoDetailsPageState();
}

class _TodoDetailsPageState extends State<TodoDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.args.todo.title),
      ),
      body: Center(
          child: Column(
        children: [
          const SizedBox(height: 24),
          Hero(
            tag: widget.args.todo.id,
            child: Image.network(
              widget.args.todo.imageUrl,
              height: 240,
            ),
          )
        ],
      )),
    );
  }
}
