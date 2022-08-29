import 'dart:async';

import 'package:todolist/model/domain/todo.dart';
import 'package:todolist/model/repositories/todo_repository.dart';

class InMemoryTodoRepository implements TodoRepository {
  final List<Todo> _todos = [Todo(title: "First", description: "description")];


  @override
  void save(Todo aTodo) {
    _todos.add(aTodo);
  }

  @override
  List<Todo> findAll() => _todos;
}
