import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../todo_list_notifier.dart';

class TodoFormPage extends ConsumerWidget {
  const TodoFormPage({Key? key}) : super(key: key);

  @override
  Widget build(final BuildContext context, WidgetRef ref) {
    final todoProvider = ref.watch(todosProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todolist"),
      ),
      body: _buildBodyWidget(context, todoProvider),
    );
  }

  Widget _buildBodyWidget(BuildContext context, TodoListNotifier todoProvider) {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFormWidget(),
          _buildSaveButtonWidget(context, todoProvider),
        ],
      ),
    );
  }

  Widget _buildSaveButtonWidget(
      BuildContext context, TodoListNotifier todoProvider) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          todoProvider.addTodo('Title example', 'Description example');
          Navigator.pop(context);
        },
        child: const Text('Save'),
      ),
    );
  }

  Widget _buildFormWidget() {
    return Form(
      child: Column(
        children: [
          _buildTitleFormWidget(),
          const SizedBox(height: 16),
          _buildDescriptionFormWidget(),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildTitleFormWidget() {
    return TextFormField(
      initialValue: "",
      maxLength: 20,
      decoration: const InputDecoration(
        icon: Icon(Icons.edit),
        labelText: 'Title',
        helperText: 'Required',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDescriptionFormWidget() {
    return TextFormField(
      initialValue: "",
      maxLength: 150,
      decoration: const InputDecoration(
        icon: Icon(Icons.view_headline),
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
    );
  }
}
