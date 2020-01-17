class Exercise {
  final int id;
  final int idWorkout;
  final String name;
  final int weight;
  final int time;
  final int repetitions;

  Exercise(this.name, this.idWorkout,
      {this.weight, this.time, this.repetitions, this.id});

  @override
  String toString() {
    String subtitle = "";
    if (this.repetitions != null) {
      subtitle += "Reps: " + repetitions.toString() + "x";
    }

    if (this.weight != null) {
      subtitle += subtitle != "" ? " " : "";
      subtitle += "Carga: " + weight.toString() + " kg";
    }

    if (this.time != null) {
      subtitle += subtitle != "" ? " " : "";
      subtitle += "Tempo: " + time.toString() + "seg";
    }

    return subtitle;
  }

  int get timeExecution => this.time == null ? 0 : this.time;
  int get weightUsed => this.weight == null ? 0 : this.weight;
  int get repetition => this.repetitions == null ? 0 : this.repetitions;
}
