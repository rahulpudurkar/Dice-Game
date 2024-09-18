import 'package:flutter/material.dart';

class RollRestartButtonsWidget extends StatelessWidget {
  final VoidCallback onRoll;
  final VoidCallback onRestart;
  const RollRestartButtonsWidget(
      {Key? key, required this.onRoll, required this.onRestart})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.25,
          child: ElevatedButton(
            onPressed: onRoll,
            child: Text(
              "Roll",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 20,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        ),
        SizedBox(width: 20.0),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.30,
          child: ElevatedButton(
            onPressed: onRestart,
            child: Text(
              "Restart",
              style: TextStyle(
                color: Colors.purple,
                fontSize: 19,
              ),
            ),
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
