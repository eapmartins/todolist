import 'package:get/get.dart';
import 'package:todolist/datasource/repositories/in_memory_todo_repository.dart';
import 'package:todolist/model/usecase/add_todo.dart';
import 'package:todolist/model/usecase/get_todo.dart';
import 'package:todolist/presentation/add/presenter.dart';
import 'package:todolist/presentation/list/presenter.dart';

class TodolistModule {
  static Future<void> init() async {
    var todoRepository = InMemoryTodoRepository();

    final listTodos = GetTodos(todoRepository);
    final addTodos = AddTodo(todoRepository);

    Get.create(() => AddPresenter(addTodos));
    Get.create(() => ListPresenter(listTodos));
  }
}
