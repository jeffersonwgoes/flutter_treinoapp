import 'package:flutter/material.dart';
import 'package:treino_app/database/database_exercise.dart';
import 'package:treino_app/models/exercise.dart';
import 'package:treino_app/models/workout.dart';
import 'package:treino_app/screens/form_exercise.dart';

class ListExercises extends StatefulWidget {
  final Workout _workout;

  ListExercises(this._workout);

  @override
  _ListExercisesState createState() => _ListExercisesState();
}

class _ListExercisesState extends State<ListExercises> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Exercises'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(
                  builder: (context) => FormAddExercise(widget._workout.id)))
              .then((value) {
            setState(() {
              debugPrint("ALO");
            });
          });
        },
      ),
      body: FutureBuilder(
          future: listExercises(widget._workout.id),
          builder: (context, snapshot) {
            if (snapshot.data != null) {
              final List<Exercise> exercises = snapshot.data;
              return ListView.builder(
                itemCount: exercises.length,
                itemBuilder: (context, index) =>
                    ItemListExercise(exercises[index]),
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
          }),
    );
  }
}

class ItemListExercise extends StatelessWidget {
  final Exercise exercise;

  ItemListExercise(this.exercise);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => {},
        title: Text(this.exercise.name),
        subtitle: Text(this.exercise.toString()),
      ),
    );
  }
}
