import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todolist/model/domain/todo.dart';
import 'package:todolist/model/usecase/add_todo.dart';

class AddPresenter {
  final AddTodo usecase;

  final formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  AddPresenter(this.usecase);


  bool addTodo(void Function(Todo) callback) {

    if (formKey.currentState?.validate() == true) {
      final title = titleController.text;
      final description = descriptionController.text;

      final aTodo = Todo(title: title, description: description);

      usecase.execute(aTodo);

      titleController.clear();
      descriptionController.clear();

      formKey.currentState?.save();

      callback(aTodo);

      return true;
    }

    return false;
  }
}