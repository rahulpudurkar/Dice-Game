import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'game_model.dart';

class GameViewModel extends ChangeNotifier {
  final GameModel _model = GameModel();

  double _currentSliderValue = 30;
  bool showAlert = false;

  double get currentSliderValue => _currentSliderValue;
  int get currentRound => _model.currentRound;
  int get currentCoin => _model.currentCoin;
  String get playerNumber1 => _model.playerNumber1;
  String get playerNumber2 => _model.playerNumber2;
  String get aiNumber1 => _model.aiNumber1;
  String get aiNumber2 => _model.aiNumber2;

  void rollDice(BuildContext context) {
    _model.rollDice(_currentSliderValue);
    notifyListeners();
    if (_model.currentCoin <= 0) {
      // Show alert and restart the game
      _showRestartGameAlert(context);
      restartGame();
    }
  }

  void restartGame() {
    _model.restartGame();
    _currentSliderValue = 30;
    notifyListeners();
  }

  void _showRestartGameAlert(BuildContext context) {
    String title = "Game Over";
    String content = "Your coins have run out. The game will restart.";

    if (Platform.isIOS) {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("OK"),
            ),
          ],
        ),
      );
    }
  }

  void updateSliderValue(double value) {
    _currentSliderValue = value;
    notifyListeners();
  }
}
