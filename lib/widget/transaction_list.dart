import 'package:flutter/material.dart';
import '../model/transaction.dart';
import 'package:intl/intl.dart';

class TransactionList extends StatelessWidget {
  final Function deletetx;
final List<Transaction>transaction;
TransactionList(this.transaction,this.deletetx);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: transaction.isEmpty ? Column(
        children: [
          const Text('NO TRANSACTIONS ADDED YET'),
          SizedBox(height: 50,),
          Container(
            height: 200,
              child: Image.asset('assets/images/waiting.png',fit: BoxFit.cover,))
        ],
      ) : ListView.builder(
        itemBuilder:(ctx,index){
          return Card(
            elevation: 5,
            margin: EdgeInsets.symmetric(
              vertical: 8,
              horizontal: 5
            ),
            child: ListTile(
              leading: CircleAvatar(
                radius: 30,
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: FittedBox(
                      child: Text('\$${transaction[index].amount.toStringAsFixed(2)}')),
                ),),
              title: Text(transaction[index].title,),
              subtitle: Text(DateFormat.yMMMd().format(transaction[index].date)),
              trailing: IconButton(onPressed: ()=>deletetx(transaction[index].id)
                  , icon: Icon(Icons.delete)),
            ),
          );
        } ,
        itemCount: transaction.length,
      ),
    );
  }
}
