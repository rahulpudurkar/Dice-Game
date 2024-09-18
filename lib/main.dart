import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:mydicegame/game/game_view.dart';
import 'package:mydicegame/game/game_view_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => GameViewModel(),
      child: MyApp(), // Or whatever your main app widget is
    ),
  );
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyDiceGame',
      debugShowCheckedModeBanner: false,
      home: ChangeNotifierProvider(
        create: (context) => GameViewModel(), // Provide an instance of GameViewModel
        child: GamePage(), // Wrap GameView with Provider<GameViewModel>
      ),
    );
  }
}
