import 'package:get/get.dart';
import 'package:todolist/datasource/repositories/in_memory_todo_repository.dart';
import 'package:todolist/model/usecase/get_todo.dart';

class TodolistModule {
  static Future<void> init() async {
    var todoRepository = InMemoryTodoRepository();
    var listTodos = GetTodos(todoRepository);
    Get.put<GetTodos>(listTodos);
  }
}
