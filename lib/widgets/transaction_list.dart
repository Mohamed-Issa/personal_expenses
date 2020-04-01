import 'package:flutter/material.dart';
import 'package:fluttercompleteguide2/models/transaction.dart';
import 'package:intl/intl.dart';

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
              return Card(
                margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
                elevation: 6,
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 30,
                    child: Padding(
                      padding: const EdgeInsets.all(6),
                      child: FittedBox(
                          child: Text('\$${transaction[index].amount}')),
                    ),
                  ),
                  title: Text(
                    transaction[index].title,
                    style: Theme.of(context).textTheme.title,
                  ),
                  subtitle: Text(
                    DateFormat.yMMMd().format(transaction[index].dateTime),
                  ),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    color: Theme.of(context).errorColor,
                    onPressed: () => deleteTX(transaction[index].id),
                  ),
                ),
              );
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
