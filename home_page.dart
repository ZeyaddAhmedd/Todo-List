import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todos = [];
  String input = '';
  @override
  void initState() {
    super.initState();
    todos.add('Finsih the todo list Application');
    todos.add('Study ML');
    todos.add('Go to Club');
    todos.add('Eat');
    todos.add('Sleep');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyToDoList'),
      ),
      floatingActionButton: FloatingActionButton(
        //add a plus icon to the button
        child: const Icon(Icons.add),
        onPressed: () {
          showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title: const Text('Add New Todo'),
                  content: TextField(
                    onChanged: (String value) {
                      input = value;
                    },
                  ),
                  actions: <Widget>[
                    //add a button when pressed it will add the todo
                    TextButton(
                        onPressed: () {
                          setState(() {
                            todos.add(input);
                          });
                          Navigator.of(context).pop();
                        },
                        child: const Text('Add'))
                  ],
                );
              });
        },
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
              key: Key(todos[index]),
              child: Card(
                //Now we want the shape of a card so we selected Card
                elevation: 5, //for the shadow around the card
                margin: const EdgeInsets.all(8),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: ListTile(
                    title: Text(todos[index]),
                    trailing: IconButton(
                        onPressed: () {
                          setState(() {
                            todos.removeAt(index);
                          });
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ))),
              ));
        },
      ),
    );
  }
}
