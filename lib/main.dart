import 'package:flutter/material.dart';
import 'package:treino_app/database/database_exercise.dart';
import 'package:treino_app/database/database_workout.dart';
import 'package:treino_app/screens/list_workouts.dart';

void main() {
  runApp(MyApp());
  createDatabaseWorkout();
  createDatabaseExercise();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListWorkouts(),
    );
  }
}
