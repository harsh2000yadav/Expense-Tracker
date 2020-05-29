import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewTransaction extends StatefulWidget {

  final Function addNewTransaction;


  NewTransaction(this.addNewTransaction);

  @override
  _NewTransactionState createState() => _NewTransactionState();
}

class _NewTransactionState extends State<NewTransaction> {
  final titleController = TextEditingController();

  final amountController = TextEditingController();

  DateTime _selectedDate;
  void submitData(){
     print(titleController.text);
     print(amountController.text);

     final enteredTitle = titleController.text;
     final enteredAmount = double.parse(amountController.text);

     if(enteredTitle.isEmpty || enteredAmount<=0 || _selectedDate == null){
       return;
     }

     widget.addNewTransaction(enteredTitle,
     enteredAmount,
     _selectedDate);

     Navigator.of(context).pop();
                    
  }

  void _presentDatePicker(){
    showDatePicker(context: context,
     initialDate: DateTime.now(),
     firstDate: DateTime(2020),
     lastDate: DateTime.now()).then((pickedDate){
       if(pickedDate == null)
       return;

      setState(() {
        _selectedDate = pickedDate;
      });
       
     });
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
                      height: 70,
                      child: Row(
                      children: <Widget>[
                        Expanded(
                           child: Text(_selectedDate == null ? 'No Date Chosen!': 
                          'Picked Date: ${DateFormat.yMEd().format(_selectedDate)}'),
                        ),
                        FlatButton(onPressed: _presentDatePicker,
                        textColor: Theme.of(context).primaryColor,
                        child: Text('Choose Date',
                        style: TextStyle(fontWeight: FontWeight.bold),))
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: RaisedButton(onPressed: submitData,                     
                    child:Text('Add Transaction'),
                    color: Theme.of(context).primaryColor,
                    textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),elevation: 5,
          );
  }
}