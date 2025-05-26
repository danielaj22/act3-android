import 'package:flutter/material.dart';
import 'form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: '3.2 Flutter Push Pop',
      themeMode: ThemeMode.system,
      home: MyForm(),
    );
  }
}
