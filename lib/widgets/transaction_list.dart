import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
 
   
   final List<Transaction> transactions;
   TransactionList(this.transactions);

  @override
  Widget build(BuildContext context) {
    return Column(

            children : transactions.map((tx) {
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
          );
  }
}