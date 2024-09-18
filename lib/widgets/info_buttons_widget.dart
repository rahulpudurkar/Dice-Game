import 'package:flutter/material.dart';
import 'package:mydicegame/author/author.dart';
import 'package:mydicegame/rules/rules.dart';

class InfoButtonsWidget extends StatelessWidget {
  const InfoButtonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          iconSize: 42.0,
          icon: Icon(Icons.description_outlined, color: Colors.purple),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Rules())),
        ),
        SizedBox(width: 15.0),
        IconButton(
          iconSize: 42.0,
          icon: Icon(Icons.person_outlined, color: Colors.purple),
          onPressed: () => Navigator.push(
              context, MaterialPageRoute(builder: (context) => Author())),
        ),
      ],
    );
  }
}
