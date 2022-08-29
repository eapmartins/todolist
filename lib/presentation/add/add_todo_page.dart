import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:todolist/presentation/add/presenter.dart';
import 'package:todolist/presentation/todos.dart';


class TodoFormPage extends StatelessWidget {
  final AddPresenter presenter;

  const TodoFormPage({Key? key, required this.presenter}) : super(key: key);

  @override
  Widget build(final BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("Todolist"),
      ),
      body: _buildBodyWidget(),
    );
  }

  Widget _buildBodyWidget() {
    return Container(
      padding: const EdgeInsets.only(left: 16, top: 24, right: 16, bottom: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildFormWidget(),
          _buildSaveButtonWidget(),
        ],
      ),
    );
  }

  Widget _buildSaveButtonWidget() {
    return SizedBox(
      width: double.infinity,
      child: Consumer(
        builder: (context, ref, child) => ElevatedButton(
          onPressed: () {
            final todos = ref.read(todosProvider);

            if ( presenter.addTodo((todo) => ref.read(todosProvider.notifier).state = [...todos, todo]) ) {
              Get.back();
            }
          },
          child: const Text('Save'),
        ),
      ),
    );
  }

  Widget _buildFormWidget() {
    return Form(
      key: presenter.formKey,
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
      controller: presenter.titleController,
      maxLength: 20,
      validator: (final String? value) {
        if (value?.isEmpty == true) {
          return 'Please enter a title';
        }
        return null;
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.edit),
        labelText: 'Title',
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildDescriptionFormWidget() {
    return TextFormField(
      controller: presenter.descriptionController,
      maxLength: 150,
      validator: (final String? value) {
        if (value?.isEmpty == true) {
          return 'Please enter a description';
        }
        return null;
      },
      decoration: const InputDecoration(
        icon: Icon(Icons.view_headline),
        labelText: 'Description',
        border: OutlineInputBorder(),
      ),
    );
  }
}
