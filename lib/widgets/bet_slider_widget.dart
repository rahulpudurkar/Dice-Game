import 'package:flutter/material.dart';
import 'package:mydicegame/game/game_view_model.dart';

class BetSliderWidget extends StatelessWidget {
  final GameViewModel viewModel;

  const BetSliderWidget({Key? key, required this.viewModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
            "Do you want to bet ${viewModel.currentSliderValue.round()}% of the coin ?",
            style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold)),
        Slider(
          value: viewModel.currentSliderValue,
          max: 100,
          min: 1.0,
          divisions: 99,
          label: viewModel.currentSliderValue.round().toString(),
          onChanged: (double value) {
            viewModel.updateSliderValue(value);
          },
          activeColor: Colors.purple,
        ),
      ],
    );
  }
}
