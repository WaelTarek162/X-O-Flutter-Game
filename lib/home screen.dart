import 'dart:async';
import 'package:flutter/material.dart';
import 'package:confetti/confetti.dart';
import 'Scenario_of_game.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({Key? key}) : super(key: key);

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  String active_player = 'X';
  bool game_over = false;
  int turn = 0;
  String result = '';
  Game game = Game();
  bool is_switched = false;

  bool is_win = false;
  final controller = ConfettiController();

  @override
  void initState() {
    super.initState();
    controller.play();
  }

  @override
  void dispose() {
    // dispose the controller
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var md = MediaQuery.of(context).orientation;
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: SafeArea(
          child: (md == Orientation.landscape)
              ? Row(
                  children: [
                    Column(
                      children: [
                        //  ... _start_section(),
                        const SizedBox(height: 25),
                      !game_over?  Text(
                          'It\'s -- $active_player -- turn'.toUpperCase(),
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.w800),
                          textAlign: TextAlign.center,
                        ):Text('Congrats!',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                        const SizedBox(height: 25),
                        ..._end_section(),
                      ],
                    ),

                    _expanded(context),
                  ],
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ..._start_section(),
                    _expanded(context),
                    ..._end_section(),
                  ],
                )),
    );
  }

  List<Widget> _start_section() {
    return [
      SwitchListTile.adaptive(
          title: const Text(
            'Single / Double mode',
            style: TextStyle(
                color: Colors.teal, fontWeight: FontWeight.bold, fontSize: 25),
            textAlign: TextAlign.center,
          ),
          value: is_switched,
          onChanged: (val) {
            setState(() {
              is_switched = val;
            });
          }),
    !game_over?  Text(
        'It\'s -- $active_player -- turn'.toUpperCase(),
        style: const TextStyle(
            color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800),
        textAlign: TextAlign.center,
      ):Text('Congrats!',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
    ];
  }

  List<Widget> _end_section() {
    return [

      result.contains('O')||result.contains('X')?
      ConfettiWidget(

        confettiController: controller,
        shouldLoop: true,
        blastDirectionality: BlastDirectionality.explosive,
        emissionFrequency: 0.3,
        numberOfParticles: 20,
        maxBlastForce: 50,
        minBlastForce: 10,
      ):Text(''),
      Text(
        result,
        style: const TextStyle(color: Colors.cyanAccent, fontSize: 20,fontWeight: FontWeight.w900),
        textAlign: TextAlign.center,
      ),

      ElevatedButton.icon(
        onPressed: () {
          setState(() {
            player.playerX = [];
            player.playerO = [];
            active_player = 'X';
            game_over = false;
            turn = 0;
            result = '';
            game = Game();
            controller.stop();
          });
        },
        icon: Icon(Icons.replay_sharp),
        label: Text('Replay the game'),
        style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all(Theme.of(context).splashColor)),
      )
    ];
  }

  Expanded _expanded(BuildContext context) {
    return Expanded(
      child: GridView.count(
          padding: const EdgeInsets.all(16),
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          childAspectRatio:
              MediaQuery.of(context).orientation == Orientation.landscape
                  ? 2
                  : 1,
          crossAxisSpacing: 8.0,
          children: List.generate(
              9,
              (index) => InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: game_over ? null : () => _onTab(index),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Theme.of(context).shadowColor,
                          borderRadius: BorderRadius.circular(16)),
                      child: Center(
                          child: Text(
                              player.playerX.contains(index)
                                  ? 'X'
                                  : player.playerO.contains(index)
                                      ? 'O'
                                      : '',
                              style: TextStyle(
                                  color: player.playerX.contains(index)
                                      ? Colors.blue
                                      : Colors.pink,
                                  fontSize: 50),
                              textAlign: TextAlign.center)),
                    ),
                  ))),
    );
  }

  _onTab(int index) async {
    if ((player.playerX.isEmpty || !player.playerX.contains(index)) &&
        (player.playerO.isEmpty || !player.playerO.contains(index))) {
      game.play_game(index, active_player);
      uddate_state();
      if(game_over){controller.play();}
      if (!is_switched && !game_over && turn < 9) {
        Timer(Duration(milliseconds: 300), () async {
          await game.auto_play(active_player);
          uddate_state();
          if(game_over){controller.play();}
        });
      }
    }


  }

  void uddate_state() {
    setState(() {
      active_player = (active_player == 'X') ? 'O' : 'X';
      turn++;
      String winner = game.check_winner();

      if (winner != '') {
        game_over = true;
        result = '$winner player is the winner'.toUpperCase();
      } else if (!game_over && turn == 9) {
        result = 'DRAW!';
      }
    });
  }
}
