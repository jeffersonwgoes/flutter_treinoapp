import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:treino_app/models/exercise.dart';

Future<Database> createDatabaseExercise() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'dbExercise.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE exercises( '
          'id INTEGER PRIMARY KEY, id_workout INTEGER, '
          'name TEXT, time INTEGER, weight INTEGER, repetitions INTEGER) ');
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  });
}

Future<void> insertExercises(Exercise exercise) {
  return createDatabaseExercise().then((db) {
    final Map<String, dynamic> exerciseMap = Map();
    exerciseMap['name'] = exercise.name;
    exerciseMap['id_workout'] = exercise.idWorkout;
    exerciseMap['time'] = exercise.time;
    exerciseMap['weight'] = exercise.weight;
    exerciseMap['repetitions'] = exercise.repetitions;
    db.insert('exercises', exerciseMap);
  });
}

Future<List<Exercise>> listExercises(int workout) {
  return createDatabaseExercise().then((db) {
    return db.query('exercises',
        where: "id_workout = ?", whereArgs: [workout]).then((maps) {
      final List<Exercise> exercises = List();
      for (Map<String, dynamic> map in maps) {
        exercises.add(Exercise(map['name'], map['id_workout'],
            id: map['id'],
            weight: map['weight'],
            time: map['time'],
            repetitions: map['repetitions']));
      }
      return exercises;
    });
  });
}

Future<List<Exercise>> listExercisesAll() {
  return createDatabaseExercise().then((db) {
    return db
        .query(
      'exercises',
    )
        .then((maps) {
      final List<Exercise> exercises = List();
      for (Map<String, dynamic> map in maps) {
        exercises.add(Exercise(map['name'], map['id_workout'],
            id: map['id'],
            weight: map['weight'],
            time: map['time'],
            repetitions: map['repetitions']));
      }
      return exercises;
    });
  });
}
