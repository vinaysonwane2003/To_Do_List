import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Database
{
  List todo = [];
  final _myBox = Hive.box("MyBox");
  void createDB()
  {
    todo = [["Example of Task",false],];
  }
  void loadData()
  {
    todo = _myBox.get("TodoList");
  }
  void updateData()
  {
    _myBox.put("TodoList", todo);
  }
}