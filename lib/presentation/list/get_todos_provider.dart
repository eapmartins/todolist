import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/usecase/get_todo.dart';
import '../todo_list_notifier.dart';

final getTodoListProvider = Provider((ref) => GetTodos(
      ref.watch(todosRepositoryProvider),
    ));
