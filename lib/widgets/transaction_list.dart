import 'package:flutter/material.dart';
import '../models/transaction.dart';
import 'transaction_item.dart';

class TransactionList extends StatelessWidget {
  final List<Transaction> transaction;
  final Function deleteTX;

  TransactionList(this.transaction, this.deleteTX);

  @override
  Widget build(BuildContext context) {
    return transaction.isEmpty
        ? LayoutBuilder(builder: (ctx, constraints) {
            return Column(
              children: <Widget>[
                Text(
                  'No Transaction added yet',
                  style: Theme.of(context).textTheme.title,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    height: constraints.maxHeight * 0.7,
                    child: Image.asset(
                      'assets/images/waiting.png',
                      fit: BoxFit.cover,
                    )),
              ],
            );
          })
        : ListView.builder(
            itemCount: transaction.length,
            itemBuilder: (ctx, index) {
              return TransactionItem(transaction: transaction[index], deleteTX: deleteTX);
//                return Card(
//                  child: Row(
//                    children: <Widget>[
//                      Container(
//                        child: Text(
//                            '\$${transaction[index].amount.toStringAsFixed(2)}',
//                            style: TextStyle(
//                              color: Theme.of(context).primaryColor,
//                              fontWeight: FontWeight.bold,
//                              fontSize: 20,
//                            )),
//                        margin:
//                            EdgeInsets.symmetric(vertical: 10, horizontal: 15),
//                        decoration: BoxDecoration(
//                            border: Border.all(
//                          color: Theme.of(context).primaryColor,
//                          width: 2,
//                        )),
//                        padding: EdgeInsets.all(10),
//                      ),
//                      Column(
//                        crossAxisAlignment: CrossAxisAlignment.start,
//                        children: <Widget>[
//                          Text(
//                            transaction[index].title,
//                            style: Theme.of(context).textTheme.title,
//                          ),
//                          Text(
//                            DateFormat.yMMMMd()
//                                .format(transaction[index].dateTime),
//                            style: TextStyle(
//                              color: Colors.grey,
//                            ),
//                          ),
//                        ],
//                      )
//                    ],
//                  ),
//                );
            },
          );
  }
}

