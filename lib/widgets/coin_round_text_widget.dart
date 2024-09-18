import 'package:flutter/material.dart';
import 'package:mydicegame/game/game_view_model.dart';

class CoinRoundTextWidget extends StatelessWidget {
  final int currentCoin;
  final int currentRound;
  final GameViewModel viewModel; // Include this only if needed

  const CoinRoundTextWidget({
    Key? key,
    required this.currentCoin,
    required this.currentRound,
    required this.viewModel, // Include this only if needed
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Total coins: $currentCoin",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 20.0),
        Text(
          "Total round: $currentRound",
          style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
