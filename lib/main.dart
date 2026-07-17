import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: DiceApp());
  }
}

class DiceApp extends StatefulWidget {
  const DiceApp({super.key});

  @override
  State<DiceApp> createState() => _DiceAppState();
}

class _DiceAppState extends State<DiceApp> {
  int n4 = 4;
  int n1 = 1;
  int n2 = 2;
  int n3 = 3;

  int turn1 = 0;
  int turn2 = 0;
  int turn3 = 0;
  int turn4 = 0;

  int score1 = 0;
  int score2 = 0;
  int score3 = 0;
  int score4 = 0;
  String winner = '';
  void checkWinner() {
    if (turn1 == 5 && turn2 == 5 && turn3 == 5 && turn4 == 5) {
      if (score1 > score2 && score1 > score3 && score1 > score4) {
        winner = 'Player 1';
      } else if (score2 > score1 && score2 > score3 && score2 > score4) {
        winner = 'Player 2';
      } else if (score3 > score1 && score3 > score2 && score3 > score4) {
        winner = 'Player 3';
      } else if (score4 > score1 && score4 > score2 && score4 > score3) {
        winner = 'Player 4';
      } else {
        winner = 'Its a tie';
      }

      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Game Over'),
            content: Text('$winner Wins'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Ok'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dice Roll Game',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 30,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 19, 68, 87),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Player 1', style: TextStyle(fontSize: 20)),
                      Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.purple.shade200,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Turns: $turn1',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Score: $score1',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (turn1 < 5) {
                              n1 = Random().nextInt(6) + 1;
                              turn1++;
                              score1 += n1;
                            }
                          });
                          checkWinner();
                        },
                        child: Center(child: Image.asset('images/d$n1.png')),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Player 2', style: TextStyle(fontSize: 20)),
                      Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.green.shade200,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Turns: $turn2',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Score: $score2',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (turn2 < 5) {
                              n2 = Random().nextInt(6) + 1;
                              turn2++;
                              score2 += n2;
                            }
                          });
                          checkWinner();
                        },
                        child: Center(child: Image.asset('images/d$n2.png')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text('Player 3', style: TextStyle(fontSize: 20)),
                      Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.amber.shade200,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Turns: $turn3',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Score: $score3',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (turn3 < 5) {
                              n3 = Random().nextInt(6) + 1;
                              turn3++;
                              score3 += n3;
                            }
                          });
                          checkWinner();
                        },
                        child: Center(child: Image.asset('images/d$n3.png')),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text('Player 4', style: TextStyle(fontSize: 20)),
                      Container(
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.blue.shade200,
                          borderRadius: BorderRadius.circular(7),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Turns: $turn4',
                              style: TextStyle(fontSize: 20),
                            ),
                            Text(
                              'Score: $score4',
                              style: TextStyle(fontSize: 20),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            if (turn4 < 5) {
                              n4 = Random().nextInt(6) + 1;
                              turn4++;
                              score4 += n4;
                            }
                          });
                          checkWinner();
                        },
                        child: Center(child: Image.asset('images/d$n4.png')),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 19, 68, 87),
              ),
              onPressed: () {
                setState(() {
                  n4 = 4;
                  n1 = 1;
                  n2 = 2;
                  n3 = 3;

                  turn1 = 0;
                  turn2 = 0;
                  turn3 = 0;
                  turn4 = 0;

                  score1 = 0;
                  score2 = 0;
                  score3 = 0;
                  score4 = 0;
                });
              },
              child: Text(
                'Start Over',
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
