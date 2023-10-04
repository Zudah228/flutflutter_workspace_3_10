import 'package:flutter/material.dart';
import 'package:flutter_workspace_3_10/entities/todo.dart';

class TodoListTile extends StatelessWidget {
  const TodoListTile(this.todo, {super.key, this.onDeleteTap});

  final Todo todo;
  final VoidCallback? onDeleteTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Material(
      color: theme.listTileTheme.tileColor,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(child: Text(todo.title)),
            IconButton(
              icon: const Icon(Icons.delete),
              color: colorScheme.error,
              onPressed: onDeleteTap,
            ),
          ],
        ),
      ),
    );
  }
}
