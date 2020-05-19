import 'package:flutter/material.dart';

class NewTransaction extends StatelessWidget {

  final titleController = TextEditingController();
  final amountController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Card(
            child: Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  TextField(
                    decoration:  InputDecoration(labelText: 'Title'),
                    //onChanged: (val) => textInput=val,
                    controller: titleController,
                  ),
                   TextField(
                    decoration:  InputDecoration(labelText: 'Amount'),
                     //onChanged: (val) => amountInput=val,
                     controller: amountController,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(onPressed: (){
                      print(titleController.text);
                      print(amountController.text);
                    },
                    child:Text('Add Transaction'),
                    color: Colors.deepPurpleAccent,
                    textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),elevation: 5,
          );
  }
}