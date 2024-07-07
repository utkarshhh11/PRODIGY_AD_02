import 'package:flutter/material.dart';
import 'package:todolist_prodigy/util/dialog_box.dart';
import 'package:todolist_prodigy/util/todolist.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final _controller = TextEditingController();

  List Listtodo = [
    ["Go to gym", false],
    ["have fun", false],
  ];

  void checkBoxChange(bool? value, int index) {
    setState(() {
      Listtodo[index][1] = !Listtodo[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      Listtodo.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }
  void deleteFunction( int index){
    setState(() {
      Listtodo.removeAt(index);
    });

  }

  void newtask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancel: () => Navigator.of(context).pop(),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlue,
          title: Center(
              child: Text(
            "TO Do LIST",
            style: TextStyle(color: Colors.white, fontSize: 20),
          )),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlue,
          onPressed: newtask,
          child: Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: ListView.builder(
            itemCount: Listtodo.length,
            itemBuilder: (context, index) {
              return Todolist(
                deleteTask :(context)=> deleteFunction(index),
                  taskName: Listtodo[index][0],
                  taskCompleted: Listtodo[index][1],
                  onChanged: (value) => checkBoxChange(value, index));
            }));
  }
}
