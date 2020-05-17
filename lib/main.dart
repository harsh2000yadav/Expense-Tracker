import 'package:expenses/transaction.dart';
import 'package:flutter/material.dart';
import './transaction.dart';

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
  final List<Transaction> transaction =[
    Transaction(id: 't1', title: 'Mobile Recharge', amount: 450 , date: DateTime.now()),
    Transaction(id: 't2', title: 'Watch', amount: 4500 , date: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Expenses Tracker')
      ),
      body: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            child: Card(
              color: Colors.blueAccent,
              child: Text('Chart will go here.'),
              elevation: 7,
            ),
          ),
          Card(
            color: Colors.tealAccent,
            child: Text('Transaction List')
          )
        ],
      ),
    );
  }
}