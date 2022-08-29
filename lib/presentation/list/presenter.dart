import 'package:todolist/model/domain/todo.dart';
import 'package:todolist/model/usecase/get_todo.dart';

class ListPresenter {
  final GetTodos usecase;

  ListPresenter(this.usecase);

  List<Todo> get todos => usecase.execute();
}