import "package:flutter/material.dart";
import "dart:math";

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() {
    return _DiceRollerState();
  }
}

class _DiceRollerState extends State<DiceRoller> {
  var currentDiceRoll = 1;
  var history = <int>[];

  // roll the dice
  void rollDice() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      history.add(currentDiceRoll);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/dice-$currentDiceRoll.png',
          width: 200,
        ),
        const SizedBox(height: 20),
        TextButton(
            onPressed: rollDice,
            style: TextButton.styleFrom(
                padding: const EdgeInsets.all(16.0),
                foregroundColor: Colors.white,
                textStyle: const TextStyle(fontSize: 28)),
            child: const Text('Roll the dice')),
        const SizedBox(height: 20),
        const Text('Roll History', style: TextStyle(fontSize: 24, color: Colors.white)),
        ListView.builder(
          shrinkWrap: true,
          padding: const EdgeInsets.all(8),
          scrollDirection: Axis.vertical,
          itemCount: history.length,
          itemBuilder: (context, index) {
            return Text('Roll ${index + 1}: ${history[index]}',
                style: const TextStyle(fontSize: 20, color: Colors.white)
            );
          },
        ),
      ],
    );
  }
}
