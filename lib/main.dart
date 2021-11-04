import 'package:flutter/material.dart';

void main() {
  runApp(HomeWidget());
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Quiz'),
        ),
        body: QuestionPage(),
      ),
    );
  }
}

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  _QuestionPageState createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  bool isQuizzing = true;
  String response = '';

  @override
  Widget build(BuildContext context) {
    if (isQuizzing) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('What\'s the best ice cream flavor?'),
            ElevatedButton(
              child: Text('Vanilla'),
              onPressed: () {
                print('Vanilla');
                setState(() {
                  isQuizzing = false;
                  response = 'Vanilla';
                });
              },
            ),
            ElevatedButton(
              child: Text('Chocolate'),
              onPressed: () {
                print('Chocolate');
                setState(() {
                  isQuizzing = false;
                  response = 'Chocolate';
                });
              },
            ),
          ],
        ),
      );
    } else {
      return CompletePage(response);
    }
  }
}

class CompletePage extends StatelessWidget {
  String response = '';

  CompletePage(String response) {
    this.response = response;
  }

  @override
  Widget build(BuildContext context) {
    if (response == 'Chocolate') {
      return Center(
        child: Text('The only correct answer'),
      );
    } else {
      return Center(
        child: Text('You are wrong'),
      );
    }
  }
}
