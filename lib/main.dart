import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListWorkouts(),
    );
  }
}

class ListWorkouts extends StatefulWidget {
  @override
  List<Workout> workouts = List();
  _ListWorkoutsState createState() => _ListWorkoutsState();
}

class _ListWorkoutsState extends State<ListWorkouts> {
  @override
  Widget build(BuildContext context) {
    // workouts.add(Workout("Treino Sexta", "Seg-Terça-Quarta"));
    // workouts.add(Workout("Treino Segunda", "Seg-Quarta"));
    return Scaffold(
        appBar: AppBar(
          title: Text('Workouts'),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => FormAddWorkout()))
                .then((workout) {
              this.widget.workouts.add(workout);
            });
          },
        ),
        body: ListView.builder(
          itemCount: this.widget.workouts.length,
          itemBuilder: (context, index) =>
              ItemListWorkouts(this.widget.workouts[index]),
        ));
  }
}

class ItemListWorkouts extends StatelessWidget {
  final Workout workout;

  ItemListWorkouts(this.workout);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () => {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) {
            return ListExercises(workout);
          }))
        },
        title: Text(this.workout.name),
        subtitle: Text(this.workout.getDaysOfWeek()),
      ),
    );
  }
}

class Workout {
  final String name;
  final List<bool> daysOfWeek;
  List<Exercise> exercises = List();

  Workout(this.name, this.daysOfWeek);

  String getDaysOfWeek() {
    String _daysOfWeek = "";
    _daysOfWeek += this.daysOfWeek[0] == true ? 'Seg' : '';
    _daysOfWeek += (this.daysOfWeek[1] == true ? 'Ter' : '');
    _daysOfWeek += (this.daysOfWeek[2] == true ? 'Qua' : '');
    _daysOfWeek += (this.daysOfWeek[3] == true ? 'Qui' : '');
    _daysOfWeek += (this.daysOfWeek[4] == true ? 'Sex' : '');
    _daysOfWeek += (this.daysOfWeek[5] == true ? 'Sab' : '');
    _daysOfWeek += (this.daysOfWeek[6] == true ? 'Dom' : '');
    return _daysOfWeek;
  }

  void addExercise(exercise) {
    this.exercises.add(exercise);
  }
}

class FormAddWorkout extends StatefulWidget {
  @override
  _FormAddWorkoutState createState() => _FormAddWorkoutState();
}

class _FormAddWorkoutState extends State<FormAddWorkout> {
  TextEditingController _nameController = TextEditingController();
  List<bool> _chbDay = [true, false, false, false, false, false, false];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Workout"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Nome do treino',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Nome do treino',
              ),
            ),
          ),
          /*Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: <Widget>[
              CheckBoxDayOfWeek("Segunda-Feira", _chbDay[0], (_chbDay[0]) {
                setState(() {
                  _chbDay
                });
              }),
              CheckBoxDayOfWeek("Terça-Feira", _chbDay[1]),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CheckBoxDayOfWeek("Quarta-Feira", _chbDay[2]),
                CheckBoxDayOfWeek("Quinta-Feira", _chbDay[3]),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: <Widget>[
                CheckBoxDayOfWeek("Sexta-Feira", _chbDay[4]),
                CheckBoxDayOfWeek("Sábado", _chbDay[5]),
                CheckBoxDayOfWeek("Domingo", _chbDay[6]),
              ],
            ),
          ),*/
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text(
                "Add Workout",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                Navigator.pop(context, Workout(_nameController.text, _chbDay));
              },
            ),
          ),
        ],
      ),
    );
  }
}

class CheckBoxDayOfWeek extends StatefulWidget {
  final String dayOfWeek;
  bool valueControl;

  CheckBoxDayOfWeek(this.dayOfWeek, this.valueControl);

  @override
  _CheckBoxDayOfWeekState createState() => _CheckBoxDayOfWeekState();
}

class _CheckBoxDayOfWeekState extends State<CheckBoxDayOfWeek> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Checkbox(
          value: widget.valueControl,
          onChanged: (value) {},
        ),
        Text(
          this.widget.dayOfWeek,
          style: TextStyle(fontSize: 16.0),
        ),
      ],
    );
  }
}

class ListExercises extends StatefulWidget {
  Workout _workout;

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
                .push(
                    MaterialPageRoute(builder: (context) => FormAddExercise()))
                .then((_exercise) {
              this.widget._workout.addExercise(_exercise);
            });
          },
        ),
        body: ListView.builder(
          itemCount: this.widget._workout.exercises.length,
          itemBuilder: (context, index) =>
              ItemListExercise(this.widget._workout.exercises[index]),
        ));
  }
}

class Exercise {
  final String name;
  final int weight;
  final int time;
  final int repetitions;

  Exercise(this.name, {this.weight, this.time, this.repetitions});

  @override
  String toString() {
    return "Its toString bitch";
  }
}

class FormAddExercise extends StatefulWidget {
  @override
  _FormAddExerciseState createState() => _FormAddExerciseState();
}

class _FormAddExerciseState extends State<FormAddExercise> {
  TextEditingController _nameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Workout"),
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Nome do Exercicio',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Nome',
                hintText: 'Nadas',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text(
                "Add Workout",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                Navigator.pop(context, Exercise(_nameController.text));
              },
            ),
          ),
        ],
      ),
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
        subtitle: Text(this.toString()),
      ),
    );
  }
}
