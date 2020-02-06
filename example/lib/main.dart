import 'package:flutter/material.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

void main() => runApp(ExampleApp());

class ExampleApp extends StatelessWidget {
  const ExampleApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Keyboard Dismisser',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: ExamplePage(),
      );
}

class ExamplePage extends StatelessWidget {
  const ExamplePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) => KeyboardDismisser(
        gestures: [
          GestureType.onTap,
          GestureType.onPanUpdateDownDirection,
        ],
        child: Scaffold(
          appBar: AppBar(
            title: Text('KeyboardDismisser example'),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24,
              vertical: 48,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tap to show the keyboard',
                hintText: 'Tap elsewhere or swipe down to dismiss',
              ),
            ),
          ),
        ),
      );
}
