import 'package:flutter/material.dart';
import 'package:flutter_custom_autocomplete/auto_complete_text_field.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Autocomplete',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: AutoCompleteTextField(),
    );
  }
}
