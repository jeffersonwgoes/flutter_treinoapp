import 'package:flutter/material.dart';
import 'package:treino_app/database/database_workout.dart';
import 'package:treino_app/models/workout.dart';
import 'package:treino_app/screens/form_workout.dart';
import 'package:treino_app/screens/list_exercises.dart';

class ListWorkouts extends StatefulWidget {
  @override
  _ListWorkoutsState createState() => _ListWorkoutsState();
}

class _ListWorkoutsState extends State<ListWorkouts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Workouts'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => FormAddWorkout()));
        },
      ),
      body: FutureBuilder(
        future: listWorkouts(),
        builder: (context, snapshot) {
          if (snapshot.data != null) {
            final List<Workout> workouts = snapshot.data;
            return ListView.builder(
              itemCount: workouts.length,
              itemBuilder: (context, index) =>
                  ItemListWorkouts(workouts[index]),
            );
          } else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  CircularProgressIndicator(),
                  Text(
                    'Loading',
                    style: TextStyle(fontSize: 32.0),
                  )
                ],
              ),
            );
          }
        },
      ),
    );
  }
}

class ItemListWorkouts extends StatelessWidget {
  final Workout workout;

  ItemListWorkouts(this.workout);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () =>
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ListExercises(workout);
        })),
        title: Text(
          this.workout.name,
          style: TextStyle(fontSize: 24.0),
        ),
      ),
    );
  }
}
