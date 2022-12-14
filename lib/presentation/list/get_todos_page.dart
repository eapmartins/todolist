import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:todolist/model/domain/todo.dart';
import 'package:todolist/presentation/list/presenter.dart';
import 'package:todolist/presentation/todos.dart';


class TodoListPage extends StatelessWidget {
  final ListPresenter presenter;
  const TodoListPage({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App'),
      ),
      body: Column(
        children: [
          const Divider(height: 2, color: Colors.grey),
          _buildTodoListContainerWidget()
        ],
      ),
      floatingActionButton: _buildFloatingActionButton(context),
    );
  }

  Widget _buildTodoListContainerWidget() {
    return Expanded(child: _buildTodoListWidget());
  }

  Widget _buildTodoListWidget() {
    return Consumer(
      builder: (context, ref, snapshot) {
        final todos = ref.watch(todosProvider);
        return ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: todos.length,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (final BuildContext context, final int index) {
            return _buildTodoItemCardWidget(context, todos[index]);
          },
        );
      }
    );
  }
}

Widget _buildTodoItemCardWidget(BuildContext context, Todo todo) {
  return InkWell(
    child: Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    todo.title,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    todo.description.isEmpty
                        ? 'No Description'
                        : todo.description,
                    style: Theme.of(context).textTheme.bodyText2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
          ],
        ),
      ),
    ),
  );
}

Widget _buildFloatingActionButton(final BuildContext context) {
  return FloatingActionButton(
    onPressed: () => Get.toNamed("/add"),
    child: const Icon(Icons.add),
  );
}
