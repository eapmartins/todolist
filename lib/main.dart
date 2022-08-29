import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get/get.dart';
import 'package:todolist/presentation/list/get_todos_page.dart';
import 'package:todolist/todo_list_module.dart';

import 'presentation/add/add_todo_page.dart';

void main() async {
  await Future.wait([
    TodolistModule.init(),
  ]);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Todolist Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      getPages: [
        GetPage(name: '/', page: () => TodoListPage(presenter: Get.find())),
        GetPage(name: '/add', page: () => TodoFormPage(presenter: Get.find())),
      ],
    );
  }
}
