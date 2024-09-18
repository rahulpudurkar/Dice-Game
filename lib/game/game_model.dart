import 'dart:math';

class GameModel {
  int currentRound = 0;
  int currentCoin = 100;
  String playerNumber1 = "roll";
  String playerNumber2 = "roll";
  String aiNumber1 = "roll";
  String aiNumber2 = "roll";

  void rollDice(double sliderValue) {
    final random = Random();
    playerNumber1 = (random.nextInt(6) + 1).toString();
    playerNumber2 = (random.nextInt(6) + 1).toString();
    aiNumber1 = (random.nextInt(6) + 1).toString();
    aiNumber2 = (random.nextInt(6) + 1).toString();

    currentRound++;

    // Calculate the percentage of the current coin to be bet based on the slider value
    final percentage = sliderValue / 100;

    final playerSum = int.parse(playerNumber1) + int.parse(playerNumber2);
    final aiSum = int.parse(aiNumber1) + int.parse(aiNumber2);

    // Adjust current coin based on the result of the dice roll and the percentage of the current coin to be bet
    if (playerSum > aiSum) {
      currentCoin += (currentCoin * percentage).round();
    } else if (playerSum < aiSum) {
      currentCoin -= (currentCoin * percentage).round();
    }
  }

  void restartGame() {
    currentCoin = 100;
    currentRound = 0;
    playerNumber1 = "roll";
    playerNumber2 = "roll";
    aiNumber1 = "roll";
    aiNumber2 = "roll";
  }
}
