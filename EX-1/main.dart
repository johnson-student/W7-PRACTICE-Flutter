import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      appBar: AppBar(title: const Text("Custom buttons")),
      body: Column(spacing: 10 , children: [
        Button(),
        Button(),
        Button(),
        Button(),
      ],),
    ),
  ),
);

class Button extends StatefulWidget {
  const Button({super.key});

  @override
  State<Button> createState() => _ButtonState();
}

class _ButtonState extends State<Button> {
  bool _isSelected = false;

  String get buttonText => _isSelected ? "Selected" : "Not Selected";
  Color get textColor => _isSelected ? Colors.white : Colors.black;
  Color? get backgroundColor =>
      _isSelected ? Colors.blue[500] : Colors.blue[50];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      height: 100,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            _isSelected = !_isSelected;
          });
        },
        style: ElevatedButton.styleFrom(backgroundColor: backgroundColor),
        child: Center(
          child: Text(buttonText, style: TextStyle(color: textColor)),
        ),
      ),
    );
  }
}
