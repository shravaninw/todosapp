import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todosapp/db_data/db_table.dart';

class StepPage extends StatelessWidget {
  const StepPage({Key? key, required this.fkey}) : super(key: key);

  final int fkey;

  @override
  Widget build(BuildContext context) {
    List<String> description = [
      'Step 1: Visit Google account creation page, accounts.google.com',
      'Step 2: Click on Create account.',
      'Step 3: The sign-up form will appear. Enter your first and last name.',
      'Step 4: Choose a Username for your account. (Here you can also use an existing email address)',
      'Step 5: After choosing a username, enter a password. Type the password again to confirm. (As per Googles instruction always use 8 or more characters with a mix of letters, numbers & symbols)',
    ];
    void _incrementStep() {
      final db = Provider.of<MyDatabase>(context, listen: false);

      String element = description[Random().nextInt(description.length)];

      final step = Content(
          description: element, tagId: fkey, creationTime: DateTime.now());
      db.insertContent(step);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Steps'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementStep,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      body: _buildContentList(context),
    );
  }

  StreamBuilder<List<Content>> _buildContentList(BuildContext context) {
    final database = Provider.of<MyDatabase>(context, listen: false);
    return StreamBuilder(
      stream: database.watchAllContent(fkey),
      builder: (context, AsyncSnapshot<List<Content>> snapshot) {
        final Contents = snapshot.data ?? [];

        return ListView.builder(
          itemCount: Contents.length,
          itemBuilder: (_, index) {
            final itemContent = Contents[index];
            return _buildListItem(itemContent, database);
          },
        );
      },
    );
  }

  Widget _buildListItem(Content itemContent, MyDatabase database) {
    return ListTile(
      title: Text(itemContent.description),
      subtitle: Text(itemContent.creationTime.toString()),
      isThreeLine: true,
      trailing: IconButton(
        icon: Icon(Icons.delete),
        onPressed: () {
          database.deleteContent(itemContent);
        },
      ),
    );
  }
}
