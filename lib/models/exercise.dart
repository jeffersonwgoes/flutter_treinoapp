class Exercise {
  final String name;
  final int weight;
  final int repetition;
  final int time;

  Exercise(this.name, {this.weight, this.repetition, this.time});
  @override
  String toString() {
    return (weight != null ? "Peso: "+weight.toString() + " kg" : "") + 
    (repetition != null ? " Rep: "+repetition.toString() + "x" : "") + 
    (time != null ? " Tempo: "+time.toString() + " s" : "");
  }
}