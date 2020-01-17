class Workout {
  final int id;
  final String name;

  Workout(this.name, {this.id});

  @override
  String toString() {
    return "Workout $id $name";
  }

  Map<String, dynamic> toMap() {
    return {'name': this.name};
  }
}
