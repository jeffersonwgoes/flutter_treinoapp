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
  _ListWorkoutsState createState() => _ListWorkoutsState();
}

class _ListWorkoutsState extends State<ListWorkouts> {
  List<Workout> workouts = List();
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
              debugPrint("Workout: " +
                  workout.name +
                  " Days: " +
                  workout.getDaysOfWeek());
            });
          },
        ),
        body: ListView.builder(
          itemCount: workouts.length,
          itemBuilder: (context, index) => ItemListWorkouts(workouts[index]),
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
        onTap: () => debugPrint('Tap no ' + this.workout.name),
        title: Text(this.workout.name),
        subtitle: Text(this.workout.getDaysOfWeek()),
      ),
    );
  }
}

class Workout {
  final String name;
  final List<bool> daysOfWeek;

  Workout(this.name, this.daysOfWeek);

  String getDaysOfWeek() {
    String _daysOfWeek = "";
    _daysOfWeek += this.daysOfWeek[0] == true ? 'Seg' : '';
    _daysOfWeek += (_daysOfWeek.length > 0 ? ' - ' : '') +
        (this.daysOfWeek[1] == true ? 'Ter' : '');
    _daysOfWeek += (_daysOfWeek.length > 0 ? ' - ' : '') +
        (this.daysOfWeek[2] == true ? 'Qua' : '');
    _daysOfWeek += (_daysOfWeek.length > 0 ? ' - ' : '') +
        (this.daysOfWeek[3] == true ? 'Qui' : '');
    _daysOfWeek += (_daysOfWeek.length > 0 ? ' - ' : '') +
        (this.daysOfWeek[4] == true ? 'Sex' : '');
    _daysOfWeek += (_daysOfWeek.length > 0 ? ' - ' : '') +
        (this.daysOfWeek[5] == true ? 'Sab' : '');
    _daysOfWeek += (_daysOfWeek.length > 0 ? ' - ' : '') +
        (this.daysOfWeek[6] == true ? 'D,on' : '');
    return _daysOfWeek;
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
                for (bool item in _chbDay) {
                  debugPrint('item: ' + item.toString());
                }
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
