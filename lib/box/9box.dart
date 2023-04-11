import 'package:flutter/material.dart';

class player {
  static const empty="";
}

class Game {
  static final boardlenth = 9;
  static final boardsize = 100.0;

  //creating a board
  List<String>? board;

  static List<String>? initGameBoard() =>
      List.generate(boardlenth, (index) => player.empty);
}

