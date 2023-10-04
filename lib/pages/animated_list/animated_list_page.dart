import 'package:flutter/material.dart';
import 'package:flutter_workspace_3_10/entities/todo.dart';
import 'package:flutter_workspace_3_10/widgets/todo_list_tile.dart';
import 'package:flutter_workspace_3_10/widgets/unfocus_gesture_detector.dart';

import 'animated_list_sample_page.dart';

class AnimatedListPage extends StatefulWidget {
  const AnimatedListPage._();

  static const routeName = '/animated_list';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const AnimatedListPage._(),
    );
  }

  @override
  State<AnimatedListPage> createState() => _AnimatedListPageState();
}

class _AnimatedListPageState extends State<AnimatedListPage> {
  final _animatedListKey = GlobalKey<AnimatedListState>();
  final _todoList = <Todo>[];
  final _textController = TextEditingController(text: 'Todo Item');

  void _add() {
    if (_textController.text.isEmpty) return;

    _todoList.add(
      Todo.fromUuid(title: _textController.text),
    );
    _animatedListKey.currentState!.insertItem(_todoList.length - 1);
  }

  void _removeAt(int index) {
    if (_textController.text.isEmpty) return;

    final removed = _todoList.removeAt(index);
    _animatedListKey.currentState!
        .removeItem(index, _getRemovedItemBuilder(removed));
  }

  void _removeAll() {
    _animatedListKey.currentState!.removeAllItems(_getRemovedItemBuilder());
    _todoList.clear();
  }

  Widget Function(BuildContext context, Animation<double> animation)
      _getRemovedItemBuilder([Todo? todo]) {
    return (BuildContext context, Animation<double> animation) {
      return SizeTransition(
        sizeFactor: animation,
        axisAlignment: 1.0,
        child: todo != null ? TodoListTile(todo) : null,
      );
    };
  }

  @override
  Widget build(BuildContext context) {
    return UnfocusGestureDetector(
      child: Scaffold(
        appBar: AppBar(
          title: PopupMenuButton(
              position: PopupMenuPosition.under,
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    child: const Text('Flutter サンプル'),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const AnimatedListSample(),
                        ),
                      );
                    },
                  ),
                ];
              },
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(width: 4),
                  Text('AnimatedListPage'),
                  SizedBox(width: 8),
                  Icon(
                    Icons.keyboard_arrow_down,
                    size: 32,
                  )
                ],
              )),
          actions: [
            IconButton(
              onPressed: _removeAll,
              icon: const Icon(Icons.remove_circle),
            ),
          ],
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(64),
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                suffix: IntrinsicWidth(
                  child: FilledButton(
                    onPressed: _add,
                    child: const Center(
                      child: Icon(Icons.add),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
        body: AnimatedList(
          padding: const EdgeInsets.symmetric(vertical: 16),
          key: _animatedListKey,
          initialItemCount: _todoList.length,
          itemBuilder: (context, index, animation) {
            final todo = _todoList[index];

            return SizeTransition(
              sizeFactor: animation,
              child: TodoListTile(
                todo,
                onDeleteTap: () {
                  _removeAt(index);
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
