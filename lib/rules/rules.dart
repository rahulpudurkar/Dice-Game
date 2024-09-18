import 'package:flutter/material.dart';

class Rules extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:
            Colors.blue, // Assuming an orange AppBar from the Swift file
        title: Text(
          'Rules',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white, // White color for the AppBar title
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Text(
                'Game Rules',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Deep blue color for the header
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                '1. You will start with 100 coins.\n'
                '2. You can bet from 1% to 100% of your coins in a round.\n'
                '3. Press the roll button to roll the dice. If the sum of your dice is greater than the computer\'s, you win the round; otherwise, the computer wins. If the sum is the same, the round is a tie.\n'
                '4. Each press of the roll button increments the total round counter.\n'
                '5. Pressing the restart button resets your coins to 100 and the total round count to 0.',
                style: TextStyle(
                  fontSize: 18,
                  color:
                      Colors.black, // Slightly lighter blue for the body text
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
