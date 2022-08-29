class Todo {
  final String title;
  final String description;

  Todo({
    required this.title,
    required this.description,
  });


  @override
  toString() => 'Todo(title: $title, description: $description)';
}
