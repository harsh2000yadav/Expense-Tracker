import 'package:expenses/widgets/new_transaction.dart';
import './widgets/transaction_list.dart';
import 'package:flutter/material.dart';
import './models/transaction.dart';

void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Expense Tracker',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        accentColor: Colors.amberAccent,
        fontFamily: 'QuickSand',
        appBarTheme: AppBarTheme(
          textTheme: ThemeData.light().textTheme.copyWith(
            headline6: TextStyle(
              fontFamily: 'OpenSans',
              fontSize: 20,
              fontWeight: FontWeight.bold
            )
          )
        )
      ),
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  
  // String textInput;
  // String amountInput;


  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final List<Transaction> _userTransactions =[
    // Transaction(id: 't1', title: 'Mobile Recharge', amount: 450 , date: DateTime.now()),
    // Transaction(id: 't2', title: 'Watch', amount: 4500 , date: DateTime.now()),
   ];

   void _addNewTransaction(String txTitle, double txAmount){
     final newTx = Transaction(id: DateTime.now().toString(), title: txTitle, amount: txAmount, date: DateTime.now());

     setState(() {
       _userTransactions.add(newTx);
     });
   }


  void _startAddNewTransaction(BuildContext ctx){
    showModalBottomSheet(context: ctx,
     builder: (_) {
       return GestureDetector(child: NewTransaction(_addNewTransaction),
       onTap: (){},
       behavior: HitTestBehavior.opaque,
       );
     });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('Expenses Tracker'),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.add_circle), onPressed: () => _startAddNewTransaction(context))
        ],
      ),
      body:  Column(
      
         
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
           TransactionList(_userTransactions),
          ],
        
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _startAddNewTransaction(context)),
    );
  }
}