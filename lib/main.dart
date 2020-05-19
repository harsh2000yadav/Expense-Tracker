
import 'package:expenses/widgets/new_transaction.dart';
import 'package:expenses/widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';


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
          NewTransaction(),
          TransactionList(),
        ],
      ),
    );
  }
}