import 'question.dart';

class Quizbrain{
  int _no = 0;

  List<Question> _questionbank=[
    Question(q: '1.First ODI (Cricket) in India was played in Ahemadabad.', a: true),
    Question(q: '2.Goa is famous for not producing coconut.', a: true),
    Question(q: '3.Polo was originated in Assam.', a: false),
    Question(q: '4.The Khalsa was born in 1699.', a: true),
    Question(q: '5.Lata Mangeshkar won the Padma Bhushan in 1960.', a: false),
    Question(q: '6.Shakespeare wrote 37 plays.', a: true),
    Question(q: '7.The first captain of the first ODI Indian team was Sunil Gavaskar.', a: false),
    Question(q: '8.Baseball originated in Australia.', a: false),
    Question(q: '9.Red and green lights are used to indicate foul in ice hockey.', a: false),
    Question(q: '10.Ostrich\'s eyes are smaller than its brain.', a: false),
    Question(q: '11.Plants observe oxygen from atmosphere.', a: false),
    Question(q: '12.The Amateur Athletics Federation of India was established in 1946.', a: true),
    Question(q: '13.The Ramayana was written by Tulsidas.', a: false),
    Question(q: '14.Nakshatras are 27 in numbers.', a: true),
    Question(q: '15.Sunderban in West Bengal is famous for elephants.', a: false),
  ];

  void nextques(){
    if(_no<_questionbank.length-1){
      _no++;
    }
  }

  String getname(){
    return _questionbank[_no].q;
  }

  bool getanswer(){
    return _questionbank[_no].a;
  }

  bool isFinished(){
    if(_no>=_questionbank.length-1){
      print("return true");
      return true;
    }
    else{
      return false;
    }
  }

  void reset(){
    _no=0;
  }

}