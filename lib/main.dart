import 'package:flutter/material.dart';
import 'package:flutter_treinoapp/screens/exercise/form.dart';
import 'package:flutter_treinoapp/screens/exercise/list.dart';
import 'package:flutter_treinoapp/screens/workout/list.dart';

void main() => runApp(EasyWorkout());


class EasyWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListExercises(),
    );
  }
}