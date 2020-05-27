import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {

final List<Transaction> recentTxn;

Chart(this.recentTxn);

List<Map<String, Object>> get groupedTxnVal{
  return List.generate(7, (index){
    final weekDay = DateTime.now().subtract(Duration(days: index));
    double totalSum = 0.0;

    for(var i = 0; i< recentTxn.length; i++){
      if(recentTxn[i].date.day == weekDay.day
      && recentTxn[i].date.month == weekDay.month 
      && recentTxn[i].date.year == weekDay.year){
          totalSum += recentTxn[i].amount;
      }
    }

    return {'day': DateFormat.E().format(weekDay), 'amount' : totalSum};
  });
}

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
    );
  }
}