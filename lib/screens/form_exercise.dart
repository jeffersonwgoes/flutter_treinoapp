import 'package:flutter/material.dart';
import 'package:treino_app/database/database_exercise.dart';
import 'package:treino_app/models/exercise.dart';

class FormAddExercise extends StatefulWidget {
  final int idWorkout;

  FormAddExercise(this.idWorkout);

  @override
  _FormAddExerciseState createState() => _FormAddExerciseState();
}

class _FormAddExerciseState extends State<FormAddExercise> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _timeController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  TextEditingController _repetitionsController = TextEditingController();
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
              controller: _repetitionsController,
              decoration: InputDecoration(
                labelText: 'Repetições',
                hintText: 'Número de repetições',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              controller: _timeController,
              decoration: InputDecoration(
                labelText: 'Tempo',
                hintText: 'Tempo para executar o exercício',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: TextStyle(fontSize: 16.0),
              controller: _weightController,
              decoration: InputDecoration(
                labelText: 'Carga',
                hintText: 'Carga do Exercicio',
              ),
              keyboardType: TextInputType.number,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: RaisedButton(
              child: Text(
                "Add Exercise",
                style: TextStyle(fontSize: 16.0),
              ),
              onPressed: () => insertExercises(Exercise(
                      _nameController.text, widget.idWorkout,
                      weight: int.tryParse(_weightController.text),
                      time: int.tryParse(_timeController.text),
                      repetitions: int.tryParse(_repetitionsController.text)))
                  .then((onValue) => Navigator.pop(context)),
            ),
          ),
        ],
      ),
    );
  }
}
