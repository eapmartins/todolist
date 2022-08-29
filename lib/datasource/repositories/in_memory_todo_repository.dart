import 'package:todolist/model/domain/todo.dart';
import 'package:todolist/model/repositories/todo_repository.dart';

class InMemoryTodoRepository implements TodoRepository {
  final List<Todo> _todos = [];

  @override
  List<Todo> findAll() {
    return _todos;
  }

  @override
  void save(Todo aTodo) {
    _todos.add(aTodo);
  }
}
