import 'package:flutter/material.dart';
import 'package:hacktober_fest_app/providers/todo.dart';
import 'package:hacktober_fest_app/screens/add_todo_screen.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class TodoScreen extends StatefulWidget {
  static const routeName = '/todo-screen';

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Todo\'s"),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddTodoScreen()),
          );
          //TODO:Add new todo feature to be added
        },
      ),
      body: SafeArea(
        child: ValueListenableBuilder(
          valueListenable: Hive.box<Todo>('todos').listenable(),
          builder: (context, Box<Todo> box, _) {
            return ListView.builder(
              itemCount: box.length,
              itemBuilder: (ctx, i) {
                final todo = box.getAt(i);
                return Card(
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: Checkbox(
                        value: todo!.completed,
                        onChanged: (bool? value) {
                          setState(() {
                            todo!.completed = value!;
                          });
                        },
                        activeColor: Colors.black,
                      ),
                      onTap: () {},
                      title: Padding(
                        padding: const EdgeInsets.only(left: 80.0),
                        child: Text(todo!.text.toString()),
                      ),
                      contentPadding: const EdgeInsets.only(left: 10),
                      trailing: IconButton(
                        onPressed: () {
                          box.deleteAt(i);
                        },
                        icon: const Icon(Icons.delete),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
