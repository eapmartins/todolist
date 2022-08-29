import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/datasource/repositories/in_memory_todo_repository.dart';
import 'package:todolist/model/repositories/todo_repository.dart';

import '../model/domain/todo.dart';
import '../model/usecase/add_todo.dart';
import '../model/usecase/get_todo.dart';
import 'add/add_todo_provider.dart';
import 'list/get_todos_provider.dart';

class TodoListNotifier extends StateNotifier<List<Todo>> {
  final GetTodos _getTodos;
  final AddTodo _addTodo;

  TodoListNotifier(this._getTodos, this._addTodo) : super([]) {
    getTodos();
  }

  Future<void> getTodos() async {
    _getTodos.execute();
  }

  addTodo(final String title, final String description) async {
    var todo = Todo(title: title, description: description);
    _addTodo.execute(todo);
    state = [...state, todo];
  }
}

final todosProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier(
    ref.watch(getTodoListProvider),
    ref.watch(addTodoListProvider),
  );
});

final todosRepositoryProvider =
    Provider<TodoRepository>((ref) => InMemoryTodoRepository());
