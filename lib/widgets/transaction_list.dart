import 'package:expenses/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transactions;
  final Function deleteTxn; 
  TransactionList(this.transactions, this.deleteTxn);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transactions.isEmpty
          ? Column(
              children: <Widget>[
                Text('No Transactions yet.',
                    style: Theme.of(context).textTheme.headline6),
                SizedBox(
                  height: 30,
                ),
                Container(
                    height: 200,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    ))
              ],
            )
          : ListView.builder(
              itemBuilder: (ctx, index) {
                // return Card(
                //   child: Row(
                //     children: <Widget>[
                //       Container(
                //         margin: EdgeInsets.symmetric(
                //           horizontal:25,
                //           vertical:20
                //         ),
                //         decoration: BoxDecoration(
                //           borderRadius: BorderRadius.all(Radius.circular(7)),
                //           border: Border.all(
                //             color: Colors.deepPurple,
                //             style: BorderStyle.solid,
                //             width: 2
                //           ),
                //         ),
                //         padding: EdgeInsets.all(10),
                //         child: Text(
                //           '₹${transactions[index].amount}',
                //         style: TextStyle(
                //           color: Colors.purple,
                //           fontSize: 18,
                //           fontWeight: FontWeight.bold,

                //         ),)
                //       ),
                //       Column(
                //         children: <Widget>[
                //           Text(transactions[index].title,
                //           style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             fontSize: 15
                //           ),),
                //           Text(
                //             DateFormat().add_yMMMEd().format(transactions[index].date),
                //           style: TextStyle(
                //             fontSize: 12,
                //             color: Colors.grey

                //           ),),
                //         ],
                //         crossAxisAlignment: CrossAxisAlignment.start,
                //       )
                //     ],
                //   )
                // );

                return Card(
                    margin: EdgeInsets.symmetric(vertical: 8, horizontal: 7),       
                    elevation: 6,
                    child: ListTile(
                    leading: CircleAvatar(
                      radius: 30,
                      child: Padding(
                          padding: EdgeInsets.all(6),
                          child: FittedBox(
                              child: Text('₹${transactions[index].amount}'))),
                    ),
                    title: Text(transactions[index].title, style: Theme.of(context).textTheme.headline6,),
                    subtitle: Text(DateFormat.yMMMEd().format(transactions[index].date)),
                    trailing: IconButton(icon: Icon(Icons.delete),
                              color: Colors.redAccent,
                              onPressed: () => deleteTxn(transactions[index].id)),
                  ),
                );
              },
              itemCount: transactions.length,
            ),
    );
  }
}
