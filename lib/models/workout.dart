import 'package:flutter/widgets.dart';
import 'package:flutter_treinoapp/models/exercise.dart';

class Workout {
  final String name;
  final String daysOfWeek;
  List<Exercise> _exercises = List();

  Workout(this.name, this.daysOfWeek);

  addExercise(Exercise ex) {
    this._exercises.add(ex);
    debugPrint('$ex');
  }

  Exercise getExercise(int index) {
    return this._exercises.elementAt(index);
  }

  List<Exercise> get exercises {
    return _exercises;
  }

}