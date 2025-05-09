class Ganador {
  const Ganador ({required this.ganadores});

   final List<String> ganadores;

  List<String> shuffleGanadores () {
    final copyOfList = List.of(ganadores);
    copyOfList.shuffle();
    return copyOfList;
  }
}