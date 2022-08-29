import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:todolist/model/domain/todo.dart';

final todosProvider = StateProvider<List<Todo>>((ref) => []);