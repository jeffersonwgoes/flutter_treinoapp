

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_treinoapp/components/editor.dart';
import 'package:flutter_treinoapp/models/exercise.dart';

final String _appBarTitleFormInsertExercise = 'Inserir Exercício';
final String _hintNameExercise = 'Ex: Bíceps Scott';
final String _nameExecise = 'Nome';
final String _hintWeight = 'Ex: 10 kg';
final String _nameWeight = 'Carga';
final String _hintTime = 'Ex: 30 Seg';
final String _nameTime = 'Tempo';
final String _hintRepetition = 'Ex: 10x';
final String _nameRepetition = 'Número de Repetições';

class FormInsertExercise extends StatelessWidget {
  final TextEditingController _controllerName = new TextEditingController();
  final TextEditingController _controllerWeight = new TextEditingController();
  final TextEditingController _controllerTime = new TextEditingController();
  final TextEditingController _controllerRepetition = new TextEditingController();
  
  FormInsertExercise({String name, int weight, int repetition, int time}){
      _controllerName.text = name != null ? name : "";
  }

  void _createExercise(BuildContext context) {
    if(_controllerName.text.isNotEmpty) {
      Navigator.pop(context, Exercise(_controllerName.text));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: <Widget>[
          Editor(
            controller: _controllerName,
            hint: _hintNameExercise,
            icon: Icons.today,
            label: _nameExecise,
          ),
          Editor(
            controller: _controllerWeight,
            hint: _hintWeight,
            icon: Icons.today,
            label: _nameWeight,
          ),
          Editor(
            controller: _controllerRepetition,
            hint: _hintRepetition,
            icon: Icons.today,
            label: _nameRepetition,
          ),
          Editor(
            controller: _controllerTime,
            hint: _hintTime,
            icon: Icons.today,
            label: _nameTime,
          ),
          RaisedButton(
            onPressed: () => _createExercise(context),
            child: Text('Inserir'),
          ),
        ],),
      ),
      appBar: AppBar(title: Text(_appBarTitleFormInsertExercise),),
    );
  }

}

