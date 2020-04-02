import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../models/transaction.dart';

class TransactionItem extends StatelessWidget {
  const TransactionItem({
    Key key,
    @required this.transaction,
    @required this.deleteTX,
  }) : super(key: key);

  final Transaction transaction;
  final Function deleteTX;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 6),
      elevation: 6,
      child: ListTile(
        leading: CircleAvatar(
          radius: 30,
          child: Padding(
            padding: const EdgeInsets.all(6),
            child: FittedBox(
                child: Text('\$${transaction.amount}')),
          ),
        ),
        title: Text(
          transaction.title,
          style: Theme.of(context).textTheme.title,
        ),
        subtitle: Text(
          DateFormat.yMMMd().format(transaction.dateTime),
        ),
        trailing: MediaQuery.of(context).size.width > 450
            ? FlatButton.icon(
          icon: Icon(Icons.delete),
          label: Text(
            'delete',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          textColor: Theme.of(context).errorColor,
          onPressed: () => deleteTX(transaction.id),
        )
            : IconButton(
          icon: Icon(Icons.delete),
          color: Theme.of(context).errorColor,
          onPressed: () => deleteTX(transaction.id),
        ),
      ),
    );
  }
}
