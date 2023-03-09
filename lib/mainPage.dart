import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:to_do_list/Database/taskData.dart';
import 'addTask.dart';
import 'listcon.dart';
import 'addTask.dart';

class MainScreen extends StatefulWidget {
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final _MyBox  = Hive.box("MyBox");
  final _controller = TextEditingController();
  Database db = Database();
  void checkBoxChanged(bool? value, int index){
    setState(() {
      db.todo[index][1] = !db.todo[index][1];
    });
    db.updateData();
  }
  void saveTask ()
  {
    setState(() {
      db.todo.add([_controller.text, false]);
      Navigator.of(context).pop();
    });
    db.updateData();
  }
  void createNew(){
    showDialog(
        context: context,
        builder: (context)
        {
          return AddTask(
            controller: _controller,
            onSave: saveTask,
            onCancel: ()=> Navigator.of(context).pop(),
          );
        }
    );
  }
  void deleteTask(int index){
    setState(() {
      db.todo.removeAt(index);
    });
    db.updateData();
  }
  @override
  void initState(){
    if(_MyBox.get("TodoList")==null)
      {
        db.createDB();
      }
    else{
      db.loadData();
    }
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple.shade800,
      appBar: AppBar(
        title: Text("To Do List"),
        backgroundColor: Colors.indigoAccent.shade100,
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: db.todo.length,
        itemBuilder: (context, index){
          return ToDoList(
            taskName: db.todo[index][0],
            taskCompleted: db.todo[index][1],
            onChanged: (value)=> checkBoxChanged(value, index),
            deleteFunction: (context)=> deleteTask(index),
          );
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNew,
        backgroundColor: Colors.indigoAccent.shade100,
        child: Icon(Icons.add),
      ),
    );
  }
}
