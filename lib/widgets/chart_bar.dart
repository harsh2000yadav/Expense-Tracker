import 'package:flutter/material.dart';

class ChartBar extends StatelessWidget {

  final String label;
  final double spendingAmt;
  final double spendingPct;


  ChartBar(this.label, this.spendingAmt, this.spendingPct);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          height: 20,
                  child: FittedBox(  
          child: Text('₹${spendingAmt.toStringAsFixed(0)}')),
        ),
        SizedBox(
          height:5,
        ),
        Container(
          height:60,
          width:13,
          child: Stack(
            children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey, width:1),
                  color: Color.fromRGBO(220, 220, 220, 1),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),

              FractionallySizedBox(
                heightFactor: spendingPct,
                child: Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColor,
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
              )
            ],
          )
        ),
        SizedBox(
          height:5
        ),
        Text(label)
      ],
    );
  }
}
