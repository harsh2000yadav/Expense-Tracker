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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
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
          Column(

            children : transaction.map((tx) {
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal:25,
                        vertical:20
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.purple,
                          style: BorderStyle.solid,
                          width: 2
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(tx.amount.toString())
                    ),
                    Column(
                      children: <Widget>[
                        Text(tx.title),
                        Text(tx.amount.toString()),
                      ],
                    )
                  ],
                )
              );
            } ).toList(),
          ),
        ],
      ),
    );
  }
}