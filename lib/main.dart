import 'package:flutter/material.dart';
import 'package:toast/toast.dart';

void main() => runApp(EasyWorkout());


class EasyWorkout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListExercises(),
    );
  }
}

class ListExercises extends StatefulWidget {
  @override
  List<Exercise> _exercises = new List();
  State<StatefulWidget> createState() => ItemExercise();
}

class ItemExercise extends State<ListExercises> {
  Widget build(BuildContext context) {
    widget._exercises.add(Exercise("Ex1"));
    widget._exercises.add(Exercise("Ex2"));
    widget._exercises.add(Exercise("Ex3"));

    return Scaffold(
      appBar: AppBar(
        title: Text("Exercícios")
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: ()=> _addNewExercise(context),
      ),
      body: ListView.builder(
        itemCount: widget._exercises.length,
        itemBuilder: (context, index) => ItemListExercise(widget._exercises[index]),
      ),
    );
  }

  void _addNewExercise(BuildContext context) {
    Toast.show("Clicado float", context);
  }
}


class ItemListExercise extends StatelessWidget {
  final Exercise exercise;

  ItemListExercise(this.exercise);  

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.toc),
        title: Text(this.exercise.name),
        subtitle: Text(this.exercise.toString()),
        //onTap: () => Toast.show("Tap: " + this.exercise + " - " + _textToWrite, context),
        //onLongPress: () => Toast.show("LongPress: " + this.exercise + " - " + _textToWrite, context),
      ),
    );
  }  
}

class Exercise {
  final String name;
  final String repetition;
  final String weight;
  final String time;

  Exercise(this.name, {this.repetition, this.weight, this.time});

  toString() {
    String _text = "";

    if(this.repetition != null) {
      _text += this.repetition;
    } 
    if(this.weight != null) {
      _text += (_text != "" ? " - " : "") + this.weight;
    }

    if(this.time != null) {
      _text += (_text != "" ? " - " : "") + this.time;
    }
    return _text;
  }
}