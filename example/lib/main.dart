import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Keyboard Dismisser',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: ExamplePage(),
    );
  }
}

class ExamplePage extends StatelessWidget {
  ExamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        child: Scaffold(
          appBar: AppBar(
            title: Text('KeyboardDismisser example'),
          ),
          body: Padding(
            padding: const EdgeInsets.all(48),
            child: Column(
              children: <Widget>[
                TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Tap to show the keyboard',
                    hintText: 'Gesture elsewhere to dismiss',
                  ),
                ),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      );
}
