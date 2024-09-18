import 'package:flutter/material.dart';
import 'package:mydicegame/widgets/ai_player_images_widget.dart';
import 'package:mydicegame/widgets/bet_slider_widget.dart';
import 'package:mydicegame/widgets/info_buttons_widget.dart';
import 'package:provider/provider.dart';
import 'game_view_model.dart';
import 'package:mydicegame/widgets/coin_round_text_widget.dart';
import 'package:mydicegame/widgets/roll_restart_buttons_widget.dart';

class GamePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GameViewModel(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.orange,
          scaffoldBackgroundColor: Colors.white,
          textTheme: TextTheme(
            bodyText1: TextStyle(color: Colors.orange),
            bodyText2: TextStyle(color: Colors.purple),
          ),
        ),
        home: GameView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class GameView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<GameViewModel>(context, listen: true);
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: _buildBody(context, viewModel),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      title: Text(
        "MyDiceGame",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.purple),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
    );
  }

  Widget _buildBody(BuildContext context, GameViewModel viewModel) {
    double dynamicSpacing =
        MediaQuery.of(context).orientation == Orientation.landscape
            ? 0.2
            : 20.0;

    return SingleChildScrollView(
      child: ConstrainedBox(
        constraints: BoxConstraints(
          minHeight: MediaQuery.of(context).size.height * 0.9,
        ),
        child: IntrinsicHeight(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              CoinRoundTextWidget(
                currentCoin: viewModel.currentCoin,
                currentRound: viewModel.currentRound,
                viewModel: viewModel,
              ),
              SizedBox(height: dynamicSpacing),
              AIPlayerImagesWidget(viewModel: viewModel),
              SizedBox(height: dynamicSpacing),
              RollRestartButtonsWidget(
                onRoll: () => viewModel.rollDice(context),
                onRestart: () => viewModel.restartGame(),
              ),
              SizedBox(height: dynamicSpacing),
              BetSliderWidget(viewModel: viewModel),
              SizedBox(height: dynamicSpacing),
              InfoButtonsWidget(),
              SizedBox(height: dynamicSpacing),
            ],
          ),
        ),
      ),
    );
  }
}
