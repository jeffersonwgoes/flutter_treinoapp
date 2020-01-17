import 'package:flutter/material.dart';
import 'package:treino_app/database/database_workout.dart';
import 'package:treino_app/models/workout.dart';

class FormAddWorkout extends StatefulWidget {
  @override
  _FormAddWorkoutState createState() => _FormAddWorkoutState();
}

class _FormAddWorkoutState extends State<FormAddWorkout> {
  TextEditingController _nameController = TextEditingController();
  // List<bool> _chbDay = [true, false, false, false, false, false, false];

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
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text(
                "Add Workout",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () {
                insertWorkout(Workout(_nameController.text))
                    .then((value) => Navigator.pop(context));
              },
            ),
          ),
        ],
      ),
    );
  }
}

// class CheckBoxDayOfWeek extends StatefulWidget {
//   final String dayOfWeek;
//   bool valueControl;

//   CheckBoxDayOfWeek(this.dayOfWeek, this.valueControl);

//   @override
//   _CheckBoxDayOfWeekState createState() => _CheckBoxDayOfWeekState();
// }

// class _CheckBoxDayOfWeekState extends State<CheckBoxDayOfWeek> {
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: <Widget>[
//         Checkbox(
//           value: widget.valueControl,
//           onChanged: (value) {},
//         ),
//         Text(
//           this.widget.dayOfWeek,
//           style: TextStyle(fontSize: 16.0),
//         ),
//       ],
//     );
//   }
// }
