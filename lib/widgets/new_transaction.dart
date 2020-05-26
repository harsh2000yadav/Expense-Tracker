import 'package:flutter/material.dart';

class NewTransaction extends StatefulWidget {

  final Function addNewTransaction;

  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  void submitData(){
     print(titleController.text);
     print(amountController.text);

     final enteredTitle = titleController.text;
     final enteredAmount = double.parse(amountController.text);

     if(enteredTitle.isEmpty || enteredAmount<=0){
       return;
     }

     widget.addNewTransaction(enteredTitle,
     enteredAmount);

     Navigator.of(context).pop();
                    
  }

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
                     onSubmitted: (_) => submitData(),
                  ),
                   TextField(
                    decoration:  InputDecoration(labelText: 'Amount'),
                     //onChanged: (val) => amountInput=val,
                     controller: amountController,
                     keyboardType: TextInputType.number,
                     onSubmitted: (_) => submitData(),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(onPressed: submitData,                     
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