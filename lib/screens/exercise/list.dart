import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_treinoapp/components/card.dart';
import 'package:flutter_treinoapp/models/exercise.dart';
import 'package:flutter_treinoapp/screens/exercise/form.dart';

final String _titleAppBarListWorkOut = "Exercicios";

class ListExercises extends StatefulWidget {
  final List<Exercise> _exercises = List();

  @override
  State<StatefulWidget> createState() => ListExercisesState();

}

class ListExercisesState extends State<ListExercises> {
  ListExercisesState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_titleAppBarListWorkOut,),),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _onClickAddExercise(context)
      ),
      body: ListView.builder(
        itemCount: widget._exercises.length,
        itemBuilder: (context, index) => ItemListExercises(widget._exercises[index]),
      ),
    );
  }

  void _onClickAddExercise(BuildContext context) {
    debugPrint("Cliquei pra Add");
    Navigator.push(context, MaterialPageRoute(
        builder: (context) => FormInsertExercise()
      ),
    ).then((receivedExercise) => _refreshAddingItem(receivedExercise));
  }

  _refreshAddingItem(receivedExercise) {
    if(receivedExercise != null) {
      setState(() {
        widget._exercises.add(receivedExercise);
      });
    }
  }

  // _editExercise(BuildContext context, int index) {
  //   Navigator.push(context, 
  //     MaterialPageRoute(
  //       builder: (context) => FormInsertExercise(name: widget._exercises[index].name,),
  //     ),
  //   ).then((exerciseEdited) {
  //     debugPrint("Edit" + exerciseEdited.name);
  //     if(exerciseEdited != null) {
  //       // setState(() {
  //         widget._exercises[index] = exerciseEdited;
  //       // });
  //     }
  //   });
  // }
}

class ItemListExercises extends StatelessWidget {
  final Exercise _exercise;
  // final GestureTapCallback onTap;

  ItemListExercises(this._exercise, /*this.onTap*/);

  @override
  Widget build(BuildContext context) {
    return CardItem(
      (){},
      leading: Icons.title,
      title: _exercise.name,
      subtitle: _exercise.toString(),
    );
  }
}