
import 'package:flutter/material.dart';

Widget textFieldAutoComplete({
  bool isValid,
  String placeHolder,
  TextEditingController textFieldController,
  List<String> suggestions,
  Function(String value) onTextChange,
  Function(String value) onSubmit,
}) {
  return Container(
    padding: EdgeInsets.all(15),
    child: Column(
      children: [
        TextField(
          controller: textFieldController,
          cursorColor: Colors.black,
          autocorrect: true,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.only(left: 10, right: 10),
            border: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blue,
                width: 2.0,
              ),
            ),
            suffixIcon: isValid ? Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 18,
            ) : null,
            labelText: placeHolder,
            labelStyle: TextStyle(color: Colors.grey),
          ),
          onChanged: (value) => onTextChange(textFieldController.text),
        ),
        Column(
          children: suggestions.map((string) {
            return GestureDetector(
              onTap: () {
                onSubmit(string);
              },
              child: ListTile(
                title: RichText(
                  text: TextSpan(
                    text: string.substring(0,
                      textFieldController.text.length),
                    style: TextStyle(color: Colors.grey, fontSize: 18),
                    children: <TextSpan>[
                      TextSpan(
                        text: string.substring(
                          textFieldController.text.length),
                        style: TextStyle(color: Colors.black, fontSize: 18),
                      ),
                    ]),
                )),
            );
          }).toList(),
        ),
      ],
    ),
  );
}