// ignore_for_file: deprecated_member_use

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosapp/db_data/db_table.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => MyDatabase(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> title = [
    'afforest',
    'aftermath',
    'becalm',
    'blithesome',
    'caprice'
  ];
  List<String> description = [
    'establish a forest on previously unforested land',
    'the consequences of an event, especially a catastrophic one',
    'make still, steady, or tranquil',
    'carefree and happy and lighthearted',
    'a sudden desire',
  ];

  void _incrementTodo() {
    final db = Provider.of<MyDatabase>(context, listen: false);

    String element = title[Random().nextInt(title.length)];
    int index = title.indexOf(element);

    final todo = Todo(
        title: element,
        description: description[index],
        creationTime: DateTime.now(),
        status: 0);
    db.insertTodo(todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Drift'),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Expanded(child: _buildTodoList(context))],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementTodo,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  StreamBuilder<List<Todo>> _buildTodoList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    return StreamBuilder(
      stream: database.watchAllTodos(),
      builder: (context, AsyncSnapshot<List<Todo>> snapshot) {
        final todos = snapshot.data ?? [];

        return ListView.builder(
          itemCount: todos.length,
          itemBuilder: (_, index) {
            final itemtodo = todos[index];
            return _buildListItem(itemtodo, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Todo itemTodo, MyDatabase database) {
    String element = title[Random().nextInt(title.length)];
    int index = title.indexOf(element);
    final database = Provider.of<MyDatabase>(context, listen: false);
    Color colour;
    if (itemTodo.status == 1) {
      colour = Colors.green;
    } else if (itemTodo.status == 2)
      colour = Colors.red;
    else
      colour = Colors.transparent;

    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
          color: colour,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text(itemTodo.id.toString()),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 200,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              database.updateTodo(itemTodo.copyWith(
                                  title: element,
                                  description: description[index]));
                            },
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  itemTodo.title,
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ))),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(itemTodo.description)),
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            itemTodo.creationTime.toString(),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: [
                    itemTodo.status == 0
                        ? Row(
                            children: [
                              IconButton(
                                  onPressed: () {
                                    database.updateTodo(
                                        itemTodo.copyWith(status: 1));
                                  },
                                  icon: Icon(Icons.done)),
                              IconButton(
                                  onPressed: () {
                                    database.updateTodo(
                                        itemTodo.copyWith(status: 2));
                                  },
                                  icon: Icon(Icons.dangerous))
                            ],
                          )
                        : Text(''),
                    IconButton(
                      onPressed: () {
                        database.deleteTodo(itemTodo);
                      },
                      icon: Icon(Icons.delete),
                    )
                  ],
                )
              ],
            ),
          )
//
          ),
    );
  }
}
