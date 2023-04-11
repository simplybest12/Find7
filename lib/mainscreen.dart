import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'box/9box.dart';
import 'color/pallete.dart';

class MainScreen extends StatefulWidget {
  MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  void initState() {
    // TODO: implement initState
    super.initState();
    game.board = Game.initGameBoard();
    print(game.board);
  }

  int count = 5;

  Game game = Game();
  String res = "";

  void newwingane() {
    setState(() {
      res = "Winner".toUpperCase();
      game.board = Game.initGameBoard();
      count = 5;
    });
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          title: const Text(
            "PUZZLE",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, letterSpacing: 2),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Pallete.secondaryColor,
        ),
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Find 7!".toUpperCase(),
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 30,
                          fontWeight: FontWeight.bold)),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  margin: const EdgeInsets.all(16),
                  width: boardWidth,
                  height: boardWidth,
                  child: GridView.count(
                      crossAxisCount: Game.boardlenth ~/ 3,
                      padding: const EdgeInsets.all(16),
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                      children: List.generate(
                        Game.boardlenth,
                        (index) {
                          return InkWell(
                            onTap: () {
                              if (game.board![index] == "") {
                                setState(() {
                                  game.board![index] =
                                      Random().nextInt(10).toString();

                                  count--;

                                  if (count <= 0) {
                                    game.board = Game.initGameBoard();
                                    res = "Game Over!!";
                                    if (count < 0) {
                                      count *= 0;
                                    }
                                  } else if (game.board![index] == "7") {
                                    Timer(Duration(milliseconds: 250), () {
                                      newwingane();
                                    });
                                  }
                                });
                              }
                            },
                            child: (Container(
                              width: Game.boardsize,
                              height: Game.boardsize,
                              decoration: BoxDecoration(
                                color: Colors.white30,
                                borderRadius: BorderRadius.circular(16),
                              ),
                              child: Center(
                                child: Text(
                                  game.board![index],
                                  style: GoogleFonts.pacifico(
                                    textStyle: const TextStyle(
                                        color: Colors.white, fontSize: 45),
                                  ),
                                ),
                              ),
                            )),
                          );
                        },
                      )),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    children: [
                      Text(
                        "Your Moves :  $count",
                        style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 25,
                ),
                Container(
                    height: 80,
                    width: 300,
                    color: Colors.transparent,
                    child: Center(
                        child: Text(
                      res,
                      style: GoogleFonts.lato(
                          textStyle: const TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8)),
                    ))),
                const SizedBox(
                  height: 45,
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      game.board = Game.initGameBoard();
                      res = "";
                      count = 5;
                    });
                  },
                  icon: Icon(Icons.refresh_rounded),
                  iconSize: 40,
                  color: Colors.white,
                )
              ],
            ),
          ),
        ));
  }
}
