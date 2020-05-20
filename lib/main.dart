import 'package:expenses/widgets/user_transaction.dart';
import 'package:flutter/material.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatelessWidget {
  
  // String textInput;
  // String amountInput;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracker')
      ),
      body: Column(
       
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blueAccent,
              child: Text('Chart will go here.'),
              elevation: 7,
            ),
          ),
         UserTransaction(),
        ],
      ),
    );
  }
}