import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:treino_app/models/workout.dart';

Future<Database> createDatabaseWorkout() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'databaseapp.db');
    return openDatabase(path, onCreate: (db, version) {
      db.execute('CREATE TABLE workouts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT)');
    }, version: 1, onDowngrade: onDatabaseDowngradeDelete);
  });
}

Future<void> insertWorkout(Workout workout) {
  return createDatabaseWorkout().then((db) {
    final Map<String, dynamic> workoutMap = Map();
    // workoutMap['id'] = workout.id;
    workoutMap['name'] = workout.name;
    db.insert('workouts', workoutMap);
  });
}

Future<List<Workout>> listWorkouts() {
  return createDatabaseWorkout().then((db) {
    return db.query('workouts').then((maps) {
      final List<Workout> workouts = List();
      for (Map<String, dynamic> map in maps) {
        workouts.add(Workout(map['name'], id: map['id']));
      }
      return workouts;
    });
  });
}
