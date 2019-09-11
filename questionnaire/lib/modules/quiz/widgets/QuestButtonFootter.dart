
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:questionnaire/blocks/Quests/Events/QuestsEvents.dart';
import 'package:questionnaire/blocks/Quests/States/QuestsStates.dart';
import 'package:questionnaire/blocks/Quests/questsBlock.dart';

class QuestButtonFootter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return new BlocBuilder(
      bloc: BlocProvider.of<QuestsBlock>(context), 
      builder: (context, QuestsBlockState state) {
        if (state is QuestsFishedState) {
          return Container(color: Colors.white);
        }
        return  new Container(
            height: 125,
            child: new Column(
              children: <Widget>[
                new Container(height: 25, color: Colors.white),
                new Expanded(
                    child: new Container(
                        width: double.infinity,
                        color: Colors.white,
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 10.0, right: 10.0, top: 12.0, bottom: 13.0),
                          child: MaterialButton(
                            textColor: Colors.white,
                            color: Colors.green,
                            child: Text("WEITER"),
                            onPressed: () {
                              BlocProvider.of<QuestsBlock>(context).dispatch(QuestsNextQuestEvent());
                            },
                            shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0),
                            ),
                          ),
                        ))),
                new Container(height: 25, color: Colors.white)
              ],
            ));
      },);
  }
}

