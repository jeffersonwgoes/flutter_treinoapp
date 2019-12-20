import 'package:flutter/material.dart';

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String hint;
  final String label;
  final IconData icon;

  Editor({this.controller, this.hint, this.label, this.icon});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16.0), 
          child:TextField(
            controller: controller,
            style: TextStyle(
            fontSize: 24.0
          ),
          decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: hint
        ),
        keyboardType: TextInputType.number,
      ),
    );
  }
}