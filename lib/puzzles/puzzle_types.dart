enum PUZZLETYPE { xoxo, letters, shapes, mixed }

String enumToString(PUZZLETYPE puzzletype) {
  return puzzletype.toString().split('.').last;
}
