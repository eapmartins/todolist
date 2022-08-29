import 'package:todolist/model/repositories/todo_repository.dart';

import '../domain/todo.dart';

class AddTodo {
  final TodoRepository repository;
  AddTodo(this.repository);

  void execute(Todo aTodo) {
    repository.save(aTodo);
  }
}
