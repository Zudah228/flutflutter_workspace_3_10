import 'package:flutter/material.dart';
import 'package:flutter_workspace_3_10/pages/todo_details_page.dart';
import 'package:uuid/uuid.dart';

import '../entities/todo.dart';
import '../utils/image_url.dart';

class TodoListPage extends StatefulWidget {
  const TodoListPage({super.key});

  static const routeName = '/todo_list';

  static Route<void> route() {
    return MaterialPageRoute(
      settings: const RouteSettings(name: routeName),
      builder: (_) => const TodoListPage(),
    );
  }

  @override
  State<TodoListPage> createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  final _todoList = <Todo>[];
  final _titleController = TextEditingController();

  void _add({required String title}) {
    setState(() {
      _todoList.add(
        Todo(
          id: const Uuid().v4(),
          title: title,
          isCompleted: false,
          imageUrl: ImageUrl.random(),
        ),
      );
    });

    _titleController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Todo'),
        ),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              toolbarHeight: 64,
              title: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _titleController,
                    ),
                  ),
                  const SizedBox(width: 16),
                  ElevatedButton(
                    onPressed: () {
                      _add(title: _titleController.text);
                    },
                    child: const Icon(Icons.add),
                  )
                ],
              ),
            ),
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16).copyWith(
                top: 24,
              ),
              sliver: SliverList.separated(
                itemCount: _todoList.length,
                itemBuilder: (context, index) {
                  final todo = _todoList[index];

                  return ListTile(
                    title: Text(todo.title),
                    leading: Hero(
                      tag: todo.id,
                      child: Image.network(todo.imageUrl),
                    ),
                    onTap: () {
                      Navigator.of(context).push(
                        TodoDetailsPage.route(
                          TodoDetailsPageArgs(todo: todo),
                        ),
                      );
                    },
                  );
                },
                separatorBuilder: (_, __) {
                  return const SizedBox(height: 16);
                },
              ),
            )
          ],
        ));
  }
}
