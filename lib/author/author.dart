import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class Author extends StatefulWidget {
  @override
  _Author createState() => _Author();
}

class _Author extends State<Author> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Scaffold(
        appBar: _buildAppBar(),
        backgroundColor: Colors.white,
        body: _buildBody(context),
      ),
    );
  }

  PreferredSizeWidget? _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue,
      title: const Text(
        "About Me",
        style: TextStyle(
          fontFamily: 'Product Sans',
          fontSize: 18,
          fontWeight: FontWeight.w700,
          color: Colors.white,
        ),
        textAlign: TextAlign.center,
      ),
      centerTitle: true,
    );
  }

  Widget _buildBody(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
      child: ListView(
        children: <Widget>[
          _buildImage(),
          SizedBox(height: 20.0),
          _buildAnimatedText(),
          SizedBox(height: 10.0),
          _buildElevatedButton(context),
        ],
      ),
    );
  }

  Widget _buildImage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Card(
          shape: const CircleBorder(),
          clipBehavior: Clip.antiAlias,
          elevation: 5,
          child: Image.asset(
            'images/Js.png',
            width: 200,
            height: 200,
            fit: BoxFit.cover,
          ),
        ),
      ],
    );
  }

  Widget _buildAnimatedText() {
    return SizedBox(
      height: 350,
      child: DefaultTextStyle(
        style: TextStyle(
          color: Colors.black,
          fontSize: 24,
          fontWeight: FontWeight.w900,
        ),
        child: AnimatedTextKit(
          repeatForever: true,
          isRepeatingAnimation: true,
          animatedTexts: [
            TypewriterAnimatedText(
              "Hi! I am Rahul and I am currently pursuing a master’s in computer science from Syracuse University. I have developed a great amount of interest in the field of software development, particularly web and application development at the frontend as well as backend.",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildElevatedButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          if (Platform.isIOS) {
            showCupertinoDialog(
              context: context,
              builder: (BuildContext context) => CupertinoAlertDialog(
                title: const Text('Profile'),
                content: Text(
                  "You can contact me at rpudurka@syr.edu.",
                  style:
                      TextStyle(color: Colors.black), // Set text color to black
                ),
                actions: <Widget>[
                  CupertinoDialogAction(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          } else {
            showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Profile'),
                content: Text(
                  "You can contact me at rpudurka@syr.edu.",
                  style:
                      TextStyle(color: Colors.black), // Set text color to black
                ),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text('OK'),
                  ),
                ],
              ),
            );
          }
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
        ),
        child: Text(
          "Contact",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
