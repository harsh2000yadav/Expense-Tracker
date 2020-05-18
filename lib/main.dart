
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
          Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration:  InputDecoration(labelText: 'Title'),
                  ),
                   TextField(
                    decoration:  InputDecoration(labelText: 'Amount'),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(onPressed: (){},
                    child:Text('Add Transaction'),
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),elevation: 5,
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
                        borderRadius: BorderRadius.all(Radius.circular(7)),
                        border: Border.all(
                          color: Colors.deepPurple,
                          style: BorderStyle.solid,
                          width: 2
                        ),
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        '₹${tx.amount}',
                      style: TextStyle(
                        color: Colors.purple,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        
                      ),)
                    ),
                    Column(
                      children: <Widget>[
                        Text(tx.title,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 15
                        ),),
                        Text(
                          DateFormat().add_yMMMEd().format(tx.date),
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey
                          
                        ),),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
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