import 'package:flutter/material.dart';
import 'package:mydicegame/game/game_view_model.dart';

class AIPlayerImagesWidget extends StatelessWidget {
  final GameViewModel viewModel;

  const AIPlayerImagesWidget({Key? key, required this.viewModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double dynamicSpacing =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? 40.0
            : 100.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Image.asset("images/${viewModel.aiNumber1}.png",
                height: dynamicSpacing, width: dynamicSpacing),
            Image.asset("images/${viewModel.aiNumber2}.png",
                height: dynamicSpacing, width: dynamicSpacing),
            const Text("AI",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(width: 10.0),
        const Text("VS",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        const SizedBox(width: 10.0),
        Column(
          children: [
            Image.asset("images/${viewModel.playerNumber1}.png",
                height: dynamicSpacing, width: dynamicSpacing),
            Image.asset("images/${viewModel.playerNumber2}.png",
                height: dynamicSpacing, width: dynamicSpacing),
            const Text("Player",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
