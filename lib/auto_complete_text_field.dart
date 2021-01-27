import 'package:flutter/material.dart';
import 'package:flutter_custom_autocomplete/home_page.dart';
import 'package:flutter_custom_autocomplete/widgets.dart';

class AutoCompleteTextField extends StatefulWidget {
  @override
  AutoCompleteTextFieldState createState() => AutoCompleteTextFieldState();
}

class AutoCompleteTextFieldState extends State<AutoCompleteTextField> {
  TextEditingController _textFieldColorController = TextEditingController();
  TextEditingController _textFieldLanguageController = TextEditingController();
  List<String> _listOfColors = [
    "Blue",
    "Red",
    "Black",
    "BlueLight",
    "DarkBlue",
    "RedAccent",
    "Pink",
    "BlackPink",
    "BlackShit",
    "BlackMoney",
    "BlueOcean",
    "BlueBerry",
  ];

  List<String> _listOfLanguages = [
    "Flutter",
    "Flutcán",
    "React",
    "ReactNative",
    "Reaction",
    "Node.js",
    "Android",
    "Angular",
    "Kotlin"
  ];

  List<String> _suggestedColor = [];
  List<String> _suggestedLanguage = [];
  bool _isValidColor = false;
  bool _isValidLanguage = false;

  _onTextFieldColorChange(String value) {
    setState(() {
      _suggestedColor = _listOfColors
          .where(
              (string) => string.toLowerCase().startsWith(value.toLowerCase()))
          .take(5)
          .toList();

      _isValidColor = _listOfColors
              .where((string) => string.toLowerCase() == value.toLowerCase())
              .length ==
          1;
    });
  }

  _onTextFieldColorSubmit(String value) {
    _textFieldColorController.text = value;
    setState(() {
      _isValidColor = _listOfColors
              .where((string) => string.toLowerCase() == value.toLowerCase())
              .length ==
          1;
      _suggestedColor = [];
    });
  }

  _onTextFieldLanguageChange(String value) {
    setState(() {
      _suggestedLanguage = _listOfLanguages
          .where(
              (string) => string.toLowerCase().startsWith(value.toLowerCase()))
          .take(5)
          .toList();

      _isValidLanguage = _listOfLanguages
              .where((string) => string.toLowerCase() == value.toLowerCase())
              .length ==
          1;
    });
  }

  _onTextFieldLanguageSubmit(String value) {
    _textFieldLanguageController.text = value;
    setState(() {
      _isValidLanguage = _listOfLanguages
              .where((string) => string.toLowerCase() == value.toLowerCase())
              .length ==
          1;
      _suggestedLanguage = [];
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AutoComplete Textfield Example'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            textFieldAutoComplete(
              placeHolder: "Enter Color",
              textFieldController: _textFieldColorController,
              suggestions: _suggestedColor,
              onTextChange: _onTextFieldColorChange,
              onSubmit: _onTextFieldColorSubmit,
              isValid: _isValidColor,
            ),
            textFieldAutoComplete(
              placeHolder: "Enter Language",
              textFieldController: _textFieldLanguageController,
              suggestions: _suggestedLanguage,
              onTextChange: _onTextFieldLanguageChange,
              onSubmit: _onTextFieldLanguageSubmit,
              isValid: _isValidLanguage,
            ),
            RaisedButton(
              child: Text(
                "Home Page",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              onPressed: (_isValidColor && _isValidLanguage)
                  ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HomePage(
                                  title: "Home Page",
                                )),
                      );
                    }
                  : null,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}
