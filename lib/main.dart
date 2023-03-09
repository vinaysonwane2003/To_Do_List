import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'mainPage.dart';

void main() async{
  await Hive.initFlutter();
  var box = await Hive.openBox("MyBox");
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainScreen(),
    );
  }
}