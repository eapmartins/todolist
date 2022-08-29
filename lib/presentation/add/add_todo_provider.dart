import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/usecase/add_todo.dart';
import '../todo_list_notifier.dart';

final addTodoListProvider = Provider((ref) => AddTodo(
      ref.watch(todosRepositoryProvider),
    ));
