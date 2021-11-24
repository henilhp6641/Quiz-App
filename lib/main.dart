import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'quizbrain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

Quizbrain quizbrain = Quizbrain();

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          backgroundColor: Colors.black,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(22),
              child: quizapp(),
            ),
          )),
    );
  }
}

class quizapp extends StatefulWidget {
  const quizapp({Key? key}) : super(key: key);

  @override
  _quizappState createState() => _quizappState();
}

class _quizappState extends State<quizapp> {
  List<Icon> tf = [];

  void checkanswer(bool pickedanswer){
    bool correctanswer=quizbrain.getanswer();
    setState(() {
      if (quizbrain.isFinished() == true) {
        Alert(title: 'Finished', context: context).show();
        quizbrain.reset();
        tf = [];
      }
      else {
        if (pickedanswer == correctanswer) {
          tf.add(Icon(
            Icons.check,
            color: Colors.green,
          ));
          quizbrain.nextques();
        } else {
          tf.add(Icon(
            Icons.close,
            color: Colors.red,
          ));
          quizbrain.nextques();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 5,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                quizbrain.getname(),
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: FlatButton(
              onPressed: () {
                checkanswer(true);
              },
              color: Colors.green,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'True',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        SizedBox(
          height: 22,
        ),
        Expanded(
          flex: 1,
          child: FlatButton(
              onPressed: () {
                checkanswer(false);
              },
              color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  'False',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
              )),
        ),
        SizedBox(
          height: 22,
        ),
        Row(children: tf),
      ],
    );
  }
}
