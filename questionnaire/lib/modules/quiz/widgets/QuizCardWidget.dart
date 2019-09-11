import 'package:flutter/material.dart';

class QuizImageCard extends StatelessWidget {
  const QuizImageCard({Key key, this.imageName}) : super(key: key);

  final String imageName;

  @override
  Widget build(BuildContext context) {
    return Image.asset(imageName);
  }
}

class QuizTitleCard extends StatelessWidget {
  const QuizTitleCard({Key key, this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      child: Text(
        title,
        textAlign: TextAlign.left,
        style: TextStyle(fontSize: 30),
      ),
      padding: const EdgeInsets.only(left: 20, top: 0, bottom: 0, right: 20),
    ));
  }
}

class QuizCard extends StatefulWidget {
  QuizCard({Key key, this.question, this.questionPosition}) : super(key: key);

  final String question;
  final int questionPosition;
  final selectedIcon = Icons.check_circle;
  final unselectedIcon = Icons.blur_circular;

  @override
  _QuizCardState createState() => _QuizCardState();

  // callback for List View
  Function(int, bool) onTap;
}

class _QuizCardState extends State<QuizCard> {
  var selected = false;

  @override
  Widget build(BuildContext context) {
    return new GestureDetector(
        child: new Container(
            color: Colors.transparent,
            padding:
                const EdgeInsets.only(left: 20, top: 16, bottom: 0, right: 20),
            child: new ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: new Container(
                  color: Colors.orange[50],
                  child: new Column(
                    children: <Widget>[
                      new Container(height: 14),
                      new Row(
                        children: <Widget>[
                          new Container(
                              color: Colors.transparent,
                              width: 50,
                              child: Center(
                                  child: Icon( selected ? widget.selectedIcon : widget.unselectedIcon,
                                      color: Colors.green, size: 24))),
                          Expanded(child: new Text(widget.question)),
                          new Container(color: Colors.green[50], width: 10)
                        ],
                      ),
                      new Container(height: 14),
                    ],
                  )),
            )),
        onTap: (
        ) {
          setState(() {
            selected = !selected;
            widget.onTap(widget.questionPosition, selected);
          });
        });
  }
}
