import 'dart:developer';

import 'package:todolist/model/repositories/todo_repository.dart';

import '../domain/todo.dart';

class GetTodos {
  final TodoRepository _repository;
  GetTodos(this._repository);

  List<Todo> execute() {
    return _repository.findAll();
  }
}
