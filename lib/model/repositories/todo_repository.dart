import 'package:todolist/model/domain/todo.dart';

abstract class TodoRepository {
  void save(Todo aTodo);
  List<Todo> findAll();
}
