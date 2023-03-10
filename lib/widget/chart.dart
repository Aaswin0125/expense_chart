import 'package:flutter/material.dart';
import 'package:chart/model/transaction.dart';
import 'package:intl/intl.dart';

class Chart extends StatelessWidget {
late final List<Transaction> recentTransactions;
Chart(this.recentTransactions);

List<Map<String,Object>> get groupedTransactionValues{
   return List.generate(7, (index) {
     final weekday = DateTime.now().subtract(Duration(days: index));
     var totalsum= 0.0;

     for(var i = 0 ; i < recentTransactions.length; i++){
       if(recentTransactions[i].date.day==weekday.day
           && recentTransactions[i].date.month==weekday.month
            && recentTransactions[i].date.year== weekday.year){
         totalsum += recentTransactions[i].amount;
       }
     }

     return {'day':DateFormat.E().format(weekday).substring(0,1),
              'amount': totalsum
     };
   }).reversed.toList();

 }
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(20),
      child: Row(
        children: groupedTransactionValues.map((data){
          return Text('${data['day']}:${data['amount']}');
        }).toList(),
      ),
    );
  }
}
