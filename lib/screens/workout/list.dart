import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_treinoapp/models/workout.dart';

final String _titleAppBarListExercise = "Workouts";

class ListWorkouts extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBarListExercise),),
      body: ListView(
        children: <Widget>[
          ItemListWorkouts(Workout("x", "y")),
          ItemListWorkouts(Workout("x", "y")),
          ItemListWorkouts(Workout("x", "y")),
          ItemListWorkouts(Workout("x", "y")),
        ],
      ),
    );
  }

}

class ItemListWorkouts extends StatelessWidget {
  final Workout _workout;

  ItemListWorkouts(this._workout);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        subtitle: Text(_workout.daysOfWeek),
        leading: Icon(IconData(58726, fontFamily: 'MaterialIcons')),
        title: Text(this._workout.name),
      ),
    );
  }

}